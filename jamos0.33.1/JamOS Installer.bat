@echo off
SET mypath=%~dp0

for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set today=%year%.%month%.%day%

set ver=0.33.1
set kernel=JamOS OpenWise 2022
set titlex=JamOS 0.33.1 build 4357

mode con: cols=120 lines=30

chcp 65001

set forbname1=jamos
set forbname2=superuser

title JamOS 0.33.1 Installation (BETA)
:1of4
cls
echo.
echo      _______________________________       __________
echo      JamOS Beta Installation v%ver%       (step 1/4)
echo      _______________________________       __________
echo.
echo.
echo      Welcome to JamOS' first boot!
echo.
echo      We need to set up some things before you start using it.
echo      This setup will prepare JamOS to be able to run on your PC.
echo.
echo      - Press ENTER if you want to continue
echo      - Close the setup window if you want to abort
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.       JamOS is still in development. You are now using a beta. & pause >nul

cls
:defunset
cls
color 07
set "user=JamOS%random%"
:2of4
cls
echo.
echo      _______________________________       __________
echo      JamOS Beta Installation v%ver%       (step 2/4)
echo      _______________________________       __________
echo.
echo.
echo      First, how do you want to be called?
echo.
echo      Enter your username and press ENTER to continue:
echo      (If you leave the username blank, the system will assign you random username)
echo.
set /p user=^>

if "%user%" equ " " set "user=JamOS%random%"
if "%user%" equ "" set "user=JamOS%random%"
if "%user%" equ "%forbname1%" goto unwrong
if "%user%" equ "%forbname2%" goto unwrong  
if "%user%" equ "random" goto randomun
if "%user%" equ "null" set "user=1"
if "%user%" equ "nul" set "user=1"
if "%user%" equ "con" set "user=1"
if "%user%" equ "aux" set "user=1"
if "%user%" equ "1" goto err

goto unok

:randomun
set user=jamuser%random%
godo unok

:unwrong
cls
echo.
echo      _______________________________       __________
echo      JamOS Beta Installation v%ver%       (step 2/4)
echo      _______________________________       __________
echo.      
echo.
echo        You can't use this username! Please select a different one.
echo.
echo         - Press ENTER to select the username again
echo.
echo.    
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.       ERR: BAD_USERNAME & pause >nul
cls
goto :2of4

:unok 
if not exist "%mypath:~0,-1%\data\" mkdir data
goto datawr

:datawr
cd data
cls
echo.
echo      _______________________________       __________
echo      JamOS Beta Installation v%ver%       (step 2/4)
echo      _______________________________       __________
echo.      
echo.
echo        Writing data...
echo %user%> user.jamdat
echo %kernel%>> kernel.jamdat
echo %titlex%>> title.jamdat
echo %ver%>> version.jamdat
if not exist "%mypath:~0,-1%\data\" mkdir data
echo.
echo        Done! Press ENTER to continue...
echo.
echo.  
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.        & pause >nul

cd..
if not exist "%mypath:~0,-1%\boot\" mkdir boot
goto :3of4

:3of4
set bar=#
goto bar
:bar
cls
echo.
echo      _______________________________       __________
echo      JamOS Beta Installation v%ver%       (step 3/4)
echo      _______________________________       __________
echo.      
echo.
echo      Finishing up...
echo.
echo      ----------------------------------------------------------------
echo      - Checking files errors       [%bar%]
set bar=#%bar%
if "%bar%"=="#############################" goto dn
ping localhost -n 1 > nul
goto bar
ping localhost -n 2 >nul
:dn
set bar=############################
cd boot
if not exist reset.jamins set reset=1
if not exist boot.jamins set boot=1
if not exist shutdown.jamins set sdown=1
cd..
if not exist "%mypath:~0,-1%\core\" mkdir core
if not exist "%mypath:~0,-1%\system\" mkdir system

cd core
if not exist system.jamapp set systeminfo=1

cd..
cd system
if not exist system.jamins set system=1
if not exist insb.bat set insb=1
cd..

if /i "%systeminfo%"=="1" goto err
if /i "%boot%"=="1" goto err
if /i "%reset%"=="1" goto err
if /i "%system%"=="1" goto err
if /i "%insb%"=="1" goto err
if /i "%sdown%"=="1" goto err

