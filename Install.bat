@echo off
title Install IXC Music
echo Installing (no admin rights needed)...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\install.ps1" %*
echo.
pause

