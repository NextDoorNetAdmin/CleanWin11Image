@echo off

REM Get the desired name for the new computer
echo +++++++++++++++++++++++++++++++++++
set /p dropname=Enter the new computer name (15 char. max): 
echo +++++++++++++++++++++++++++++++++++
echo.
echo.

REM Step 1: Partition the target machine
diskpart /s tools\partimg11.txt

REM Step 2: Apply the image
dism /apply-image /imagefile:clean11.wim /applydir:s:\ /index:1 /checkintegrity /verify

REM Step 3: Create boot files
s:\windows\system32\bcdboot.exe s:\windows

REM Step 4: Preload the recovery partition (will be activated automatically during OOBE)
md R:\Recovery\WindowsRE
xcopy /h S:\Windows\System32\Recovery\Winre.wim R:\Recovery\WindowsRE\
S:\Windows\System32\Reagentc /Setreimage /Path R:\Recovery\WindowsRE /Target S:\Windows

REM Step 5: Replace the default computer name with the new one entered by the user
call tools\BatchSubstitute.bat "GOLDEN-MASTER" %dropname% S:\Windows\panther\unattend.xml > S:\Windows\panther\newunattend.xml
del S:\Windows\panther\unattend.xml
ren S:\Windows\panther\newunattend.xml unattend.xml

REM Step 6: Reboot into OOBE
wpeutil reboot