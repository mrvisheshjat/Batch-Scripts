@echo off
title COINS
color 0a
mode con: cols=39 lines=25

:menu
cls
echo =======================================
echo ==========       COINS       ==========
echo =======================================
echo.
echo For info type ?
echo.
echo 1) Singleplayer
echo 2) Multiplayer
set menuchoice=
set /p menuchoice=
if %menuchoice% equ 1 goto players_sp
if %menuchoice% equ 2 goto players_mp
if %menuchoice% equ ? goto info
echo.
goto menu

:info
cls
echo.
echo SINGLEPLAYER
echo.
echo Your task is to beat me. There are
echo coins (18 to 40). You have to collect
echo 1, 2 or 3 coins. If it's your turn
echo and there is only one coin left,
echo you lose. GLHF :)
echo.
echo.
echo MULTIPLAYER
echo.
echo It's the same as singleplayer...
echo ...but it's for 2 players ;)
echo.
echo =======================================
echo.
echo To report any bugs, please contact me:
echo.
echo E-mail: kotasekjat@seznam.cz
echo Skype: GD ziffdodo2
echo.
echo.
echo Thanks for playing my game!!!
pause >nul
goto menu

//SINGLEPLAYER

:players_sp
cls
echo.
echo =======================================
echo === PLAYERS ===
echo =======================================
echo.
echo.
set player=
set /p player=Player 1 (enter your name):
echo.
echo Player 2: NPC
ping -n 3 localhost >nul
cls
echo.
echo READY?
ping -n 2 localhost >nul
cls
echo.
echo GO!
ping -n 2 localhost >nul
goto game_p1_1


//PLAYER_1


:game_p1_1
set limit=
set /a limit=%random% %% 18+22
goto game_p1_2

:game_p1_2
cls
echo.
echo Coins left: %limit%
echo.
echo How many coins do you wanna take?
echo.
echo.
if %limit% equ 1 goto p1_loss_sp
set p1=
set /p p1= %player%'s turn:
if %p1% equ 1 goto p1_1
if %p1% equ 2 goto p1_2
if %p1% equ 3 goto p1_3
if %p1% gtr 3 goto p1_fail

:p1_1
set /a limit=%limit%-1
echo.
echo YOU TAKE 1 COIN
ping -n 2 localhost >nul
goto game_pc_check

:p1_2
set /a limit=%limit%-2
echo.
echo YOU TAKE 2 COINS
ping -n 2 localhost >nul
goto game_pc_check

:p1_3
set /a limit=%limit%-3
echo.
echo YOU TAKE 3 COINS
ping -n 2 localhost >nul
goto game_pc_check

:p1_fail
echo.
echo YOU CAN'T TAKE MORE THAN 3 COINS!
ping -n 3 localhost >nul
goto game_p1_2


//PLAYER_PC


:game_pc_check
if %limit% gtr 25 goto game_pc_1
if %limit% leq 25 goto game_pc_2
if %limit% leq 0 goto p1_loss_sp

:game_pc_1
cls
echo.
echo Coins left: %limit%
echo.
echo How many coins do you wanna take?
echo.
echo.
echo NPC's turn: 2
echo.
echo NPC TAKES 2 COINS
set /a limit=%limit%-2
ping -n 2 localhost >nul
goto game_p1_2

:game_pc_2
//1
if %limit% equ 2 goto pc_1
if %limit% equ 10 goto pc_1
if %limit% equ 18 goto pc_1
if %limit% equ 22 goto pc_1
if %limit% equ 6 goto pc_2
//GAPS_1
if %limit% equ 14 goto pc_3
//2
if %limit% equ 3 goto pc_2
if %limit% equ 15 goto pc_2
if %limit% equ 11 goto pc_2
if %limit% equ 19 goto pc_2
//GAPS_2
if %limit% equ 7 goto pc_3
if %limit% equ 23 goto pc_3
//3
if %limit% equ 4 goto pc_3
if %limit% equ 8 goto pc_3
if %limit% equ 12 goto pc_3
if %limit% equ 20 goto pc_3
if %limit% equ 24 goto pc_2
//GAPS_3
if %limit% equ 16 goto pc_1
//IMPOSSIBLE
if %limit% equ 5 goto pc_1
if %limit% equ 9 goto pc_2
if %limit% equ 13 goto pc_3
if %limit% equ 17 goto pc_1
if %limit% equ 21 goto pc_2
if %limit% equ 25 goto pc_3
//PC_LOSS / PLAYER_1 WIN
if %limit% equ 1 goto pc_loss
//PC_WIN
if %limit% leq 0 goto p1_loss

:pc_3
cls
echo.
echo Coins left: %limit%
echo.
echo How many coins do you wanna take?
echo.
echo.
echo NPC's turn: 3
echo.
echo NPC TAKES 3 COINS
set /a limit=%limit%-3
ping -n 2 localhost >nul
goto game_p1_2

