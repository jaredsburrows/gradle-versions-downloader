# Gradle Versions Downloader

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![Build](https://github.com/jaredsburrows/gradle-versions-downloader/workflows/build/badge.svg)](https://github.com/jaredsburrows/gradle-versions-downloader/actions)
[![Twitter Follow](https://img.shields.io/twitter/follow/jaredsburrows.svg?style=social)](https://twitter.com/jaredsburrows)

When building a new Gradle-based project, you might have to download a version of Gradle that you may not have yet. This repository downloads an Android project([Android Gif Example](https://github.com/jaredsburrows/android-gif-example)), attempts to download and run `gradlew wrapper` on the project with different versions, starting with the latest release/release candidate.

**Running the script:**

    $ ./versions-downloader.sh

## License

    Copyright (C) 2019 Jared Burrows

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

