#Requires -RunAsAdministrator

# Install the OEM product key from the BIOS
Write-Host "Installing OEM product key..."
$regOEMkey = "slmgr.vbs /ipk " + (Get-WmiObject -query 'select * from SoftwareLicensingService').OA3xOriginalProductKey
Invoke-Expression $regOEMkey
Write-Host "Done."
Write-Host
Write-Host