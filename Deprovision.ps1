#Requires -RunAsAdministrator

$packages = Get-AppXProvisionedPackage -Path C:\mount

$packagePrefixes = 'Clipchamp.Clipchamp_', 
'Microsoft.BingNews_',
'Microsoft.BingSearch_',
'Microsoft.BingWeather_',
'Microsoft.Copilot_',
'Microsoft.Windows.CrossDevice_',
'Microsoft.GamingApp_',
'Microsoft.GetHelp_',
'Microsoft.Getstarted_',
'Microsoft.MicrosoftOfficeHub_',
'Microsoft.MicrosoftSolitaireCollection_',
'Microsoft.MixedReality.Portal_',
'Microsoft.Office.OneNote_',
'Microsoft.OfficePushNotificationUtility_',
'Microsoft.OutlookForWindows_',
'Microsoft.People_',
'Microsoft.PowerAutomateDesktop_',
'Microsoft.SkypeApp_',
'Microsoft.StartExperiencesApp_',
'Microsoft.Todos_',
'Microsoft.Wallet_',
'Microsoft.Windows.DevHome_',
'Microsoft.Windows.Copilot_',
'Microsoft.Windows.Teams_',
'Microsoft.WindowsAlarms_',
'microsoft.windowscommunicationsapps_',
'Microsoft.WindowsFeedbackHub_',
'Microsoft.WindowsMaps_',
'Microsoft.WindowsSoundRecorder_',
'Microsoft.Xbox.TCUI_',
'Microsoft.XboxApp_',
'Microsoft.XboxGameOverlay_',
'Microsoft.XboxGamingOverlay_',
'Microsoft.XboxSpeechToTextOverlay_',
'Microsoft.YourPhone_',
'Microsoft.ZuneMusic_',
'Microsoft.ZuneVideo_',
'MicrosoftCorporationII.MicrosoftFamily_',
'MicrosoftWindows.CrossDevice_',
'MSTeams_',
'MicrosoftTeams_', 
'Microsoft.549981C3F5F10_'

$packagesToRemove = $packages | Where-Object {
    $packageName = $_.PackageName
    $packagePrefixes -contains ($packagePrefixes | Where-Object { $packageName -like "$_*" })
}

$packagesToRemove | Remove-AppXProvisionedPackage -Path C:\mount