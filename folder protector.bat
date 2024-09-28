@REM This is pretty cool as it requests a password for a folder. Once you copy it into notepad you must insert your own password and designated folder directory into the designated areas!

@REM NB: THERE ARE TWO PLACES IN WHICH YOU MUST ENTER INFO!!!

@echo off
color 0a
set /a tries=3
set password=mrvisheshjat
:top
echo.
echo ---------------------------------------
echo.
echo folder Password
echo.
echo ---------------------------------------
echo You have %tries% attempts left.
echo Enter Password
echo ---------------------------------------
set /p pass=
if %pass%==%password%(
    goto penalty
)
cls
goto top
:panalty
echo Sorry, too many incorrect passwords, initiating shutdown.
start shutdown -s -f -t 35 -c "SHUTDOWN INITIATED"
pause
exit
:correct
cls
echo --------------------------------------
echo Password Accepted!
echo.
echo Opening Folder...
echo --------------------------------------
explore***E:\New folder***
pause
exit
:correct
cls
echo ----------------------------------------------
echo Password Accepted!
echo.
echo Opening Folder...
echo ----------------------------------------------
explorer E:\User
pause