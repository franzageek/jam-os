@echo off
cd "%~dp0"
cd ..\
set mypath=%cd%
cd boot
cd ..
cd system

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do     rem"') do (
  set "DEL=%%a"
)


for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set today=%year%.%month%.%day%

title JamOS - Starting up...
cd %mypath%
if exist system\updatefiles del system\updatefiles\* /Q > NUL
cd data
set /p ver=<version.jamdat 
set /p uname=<user.jamdat 
set /p titlex=<title.jamdat 
cd..\
:splashscreen
mode con: cols=67 lines=27
cls
echo ##################################################################
echo.
echo.
echo           #####    ####   ##    ##  #######   ######  
echo              ##  ##    ## ## ## ## ##     ## ##    ##
echo              ##  ##    ## ## ## ## ##     ## ##      
echo              ##  ##    ## ##    ## ##     ##  ###### 
echo              ##  ######## ##    ## ##     ##       ## 
echo        ##    ##  ##    ## ##    ## ##     ## ##    ## 
echo         ######   ##    ## ##    ##  #######   ###### 
echo.
echo       JamOS OpenWise %ver%
echo.
echo       %titlex%
echo.
echo       Welcome %uname%^^!
echo.
set _time=%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%
echo       Last login: %date% %_time%
echo.        
call :colorEcho 0f "            '"           
call :colorEcho f0 "= == === ==== ============ ==== === == ='"
echo.
call :colorEcho 0f "            '" 
call :colorEcho f0 "         System is starting up...       '"  
echo.
call :colorEcho 0f "            '"
call :colorEcho f0 "= == === ==== ============ ==== === == ='"
echo.   
cd system
if exist latestver.jamdat del /q /f latestver.jamdat
if exist latestkernel.jamdat del /q /f latestkernel.jamdat
download https://raw.githubusercontent.com/franzageek/jam-os/upd/latestver.md latestver.jamdat  >nul  
download https://raw.githubusercontent.com/franzageek/jam-os/upd/latestkernel.md latestkernel.jamdat  >nul 
set /p latest=<latestver.jamdat                                                                                  
echo ##################################################################

timeout /t 3 /nobreak > nul

:homescr
title JamOS
mode con: cols=110 lines=30
cls
echo #############################################################################################################
echo.
echo.
echo                             #####    ####   ##    ##  #######   ######  
echo                                ##  ##    ## ## ## ## ##     ## ##    ##
echo                                ##  ##    ## ## ## ## ##     ## ##      
echo                                ##  ##    ## ##    ## ##     ##  ###### 
echo                                ##  ######## ##    ## ##     ##       ## 
echo                          ##    ##  ##    ## ##    ## ##     ## ##    ## 
echo                           ######   ##    ## ##    ##  #######   ###### 
echo.
echo       JamOS OpenWise %ver%
echo.
echo       %titlex%
echo.
echo       Welcome %uname%^^! 
echo.
echo       Last login: %date% %_time%
echo.                   
if "%latest%" equ [] goto noupd
if "%latest%"=="%ver%" goto noupd
echo.
echo       An update to version %latest% is available^^! For update
echo       type command "update"^^!
:noupd                   
echo.
echo.
echo #############################################################################################################
echo.
echo Welcome to JamOS^^! Type "help" to get the list of commands.

:cmdline
set cmdline=0
set /p cmdline=%uname%@jamos%ver%^>

set shutdown1=shutdown
set shutdown2=off
set shutdown3=poweroff

set restart1=restart
set restart2=reset
set restart3=reboot
set restart4=reload

set timex=time

set unamey1=username
set unamey2=name

set update1=update
set update2=checkupdate
set update3=upd

set help=help

set _date1=date
set _date2=day
set _date3=today

set systeminfo1=systeminfo
set systeminfo2=sysinfo
set systeminfo3=info

set superuser=superuser

set namechange1=namechange
set namechange2=changename
set namechange3=changeusername

set cln1=cln
set cln2=clr
set cln3=cls
set cln4=clean
set cln5=clear

set color=color

set about1=about
set about2=aboutsystem

set snake1=snake
set snake2=snakegame



