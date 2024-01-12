#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Function to check if a command exists
command_exists() {
  type "$1" &> /dev/null
}

# Check if 'git' and 'curl' are installed
if ! command_exists git || ! command_exists curl; then
  echo "Error: git and curl are required."
  exit 1
fi

# Clone the repository
REPO_URL="https://github.com/jaredsburrows/android-gif-example"
REPO_DIR="android-gif-example"
rm -rf "$REPO_DIR"
git clone "$REPO_URL" &>/dev/null
cd "$REPO_DIR"

# Fetch the last 10 Gradle versions
versions=$(curl -s https://services.gradle.org/versions/all | \
  grep -o '"[0-9]\+\.[0-9]\+\(\.[0-9]\+\)\?"' | \
  tr -d '"' | \
  head -10)

# Check if versions were fetched successfully
if [ -z "$versions" ]; then
  echo "Error: Failed to fetch Gradle versions."
  exit 1
fi

# Function to download Gradle versions
download_gradle_version() {
  version=$1
  echo "Downloading Gradle $version"
  ./gradlew wrapper --gradle-version="$version" --distribution-type=all &>/dev/null
  ./gradlew wrapper --gradle-version="$version" --distribution-type=bin &>/dev/null
}

# Download the last 10 releases
for version in $versions; do
  download_gradle_version "$version"
done

# Cleanup
cd ..
rm -rf "$REPO_DIR"
