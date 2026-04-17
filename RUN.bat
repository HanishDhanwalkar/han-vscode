@echo off
setlocal enabledelayedexpansion

set "BASE_DIR=%~dp0"
set "BASE_DIR=%BASE_DIR:~0,-1%"

:: Quick Validation
if not exist "%BASE_DIR%\.nvmrc" (echo Error: .nvmrc missing. && pause && exit /b 1)
set /p NODE_VERSION=<"%BASE_DIR%\.nvmrc"
set "NODE_FOLDER_NAME=node-v%NODE_VERSION%-win-x64"
set "NODE_DIR=%BASE_DIR%\.installation_tools\%NODE_FOLDER_NAME%"

if not exist "%NODE_DIR%" (
    echo Error: Node folder not found. Please run INSTALL.bat first to unzip.
    pause && exit /b 1
)

echo Setting up environment...
if exist V:\ subst V: /d
subst V: "%BASE_DIR%"

set "VCVARS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
call "%VCVARS_PATH%"
set "PATH=V:\.installation_tools\%NODE_FOLDER_NAME%;%PATH%"
set "JOBS=1"

echo Launching Code - OSS...
cd /d V:\

if not exist "out\main.js" (
    echo Error: Build files missing. Run INSTALL.bat first.
    pause && exit /b 1
)

call scripts\code.bat