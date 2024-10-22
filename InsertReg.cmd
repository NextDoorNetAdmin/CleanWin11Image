@echo off

REM Removing OneDrive
takeown /f C:\mount\Windows\System32\OneDriveSetup.exe /a
icacls C:\mount\Windows\System32\OneDriveSetup.exe /grant *S-1-5-32-544:(F)
del C:\mount\Windows\System32\OneDriveSetup.exe /F

REM Load the registry hives to be modified
reg load HKLM\zNTUSER C:\mount\Users\Default\ntuser.dat
reg load HKLM\zSOFTWARE C:\mount\Windows\System32\config\SOFTWARE

REM Insert the desired values
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v FeatureManagementEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v PreInstalledAppsEverEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SoftLandingEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContentEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-353694Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SubscribedContent-353696Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f
reg delete HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\Subscriptions /f
reg add HKLM\zSOFTWARE\Microsoft\PolicyManager\current\device\Start /v ConfigureStartPins /t REG_SZ /d "{pinnedList: [{}]}" /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\PushToInstall /v DisablePushToInstall /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\MRT /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableConsumerAccountStateContent /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableCloudOptimizedContent /t REG_DWORD /d 1 /f
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v ChatIcon /t REG_DWORD /d 3 /f
reg add HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarMn /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo /v Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\Privacy /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy /v HasAccepted /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Input\TIPC /v Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\InputPersonalization /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add HKLM\zNTUSER\Software\Microsoft\InputPersonalization /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add HKLM\zNTUSER\Software\Microsoft\InputPersonalization\TrainedDataStore /v HarvestContacts /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Personalization\Settings /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f

REM Unload the registry hives
reg unload HKLM\zNTUSER
reg unload HKLM\zSOFTWARE