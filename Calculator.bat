@REM This is well.. a calculator.

@echo off
title Batch calculator by mrvisheshjat
color 1f
:top
echo -----------------------------------
echo Welcome to Batch Calculator by mrvisheshjat
echo -----------------------------------
echo.
set/p sum=
set/a ans=%sum%
echo.
echo = %ans%
echo -----------------------------------
pause
cls
echo Previous Answer: %ans%
goto top
exit