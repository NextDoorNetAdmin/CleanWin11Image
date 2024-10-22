@echo off
echo Please wait, Setup is running...
echo.

REM Initial login to Windows 11 takes somewhere between 60-120 seconds.
REM Login and profile setup needs to be completed before we keep going!
ping 127.0.0.1 -n 121 > nul

REM Sets power profile to high performance and disables hibernation / hybrid startup.
call %windir%\Setup\scripts\confpower.cmd

REM The Autologon stuff from unattend.xml should have expired, but let's remove it manually just in case.
regedit /s %windir%\Setup\scripts\autologinclear.reg

REM If your machine has an OEM license of Windows 11, you can uncomment this command to automatically detect it and activate Windows for you!
REM powershell -ExecutionPolicy Bypass -File %windir%\Setup\scripts\OEMkey.ps1

REM Cleanup!
if exist %windir%\Setup\scripts\confpower.cmd del %windir%\Setup\scripts\confpower.cmd
if exist %windir%\Setup\scripts\autologinclear.reg del %windir%\Setup\scripts\autologinclear.reg
if exist %windir%\Setup\scripts\OEMkey.ps1 del %windir%\Setup\scripts\OEMkey.ps1
if exist %systemroot%\panther\unattend.xml del /Q /F %systemroot%\panther\unattend.xml
if exist %systemroot%\system32\sysprep\unattend.xml del /Q /F %systemroot%\system32\sysprep\unattend.xml

REM Reboot the machine to make it ready for the next user to login!
shutdown /r /t 30 /d p:4:2
msg nextdoornetadmin Please wait for the system to reboot...

if exist %windir%\Setup\scripts\kicker.cmd del %windir%\Setup\scripts\kicker.cmd
if exist %windir%\Setup\scripts\deploy1.cmd del %windir%\Setup\scripts\deploy1.cmd