:pc_1
cls
echo.
echo Coins left: %limit%
echo.
echo How many coins do you wanna take?
echo.
echo.
echo NPC's turn: 1
echo.
echo NPC TAKES 1 COINS
set a limit=%limit%-1
ping -n 2 localhost >nul
goto game_p1_2

:pc_2
cls
echo.
echo Coins left: %limit%
echo.
echo How many coins do you wanna take?
echo.
echo.
echo NPC's turn: 2
echo.
echo NPC TAKES 2 COINS
set /a limit=%limit%-2
ping -n 2 localhost >nul
goto game_p1_2

:pc_loss
cls
echo.
echo =======================================
echo CONGRATULATIONS
echo =======================================
echo.
echo %player% wins!
echo.
set again=
set /p again=Do you want to play again? -
if %again% equ yes goto player
if %again% equ YES goto player
if %again% equ no goto exit
if %again% equ NO goto exit
exit

:p1_loss_sp
echo.
NPC wins!
echo.
echo You can try your luck again, %player%!
echo.
set again=
set /p again=Wanna try your luck again? -
if %again% equ yes goto player
if %again% equ YES goto player
if %again% equ no goto exit
if %again% equ NO goto exit
exit

//MULTIPLAYER

:players_mp
cls
echo.
echo =======================================
echo === PLAYERS ===
echo =======================================
echo.
echo.
set player1=
set /p player1=Player 1:
echo.
set player2=
set /p player2=Player 2:
ping -n 2 localhost >nul
cls
echo.
echo READY?
ping -n 2 localhost >nul
cls
echo.
echo GO!
ping -n 2 localhost >nul
goto game2_1

:game2_1
set limit2=
set /a limit2=%random% %% 18+22
goto game2_p1


//PLAYER_1


:game2_p1
cls
echo.
echo Coins left: %limit2%
echo.
echo How many coins do you wanna take?
echo.
echo.
if %limit2% equ 1 goto p1_loss_2
if %limit2% leq 0 goto p2_loss_2
set p1_2=
set /p p1_2=%player1%'s turn:
if %p1_2% equ 1 goto p1_1_2
if %p1_2% equ 2 goto p1_2_2
if %p1_2% equ 3 goto p1_3_2
if %p1_2% gtr 3 goto p1_fail_2

:p1_1_2
echo.
echo %player1% TAKES 1 COIN
set /a limit2=%limit2%-1
ping -n 2 localhost >nul
goto game2_p2

:p1_2_2
echo.
echo %player1% TAKES 2 COINS
set /a limit2=%limit2%-2
ping -n 2 localhost >nul
goto game2_p2

:p1_3_2
echo.
echo %player1% TAKES 3 COINS
set /a limit2=%limit2%-3
ping -n 2 localhost >nul
goto game2_p2

:p1_fail_2
echo.
echo YOU CAN'T TAKE MORE THAN 3 COINS!
ping -n 2 localhost >nul
goto game2_p1

:p1_loss_2
echo.
echo =======================================
echo CONGRATULATIONS
echo =======================================
echo.
echo %player2% wins!
echo.
echo You can try your luck again, %player1%!
echo.
set again2=
set /p again2=Do you want to play again? -
if %again2% equ yes goto players_mp
if %again2% equ YES goto players_mp
if %again2% equ no goto exit
if %again2% equ NO goto exit
exit

//PLAYER_2


:game2_p2
cls
echo.
echo Coins left: %limit2%
echo.
echo How many coins do you wanna take?
echo.
echo.
if %limit2% equ 1 goto p2_loss_2
if %limit2% leq 0 goto p1_loss_2
set p2_2=
set /p p2_2=%player2%'s turn:
if %p2_2% equ 1 goto p2_1_2
if %p2_2% equ 2 goto p2_2_2
if %p2_2% equ 3 goto p2_3_2
if %p2_2% gtr 3 goto p2_fail_2

:p2_1_2
echo.
echo %player2% TAKES 1 COIN
set /a limit2=%limit2%-1
ping -n 2 localhost >nul
goto game2_p1

:p2_2_2
echo.
echo %player2% TAKES 2 COINS
set /a limit2=%limit2%-2
ping -n 2 localhost >nul
goto game2_p1

:p2_3_2
echo.
echo %player% TAKES 3 COINS
set /a limit2=%limit2%-3
ping -n 2 localhost >nul
goto game2_p1

:p2_fail_2
echo.
echo YOU CAN'T TAKE MORE THAN 3 COINS!
ping -n 2 localhost >nul
goto game2_p2

:p2_loss_2
echo.
echo =======================================
echo CONGRATULATIONS
echo =======================================
echo.
echo %player1% wins!
echo.
echo You can try your luck again, %player2%!
echo.
set again2_2=
set /p again2_2=Do you want to play again? -
if %again2_2% equ yes goto players_mp
if %again2_2% equ YES goto players_mp
if %again2_2% equ no goto exit
if %again2_2% equ NO goto exit
exit

:exit
exit