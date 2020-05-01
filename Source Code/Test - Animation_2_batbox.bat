@echo off
cls 

Title Batbox Demo - www.thebateam.org
Cd Files

setlocal enabledelayedexpansion

set x_1=0
set y_1=0
set x_2=55
set y_2=50

rem delay is in mili scnd
set delay=100

set sign_x_1=+
set sign_y_1=+
set sign_x_2=-
set sign_y_2=+

set total_items=2
set item_1=namish
set item_1_len=6
set item_2=Karan
set item_2_len=5

set Columns=140
set lines=50
mode %columns%,%lines%
::call :get_size Lines Columns

set /a upper_x=%columns%-%item_1_len%
set /a upper_y=%lines%-3
set lowr_x=1
set lowr_y=1
fn.dll cursor 0

:loop
cls
for /l %%a in (1,1,!total_items!) do (
for %%A in (x y) do (
if !%%A_%%a! gtr !upper_%%A! (set sign_%%A_%%a=-)
if !%%A_%%a! lss !lowr_%%A! (set sign_%%A_%%a=+)
)
)
set item_1_limit_1=%x_1%
set /a item_1_limit_2=%x_1%+%item_1_len%
set item_2_limit_1=%x_2%
set /a item_2_limit_2=%x_2%+%item_2_len%

for /l %%x in (%item_1_limit_1%,1,%item_1_limit_2%) do for /l %%y in (!item_2_limit_1!,1,!item_2_limit_2!) do (if /i "%%x" == "%%y" (if /i "!y_1!" == "!y_2!" (set collision=true)))

if /i "!collision!" == "true" (
	for /l %%a in (1,1,%total_items%) do (
		for %%A in (x) do (
			if /i "!sign_%%A_%%a!" == "-" (set sign_%%A_%%a=+) else (set sign_%%A_%%a=-)
		)
	)
)

batbox /g !x_1! !y_1! /c 0x0a /d "!item_1!" /g !x_2! !y_2! /c 0x0c /d "!item_2!" /w !delay!
title [Item : !item_1!, Pos: x=!x_1!,y=!y_1!] [Item : !item_2!, Pos: x=!x_2!,y=!y_2!] 
set /a x_1%sign_x_1%=1
set /a y_1%sign_y_1%=1
set /a x_2%sign_x_2%=1
set /a y_2%sign_y_2%=1

set collision=false
goto loop

:get_size
mode | find "Columns">"%tmp%\c.tmp"
mode | find "Lines">"%tmp%\l.tmp"
set now=%cd%
cd /d "%tmp%" >nul
for /f "tokens=2 delims=:" %%a in (l.tmp) do (set /a %~1=%%a)
for /f "tokens=2 delims=:" %%a in (c.tmp) do (set /a %~2=%%a)
cd /d "%now%"
goto :eof