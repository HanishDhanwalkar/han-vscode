# Hancode - Open Source ("Code - OSS")

This repository is a fork of the `Code - OSS` repository, optimized for local AI agent orchestration and customized development workflows. The source code is available under the [MIT license](LICENSE.txt).

## Directory Structure

To ensure the automated build and run scripts function correctly, your folders must be organized as follows to bypass Windows path length and space limitations:

```text
vscode_cloning/              <-- Parent Folder
├── .tools/                  <-- Portable Build Tools directory
│   └── node-v<version>-win-x64/ 
└── hancode/                 <-- This Repository
    ├── INSTALL.bat
    ├── RUN.bat
    └── .nvmrc
```

## Setup and Installation

To build and run Hancode from source on a Windows machine, ensure you have the following installed:

* **Git**: [Download here](https://git-scm.com/download/win)
* **Python 3.x**: Ensure it is added to your PATH.
* **Visual Studio Build Tools 2022**: Include the "Desktop development with C++" workload.
* **Portable Node.js**: Use the version specified in `.nvmrc`.

## Setup and Installation

For a streamlined setup on a Windows machine, the project includes automated scripts located within the `hancode` directory.

### 1. Build the Project

Run the `INSTALL.bat` script from within the `hancode` folder. This script will:

* Validate your prerequisites.
* Detect the required Node.js version.
* Map a virtual drive (`V:`) to handle long file paths and spaces.
* Install dependencies and compile the source code.

### 2. Run Hancode

Once the build is complete, use the `RUN.bat` script to launch the application. This script ensures the environment is correctly mapped and initialized before starting the editor.

Project directory:
Main Project Root/
├── .tools/
│   └── node-v22.22.1-win-x64/   <-- (Name must match .nvmrc)
└── hancode/
    ├── INSTALL.bat
    ├── RUN.bat
    └── .nvmrc

## Contributing

If you are interested in contributing to Hancode:

* Review the [Coding Guidelines](https://github.com/microsoft/vscode/wiki/Coding-Guidelines).
* Follow the standard development workflow for debugging and testing.

## Feedback and Community

* **Bugs and Features**: Please use the GitHub issues tab to report problems or suggest new features.
* **Discussions**: Connect with the community via GitHub Discussions to share ideas on local agent orchestration.

## License

Copyright (c) Microsoft Corporation. All rights reserved.
[cite_start]Licensed under the [MIT](LICENSE.txt) license. [cite: 1]
