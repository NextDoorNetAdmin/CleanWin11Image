@echo off

REM This (re-)configures Microsoft Update, aka "Give me updates for other Microsoft products"
cscript //nologo %windir%\Setup\scripts\mua.vbs

REM Chainload the user-context deployment script
start "Image Setup" %windir%\Setup\scripts\deploy1.cmd

REM Cleanup!
if exist %windir%\Setup\scripts\mua.vbs del %windir%\Setup\scripts\mua.vbs
