#!/bin/bash

# Download a project that uses Gradle that has Java and Android dependencies
rm -rf android-gif-example
git clone https://github.com/jaredsburrows/android-gif-example &>/dev/null
cd android-gif-example

# Download list of the versions of Gradle
versions=( $(curl -s https://services.gradle.org/versions/all | awk -F'"' '$2=="version"{print $4}' | grep -isE ^[0-9].[0-9]$ | head -n 10) )

# Download the last 10 releases
for version in "${versions[@]}"
do
  echo "Downloading Gradle $version"

  # Download both "bin" and "all" versions
  ./gradlew wrapper --gradle-version=$version --distribution-type=all &>/dev/null
  if [ $? -ne 0 ]
  then
    break
  fi
  ./gradlew wrapper --gradle-version=$version --distribution-type=bin &>/dev/null
  if [ $? -ne 0 ]
  then
    break
  fi
done

# Cleanup
rm -rf android-gif-example
cd ..

# Download the last 10 releases
for version in "${versions[@]}"
do
  echo "Downloading Gradle $version"

  # Download both "bin" and "all" versions
  ./gradlew wrapper --gradle-version=$version --distribution-type=all &>/dev/null
  ./gradlew wrapper --gradle-version=$version --distribution-type=bin &>/dev/null
done

