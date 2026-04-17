# Hancode - Open Source ("Code - OSS")

This repository is a fork of the `Code - OSS` repository, optimized for local AI agent orchestration and customized development workflows. The source code is available under the [MIT license](LICENSE.txt).

## Directory Structure

To ensure the automated build and run scripts function correctly, your folders must be organized as follows. The scripts use a virtual drive mapping to bypass Windows path length limitations.

```text
hancode/                     <-- Root Folder (This Repository)
├── .installation_tools/     <-- Build tools and Node.js zip/folder
│   └── node-v<version>-win-x64.zip
├── .nvmrc                   <-- Defines required Node version
├── INSTALL.bat              <-- Automated Installation Script
└── RUN.bat                  <-- Application Launch Script
```

## Setup and Installation

### 1. Prerequisites (Windows)

Ensure the following are installed and configured on your system:

* **Git**: Required for source control and cloning.
* **Python 3.x**: Must be installed with the "Add to PATH" option enabled.
* **Visual Studio Build Tools 2022**: Install the **Desktop development with C++** workload (MSVC v143 + Windows SDK).

### 3. Build the Project

Run **`INSTALL.bat`** from the `hancode` root directory.

```bash
./INSTALL.bat
```

### 4. Run Hancode

Once the build is successful, use **`RUN.bat`** in the root folder to launch the application.

```bash
./RUN.bat
```

OR

1. run full vscode using:

    ```bash
    ./scripts/code.bat
    ```

1. run vscode cli:

    ```bash
    ./scripts/code-cli.bat
    ```

1. run vscode web:

    ```bash
    ./scripts/code-web.bat
    ```

1. run vscode server:

    ```bash
    ./scripts/code-server.bat
    ```

## Troubleshooting

* **Long Build Times**: Ensure Windows Defender or other antivirus software is not scanning the `V:` drive or the `.installation_tools` directory.
* **Terminal Errors**: If the integrated terminal fails to load `conpty.node`, run `npm rebuild node-pty` within the mapped environment.