if /i "%cmdline%" equ "%shutdown1%" goto shutdown
if /i "%cmdline%" equ "%shutdown2%" goto shutdown
if /i "%cmdline%" equ "%shutdown3%" goto shutdown

if /i "%cmdline%" equ "%update1%" goto update
if /i "%cmdline%" equ "%upadte2%" goto update
if /i "%cmdline%" equ "%update3%" goto update

if /i "%cmdline%" equ "%restart1%" goto restart
if /i "%cmdline%" equ "%restart2%" goto restart
if /i "%cmdline%" equ "%restart3%" goto restart
if /i "%cmdline%" equ "%restart4%" goto restart

if /i "%cmdline%" equ "%timex%" echo %time% &goto cmdline

if /i "%cmdline%" equ "%unamey1%" goto unamevb
if /i "%cmdline%" equ "%unamey2%" goto unamevb

if /i "%cmdline%" equ "%help%" goto help

if /i "%cmdline%" equ "%color%" goto color

if /i "%cmdline%" equ "%_date1%" echo %date% &goto cmdline
if /i "%cmdline%" equ "%_date2%" echo %date% &goto cmdline
if /i "%cmdline%" equ "%_date3%" echo %date% &goto cmdline

if /i "%cmdline%" equ "%systeminfo1%" goto :systeminfo
if /i "%cmdline%" equ "%systeminfo2%" goto :systeminfo
if /i "%cmdline%" equ "%systeminfo3%" goto :systeminfo

if /i "%cmdline%" equ "%namechange1%" goto usernamechange
if /i "%cmdline%" equ "%namechange2%" goto usernamechange
if /i "%cmdline%" equ "%namechange3%" goto usernamechange

if /i "%cmdline%" equ "%cln1%" cls &goto cmdline
if /i "%cmdline%" equ "%cln2%" cls &goto cmdline
if /i "%cmdline%" equ "%cln3%" cls &goto cmdline
if /i "%cmdline%" equ "%cln4%" cls &goto cmdline
if /i "%cmdline%" equ "%cln5%" cls &goto cmdline

if /i "%cmdline%" equ "%about1%" goto about
if /i "%cmdline%" equ "%about2%" goto about
if /i "%cmdline%" equ "%about3%" goto about

if /i "%cmdline%" equ "%snake1%" goto :snake
if /i "%cmdline%" equ "%snake2%" goto :snake
if /i "%cmdline%" equ "%snake3%" goto :snake

goto cmdline 

:shutdown
cd %mypath%
cd boot
rename shutdown.jamx shutdown.bat
start shutdown.bat
exit

:restart
cd %mypath%
cd boot
rename reset.jamx reset.bat
start reset.bat
exit

:unamevb
echo.
echo Windows username: %username%
echo JamOS username: %uname%
echo.
goto :cmdline

:usernamechange
cd %mypath%
cd data
set /p newusername=Choose your new username:
set /p prevuname=<user.jamdat
del user.jamdat
echo %newusername%>>user.jamdat
cd..
cd log
echo ##USERNAME changed from %prevuname% to %newusername%## %year%.%month%.%day%, %time% >>log%year%.%month%.%day%.log
echo Done^^! Reloading system...
timeout /t 3 /nobreak > NUL
goto :restart

:color
echo COLOR attr
echo.
echo attr Specifies the color attribute of the console output.
echo.                                                                                 
echo The color attribute consists of TWO hexadecimal digits: the
echo first for the background, the second for the foreground color. For each of
echo these values, it is possible to choose one of the following figures:
echo.
echo 0 = Black         8 = Gray
echo 1 = Dark Blue     9 = Blue
echo 2 = Green         A = Lemon green
echo 3 = Aqua green    B = Light blue
echo 4 = Bordeaux      C = Red
echo 5 = Purple        D = Fuchsia
echo 6 = Olive green   E = Yellow
echo 7 = Light gray    F = White
echo.

call :colorEcho 0f " Example ="
call :colorEcho 0a " color 0a"

echo.
echo.
set /p newcol=color 
color %newcol%

goto :cmdline

:systeminfo
cd %mypath%
cd core
if not exist system.jamapp if not exist system.bat goto :unable_sysinfo
if exist system.bat start system.bat
if exist system.jamapp rename system.jamapp system.bat &start system.bat
goto :cmdline

