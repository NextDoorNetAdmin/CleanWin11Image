@echo off

REM Removing OneDrive
takeown /f C:\mount\Windows\System32\OneDriveSetup.exe /a
icacls C:\mount\Windows\System32\OneDriveSetup.exe /grant *S-1-5-32-544:(F)
del C:\mount\Windows\System32\OneDriveSetup.exe /F

REM Load the registry hives to be modified
reg load HKLM\zNTUSER C:\mount\Users\Default\ntuser.dat
reg load HKLM\zSOFTWARE C:\mount\Windows\System32\config\SOFTWARE
reg load HKLM\zSYSTEM C:\mount\Windows\System32\config\SYSTEM

REM Sponsored app suppression
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
reg delete HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps /f
reg add HKLM\zSOFTWARE\Microsoft\PolicyManager\current\device\Start /v ConfigureStartPins /t REG_SZ /d "{pinnedList: [{}]}" /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\PushToInstall /v DisablePushToInstall /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\MRT /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableConsumerAccountStateContent /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\CloudContent /v DisableCloudOptimizedContent /t REG_DWORD /d 1 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\SystemSettings\AccountNotifications /v EnableAccountNotifications /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement /v ScoobeSystemSettingEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Suggested /v Enabled /t REG_DWORD /d 0 /f

REM Microsoft Chat suppression
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Chat" /v ChatIcon /t REG_DWORD /d 3 /f
reg add HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarMn /t REG_DWORD /d 0 /f

REM Privacy (Telemetry suppression)
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo /v Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Windows\CurrentVersion\Privacy /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy /v HasAccepted /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Input\TIPC /v Enabled /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\InputPersonalization /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add HKLM\zNTUSER\Software\Microsoft\InputPersonalization /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add HKLM\zNTUSER\Software\Microsoft\InputPersonalization\TrainedDataStore /v HarvestContacts /t REG_DWORD /d 0 /f
reg add HKLM\zNTUSER\Software\Microsoft\Personalization\Settings /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\DataCollection /v AllowTelemetry /t REG_DWORD /d 1 /f

REM Cortana / Copilot suppression
REM --in Windows
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\WindowsCopilot /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\Explorer /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
reg add HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowCopilotButton /t REG_DWORD /d 0 /f
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Search" /v CortanaConsent /t REG_DWORD /d 0 /f
REM --in Edge
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v HubsSidebarEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v CopilotCDPPageContext /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v CopilotPageContext /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v EdgeEntraCopilotPageContext /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v EdgeHistoryAISearchEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v ComposeInlineEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v GenAILocalFoundationalModelSettings /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v NewTabPageBingChatEnabled /t REG_DWORD /d 0 /f
REM --in Notepad (?!?)
reg add HKLM\zSOFTWARE\Policies\WindowsNotepad /v DisableAIFeatures /t REG_DWORD /d 1 /f

REM Other Edge suppression
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v NewTabPageContentEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v NewTabPageHideDefaultTopSites /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v EdgeShoppingAssistantEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v ShowRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v WalletDonationEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v DefaultBrowserSettingsCampaignEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v SpotlightExperiencesAndRecommendationsEnabled /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Edge /v ShowAcrobatSubscriptionButton /t REG_DWORD /d 0 /f

REM Outlook Express suppression
reg add "HKLM\zSOFTWARE\Policies\Microsoft\Windows\Windows Mail" /v PreventRun /t REG_DWORD /d 1 /f

REM Align taskbar left
reg add HKLM\zNTUSER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAl /t REG_DWORD /d 0 /f

REM Disable AI Recall / AI Fabric Service
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\WindowsAI /v DisableAIDataAnalysis /t REG_DWORD /d 1 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\WindowsAI /v AllowRecallEnablement /t REG_DWORD /d 0 /f
reg add HKLM\zSOFTWARE\Policies\Microsoft\Windows\WindowsAI /v TurnOffSavingSnapshots /t REG_DWORD /d 1 /f
reg add HKLM\zSYSTEM\CurrentControlSet\Services\WSAIFabricSvc /v Start /t REG_DWORD /d 3 /f

REM Unload the registry hives
reg unload HKLM\zNTUSER
reg unload HKLM\zSOFTWARE
reg unload HKLM\zSYSTEM