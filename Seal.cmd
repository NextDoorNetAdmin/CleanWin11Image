if exist %systemroot%\panther\unattend.xml del /Q /F %systemroot%\panther\unattend.xml
if exist %systemroot%\system32\sysprep\unattend.xml del /Q /F %systemroot%\system32\sysprep\unattend.xml

copy unattend.xml %windir%\panther\unattend.xml
copy unattend.xml %windir%\system32\sysprep\unattend.xml

robocopy .\scripts %windir%\setup\scripts /s

del /F /Q %APPDATA%\Microsoft\Windows\Recent\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*
del /F /Q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*

%windir%\system32\sysprep\sysprep.exe /oobe /generalize /shutdown /unattend:%windir%\system32\sysprep\unattend.xml