:unable_sysinfo
echo.
echo An error occurred while trying to start SYSTEMINFO: system.jamapp not found.
echo.
goto :cmdline

:snake
cd %mypath%
cd core
if not exist snake.jamapp if not exist snake.bat goto :unable_snake
if exist snake.bat start snake.bat
if exist snake.jamapp rename snake.jamapp snake.bat &start snake.bat
goto :cmdline

:unable_snake
echo.
echo An error occurred while trying to start SNAKE: snake.jamapp not found.
echo.
goto :cmdline

:noupdate
echo No update available^^!
goto cmdline

:update
SET mypath2=%~dp0
if "%latest%" equ "%ver%" goto :noupdate
cls
echo Updating software, please wait.
echo.
echo Downloading latest files.
mkdir updatefiles
copy download.exe "%cd%\updatefiles\download.exe"
cd updatefiles
download https://raw.githubusercontent.com/franzageek/jam-os/latest/system/system.jamins system.jamx
cls
echo Updating software, please wait..
echo.
echo Downloading latest files..
download https://raw.githubusercontent.com/franzageek/jam-os/latest/boot/boot.jamins boot.jamx
cls
echo Updating software, please wait...
echo.
echo Downloading latest files...
download https://raw.githubusercontent.com/franzageek/jam-os/latest/boot/shutdown.jamins shutdown.jamx
cls
echo Updating software, please wait.
echo.
echo Downloading latest files.
download https://raw.githubusercontent.com/franzageek/jam-os/latest/boot/reset.jamins reset.jamx
download https://raw.githubusercontent.com/franzageek/jam-os/upd/updfiles/applyupd.bat applyupd.bat > NUL
cls 
echo Updating software, please wait..
echo.
echo Downloading latest files..
echo.
echo Deleting old files..
cd..
cd..
cd boot
del shutdown.jamx
del reset.jamx
del boot.jamx
del shutdown.bat
del reset.bat
del boot.bat
cd..
cls 
echo Updating software, please wait...
echo.
echo Downloading latest files...
echo.
echo Deleting old files...
echo.
echo Installing new files ...
move "%cd%\system\updatefiles\shutdown.jamx" "%cd%\boot\shutdown.jamx"
move "%cd%\system\updatefiles\boot.jamx" "%cd%\boot\boot.jamx"
move "%cd%\system\updatefiles\reset.jamx" "%cd%\boot\reset.jamx"
cls 
echo Done! Press ENTER to reboot JamOS.
pause >nul
cls
cd system\updatefiles
start applyupd.bat
exit

:about
echo.
echo ########## ######   ##########
echo         ##       ## ##  ##  ##            #########v%ver%####
echo         ##  ####### ##  ##  ##   ####   ##
echo         ## ##    ## ##  ##  ## ##    ##  ####
echo   ##    ## ##    ## ##  ##  ## ##    ##      ##
echo     #####   ######  ##  ##  ##   ####    ####
echo                             ##
echo                             ##
echo.
echo.
echo Developed by FranzaGeek
echo Inspired by DebiOS
echo.
echo Download.exe is developed by Faith Kodak - https://f2ko.de/
GOTO :CMDLINE

:help
echo.
echo JamOS Help
echo _______________________________
echo.
echo Basic system actions
echo - SHUTDOWN         Shuts down JamOS (use only when you're exiting JamOS)
echo - RESTART          Reboots the system.
echo - DATE             Shows the current date.
echo - TIME             Shows the current time.
echo - NAME             Shows the Windows and the JamOS' username.
echo - UPDATE           Check if there is any software update.
echo - HELP             Shows this list of commands.
echo.
echo Customization
echo - CHANGENAME       Changes the current JamOS' username.
echo - CLN              Cleans the screen.
echo - COLOR            Changes the interface's color. Works like
echo                    the Windows' COLOR command.
echo.
echo JamAPPS (preinstalled apps)
echo - SNAKE            Starts Snake Game
echo - SYSTEMINFO       Informations about JamOS.
echo.
echo Miscellaneous
echo - ABOUT            About system and credits.
echo.
goto :cmdline

:colorEcho
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1i