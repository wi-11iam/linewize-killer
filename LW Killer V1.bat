@echo off
setlocal enabledelayedexpansion

set PROCESS_NAME=classroom.plugin.exe
title Process Watcher - %PROCESS_NAME%

echo Watching for %PROCESS_NAME%...
echo Press Ctrl+C to stop.
echo.

:loop
tasklist /FI "IMAGENAME eq %PROCESS_NAME%" | find /I "%PROCESS_NAME%" >nul
if not errorlevel 1 (
    taskkill /F /IM "%PROCESS_NAME%" >nul 2>&1
    echo [%TIME%] Killed process %PROCESS_NAME%
)
timeout /t 1 /nobreak >nul
goto loop
