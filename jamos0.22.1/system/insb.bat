@echo off
if not exist "JamOS Installer.bat" goto boot
del "JamOS Installer.bat"

:boot
cd boot
rename boot.jamx boot.bat
start boot.bat >nul
exit