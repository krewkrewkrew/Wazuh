# Windows Wazuh Agent Installation

This guide describes several methods to deploy the Wazuh agent on Windows systems.
Each approach is accompanied by a ready-to-use PowerShell script in the `windows` folder.

## Automated MSI Download

1. Open an elevated PowerShell prompt.
2. Run the [`install-wazuh-agent-msi.ps1`](../windows/install-wazuh-agent-msi.ps1) script:
   ```powershell
   .\install-wazuh-agent-msi.ps1 -Manager 192.0.2.10 -Version 4.12.0-1
   ```
   The script downloads the specified MSI package and installs it silently.

## Chocolatey Package

1. Open PowerShell as Administrator.
2. Execute [`install-wazuh-agent-choco.ps1`](../windows/install-wazuh-agent-choco.ps1):
   ```powershell
   .\install-wazuh-agent-choco.ps1 -Manager 192.0.2.10
   ```
   Chocolatey is installed if missing and then used to add the Wazuh agent.

## Winget (Windows Package Manager)

1. Ensure the `winget` tool is available.
2. Run [`install-wazuh-agent-winget.ps1`](../windows/install-wazuh-agent-winget.ps1):
   ```powershell
   .\install-wazuh-agent-winget.ps1 -Manager 192.0.2.10
   ```
   Winget downloads and installs the agent with the provided manager address.

## Manual Installation

1. Download the desired MSI from [Wazuh packages](https://packages.wazuh.com/4.x/windows/).
2. Install it with `msiexec`:
   ```powershell
   msiexec.exe /i wazuh-agent-<version>.msi /qn WAZUH_MANAGER=<manager_ip>
   ```

These methods cover common ways to deploy the Wazuh agent on Windows. Choose the one
that best fits your environment and automation requirements.
