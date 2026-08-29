@echo off
setlocal

echo ==========================================
echo       Pushing Project to GitHub
echo ==========================================
echo.

REM Initialize Git repository if it doesn't exist
if not exist ".git" (
    echo [1/6] Initializing Git repository...
    git init
) else (
    echo [1/6] Git repository already initialized.
)

echo.
echo [2/6] Checking Git status...
git status

echo.
echo [3/6] Adding project files...
git add .

echo.
echo [4/6] Creating commit...
git commit -m "latest"

echo.
echo [5/6] Setting main branch...
git branch -M main

echo.
echo [6/6] Configuring GitHub remote...

REM Add remote if it doesn't already exist
git remote get-url origin >nul 2>&1

if %errorlevel% equ 0 (
    echo Origin already exists. Updating it...
    git remote set-url origin https://github.com/maabbiicsnv-lab/dabba.git
) else (
    echo Adding GitHub origin...
    git remote add origin https://github.com/maabbiicsnv-lab/dabba.git
)

echo.
echo ==========================================
echo          Pushing to GitHub...
echo ==========================================
echo.

git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ==========================================
    echo       SUCCESS! Project pushed to GitHub.
    echo ==========================================
) else (
    echo.
    echo ==========================================
    echo       ERROR: Push failed.
    echo ==========================================
    echo.
    echo Make sure:
    echo 1. Git is installed.
    echo 2. You are authenticated with GitHub.
    echo 3. You have permission to push to the repository.
)

echo.
pause
endlocal