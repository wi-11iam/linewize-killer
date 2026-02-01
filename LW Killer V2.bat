@echo off
setlocal enabledelayedexpansion
title Multi‑Process Watcher

rem Space‑separated list of process image names
set PROCESSES=notepad.exe classroom.plugin.exe vesktop.exe

echo Watching processes:
echo %PROCESSES%
echo Press Ctrl+C to stop.
echo.

:loop
for %%P in (%PROCESSES%) do (
    tasklist /FI "IMAGENAME eq %%P" | find /I "%%P" >nul
    if not errorlevel 1 (
        taskkill /F /IM "%%P" >nul 2>&1
        echo [%TIME%] Killed process %%P
    )
)

timeout /t 1 /nobreak >nul
goto loop
