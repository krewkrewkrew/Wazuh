<#
.SYNOPSIS
    Installs the Wazuh agent using Windows Package Manager (winget).
.DESCRIPTION
    Uses winget to fetch and install the Wazuh agent package with the
    specified manager address.
.PARAMETER Manager
    IP or hostname of the Wazuh manager.
#>

param(
    [string]$Manager = "MANAGER_IP"
)

Write-Host "Installing Wazuh agent with winget..."
winget install Wazuh.WazuhAgent --override "WAZUH_MANAGER=$Manager"