echo      √ Complete!
echo      ----------------------------------------------------------------
echo. 
echo      ----------------------------------------------------------------
echo      - Applying filesystem changes [%bar%]

cd boot
rename shutdown.jamins shutdown.jamx
rename reset.jamins reset.jamx
rename boot.jamins boot.jamx
cd..\
cd system
rename system.jamins system.jamx

echo      √ Complete!
echo      ----------------------------------------------------------------
echo. 
echo      ----------------------------------------------------------------
echo      - Saving configuration        [%bar%]

cd ..\
cd data
echo ##INSTALLED## %date% %time% on %mypath% >>installed.jamdat
cd ..\

echo      √ Complete!
echo      ----------------------------------------------------------------
echo. 
echo      ----------------------------------------------------------------
echo      - Checking folders            [##################]

if not exist "%mypath:~0,-1%\core\" mkdir core
if not exist "%mypath:~0,-1%\system\" mkdir system
if not exist "%mypath:~0,-1%\log\" mkdir log
if not exist "%mypath:~0,-1%\data\" mkdir data

cls
echo.
echo      _______________________________       __________
echo      JamOS Beta Installation v%ver%       (step 4/4)
echo      _______________________________       __________
echo.      
echo.
echo      Finishing up...
echo.
echo      ----------------------------------------------------------------
echo      - Checking files errors       [%bar%]
echo      √ Complete!
echo      ----------------------------------------------------------------
echo. 
echo      ----------------------------------------------------------------
echo      - Applying filesystem changes [%bar%]
echo      √ Complete!
echo      ----------------------------------------------------------------
echo. 
echo      ----------------------------------------------------------------
echo      - Saving configuration        [%bar%]
echo      √ Complete!
echo      ----------------------------------------------------------------
echo. 
echo      ----------------------------------------------------------------
echo      - Checking folders            [%bar%]
echo      √ Complete!
echo      ----------------------------------------------------------------
echo.
echo      # Press ENTER to complete installation...
pause >nul
move "%mypath:~0,-1%\system\insb.bat" "%mypath:~0,-1%"
rename insb.bat JamOS.bat
start %mypath:~0,-1%\JamOS.bat
exit

:err
title JamOS Boot Error
cls
color 1F
echo JAMOS OPENWISE %ver% - ERROR
echo.
echo Collecting informations...
for %%d in ( A L Z ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A L Z A L Z A L Z A L A S A S A ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A ) do echo.|set /p=.
ping -n 1 localhost >nul
for %%d in ( A A A A A A A ) do echo.|set /p=.
ping -n 2 localhost >nul
echo.
echo An error occurred while trying to start the system!
echo Error report:
ping -n 2 localhost >nul
echo.
echo JAMOS OPENWISE %ver%
echo KERNEL: %kernel%
ping -n 1 localhost >nul
echo BUILD: %titlex%
echo TIME: %date% %time%
set errid=%random%
echo ID: %errid%
echo List of errors:
echo.

:errors
if /i "%user%"=="1" goto baduname
if /i "%systeminfo%"=="1" goto nosysinfo
if /i "%boot%"=="1" goto noboot
if /i "%reset%"=="1" goto noreset
if /i "%system%"=="1" goto nosys
if /i "%insb%"=="1" goto noinsb
if /i "%sdown%"=="1" goto nosd


:finalmsg
echo.
echo Please fix these errors and start again!
if not exist "%mypath:~0,-1%\core\" mkdir core
if not exist "%mypath:~0,-1%\system\" mkdir system
if not exist "%mypath:~0,-1%\log\" mkdir log
if not exist "%mypath:~0,-1%\data\" mkdir data
cd %mypath%
pause >nul
exit

:nosysinfo
echo Missing file - /core/system.jamapp
set systeminfo=0
goto errors

:noboot
echo Missing file - /boot/boot.jamins
set boot=0
goto errors

:noreset
echo Missing file - /boot/reset.jamins
set reset=0
goto errors

:nosd
echo Missing file - /boot/shutdown.jamins
set sdown=0
goto errors

:nosys
echo Missing file - /system/system.jamins
set system=0
goto errors

:noinsb
echo Missing file - /system/insb.bat
set insb=0
goto errors

:baduname
echo Bad username - null, con, aux cannot be used as a username. Please choose a different one.
set user=0
goto errors