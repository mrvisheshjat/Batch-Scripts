@echo off
color 57
echo Hey, Do you love Vishesh(only answer in yes or no)
set/p love=
if %love%==yes goto love
if %love%==no goto hate
:love
echo Vishesh loves you too...
echo Meet you soon:)
pause
exit
:hate
echo yout PC will crash in 10 seconds
timeout 10
shutdown-s-t 100