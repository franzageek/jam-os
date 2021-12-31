@echo off
mode 15,4
cd ..
cd boot
rename boot.bat boot.jamx
rename reset.bat reset.jamx
rename shutdown.bat shutdown.jamx
cd ..
cd core
rename snake.bat snake.jamapp
rename system.bat system.jamapp
exit