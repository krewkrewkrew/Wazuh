<#
.SYNOPSIS
    Installs the Wazuh agent using Chocolatey.
.DESCRIPTION
    Installs Chocolatey if it is not present and then installs the
    Wazuh agent package with the provided manager address.
.PARAMETER Manager
    IP or hostname of the Wazuh manager.
#>

param(
    [string]$Manager = "MANAGER_IP"
)

if (-not (Get-Command choco.exe -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey not found. Installing..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

Write-Host "Installing Wazuh agent with Chocolatey..."
choco install wazuh-agent -y --params "'/manager:$Manager'"
