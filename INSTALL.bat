@echo off
setlocal enabledelayedexpansion

:: BASE_DIR is now the hancode folder itself
set "BASE_DIR=%~dp0"
set "BASE_DIR=%BASE_DIR:~0,-1%"

echo [1/6] Checking Prerequisites...
where git >nul 2>nul || (echo Error: Git not found. && pause && exit /b 1)
where python >nul 2>nul || (echo Error: Python not found. && pause && exit /b 1)

:: Check for VS Build Tools
set "VCVARS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"
if not exist "%VCVARS_PATH%" (
    echo Error: VS 2022 Build Tools not found at: "%VCVARS_PATH%"
    pause && exit /b 1
)

:: Detect Node version from .nvmrc
if not exist "%BASE_DIR%\.nvmrc" (
    echo Error: .nvmrc not found in "%BASE_DIR%"
    pause && exit /b 1
)
set /p NODE_VERSION=<"%BASE_DIR%\.nvmrc"
set "NODE_FOLDER_NAME=node-v%NODE_VERSION%-win-x64"
set "NODE_DIR=%BASE_DIR%\.installation_tools\%NODE_FOLDER_NAME%"
set "NODE_ZIP=%BASE_DIR%\.installation_tools\%NODE_FOLDER_NAME%.zip"

:: --- UNZIP LOGIC ---
if not exist "%NODE_DIR%" (
    echo [2/6] Node not found. Checking for zip...
    if exist "%NODE_ZIP%" (
        echo Unzipping %NODE_FOLDER_NAME%.zip...
        powershell -Command "Expand-Archive -Path '%NODE_ZIP%' -DestinationPath '%BASE_DIR%\.installation_tools' -Force"
        if errorlevel 1 (echo Error: Extraction failed. && pause && exit /b 1)
    ) else (
        echo Error: Neither the Node folder nor the Zip file were found in .installation_tools.
        echo Expected: "%NODE_ZIP%"
        pause && exit /b 1
    )
) else (
    echo [2/6] Node.js is already unzipped and ready.
)

echo [3/6] Mapping Drive V: to %BASE_DIR%...
:: Note: We map V: directly to hancode now
if exist V:\ subst V: /d
subst V: "%BASE_DIR%"
if errorlevel 1 (echo Error: Failed to map V: drive. && pause && exit /b 1)

echo [4/6] Setting up environment...
call "%VCVARS_PATH%"
set "PATH=V:\.installation_tools\%NODE_FOLDER_NAME%;%PATH%"
set "JOBS=1"

echo [5/6] Running NPM Install...
cd /d V:\
call npm install

echo [6/6] Compiling...
call npm run compile
call node build\lib\preLaunch.ts

echo.
echo Installation and Build Complete!
pause