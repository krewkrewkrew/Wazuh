<#
.SYNOPSIS
    Downloads and installs the Wazuh agent MSI package.
.DESCRIPTION
    Fetches the specified Wazuh agent MSI from the official packages
    repository and installs it silently using msiexec.
.PARAMETER Manager
    IP or hostname of the Wazuh manager.
.PARAMETER Version
    Wazuh agent version to install.
#>

param(
    [string]$Manager = "MANAGER_IP",
    [string]$Version = "4.12.0-1"
)

$baseUrl = "https://packages.wazuh.com/4.x/windows"
$packageName = "wazuh-agent-$Version.msi"
$downloadUrl = "$baseUrl/$packageName"

Write-Host "Downloading $downloadUrl..."
Invoke-WebRequest -Uri $downloadUrl -OutFile $packageName

Write-Host "Installing Wazuh agent..."
$arguments = "/i `"$packageName`" /qn WAZUH_MANAGER=$Manager"
Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait -NoNewWindow

Remove-Item $packageName
Write-Host "Installation completed."
