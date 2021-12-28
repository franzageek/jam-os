@echo off
title Updating software...
mode 35,4
color 9f
echo Updating.
cd..\..
cls
echo Updating..
move %cd%\system\updatefiles\system.jamx %cd%\system\sys.jamupd
cls
cd system
echo Updating...
if exist system.bat if not exist system.jamx del system.bat
if not exist system.bat if exist system.jamx del system.jamx
cls
echo Updating.
rename sys.jamupd system.jamx
cls
cd ..\
cd boot
echo Updating..
rename reset.jamx reset.bat
cls
echo Updating...
start reset.bat
exit
