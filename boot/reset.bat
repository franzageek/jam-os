@echo off

title JamOS
SET mypath=%~dp0


mode con: cols=120 lines=30

cd..\
cd system
ren system.bat system.jamx
cd..\
cd boot
ren boot.bat boot.jamx
ren shutdown.bat shutdown.jamx
cd..\
cd core
ren system.bat system.jamapp
ren snake.bat snake.jamapp
cls

for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set today=%year%.%month%.%day%

cd..\
cd boot

cls
COLOR
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
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=+
for %%d in ( A ) do echo.|set /p=J
for %%d in ( A ) do echo.|set /p=a
for %%d in ( A ) do echo.|set /p=m
for %%d in ( A ) do echo.|set /p=O
for %%d in ( A ) do echo.|set /p=S
for %%d in ( A ) do echo.|set /p=+
for %%d in ( A B C ª D E F G H CH I J K L M N O P Q R S T U V W X Y Z A B C ª D E F G H CH I A A A A A A A A A A A A A A A A A) do echo|set /p=+
echo.
ping -n 2 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                     *****
echo                                                                 *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.                                                   
echo                                                        *****
echo                                                              *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                           *****
echo                                                           *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                              *****
echo                                                        *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                                 *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                     *****
echo                                                                 *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.                                                   
echo                                                        *****
echo                                                              *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                           *****
echo                                                           *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                              *****
echo                                                        *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                                 *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                     *****
echo                                                                 *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.                                                   
echo                                                        *****
echo                                                              *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                           *****
echo                                                           *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                              *****
echo                                                        *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                                 *****
echo                                                     *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                     *****
echo                                                                 *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.                                                   
echo                                                        *****
echo                                                              *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                           *****
echo                                                           *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                              *****
echo                                                        *****
ping -n 1 localhost >nul
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                                                     Starting up JamOS
echo.
echo                                                                 *****
echo                                                     *****
cls
cd..\
if not exist %cd%\log mkdir log
cd log
echo ##REBOOT## %date% @ %time% >>log%year%.%month%.%day%.log
echo. >>log.%date%.log
cd..
cd system
rmdir updatefiles /Q /S
if exist system.bat if not exist system.jamx start system.bat
if not exist system.bat if exist system.jamx rename system.jamx system.bat &start system.bat
timeout /t 1 /nobreak > NUL
exit