# CrowdStrike Falcon Sensor Uninstall Guide

This document explains how to uninstall the **CrowdStrike Falcon Sensor** from supported operating systems.  CrowdStrike Falcon is an endpoint protection agent deployed on company‑managed devices.  Organizations often enable **Uninstall Protection** to prevent unauthorized removal.  In that case you will need a **maintenance token** from the CrowdStrike console before you can remove the sensor.

## Obtain a Maintenance Token (if uninstall protection is enabled)

1. Log into the CrowdStrike Falcon console and go to **Hosts → Host Management**.
2. Find the endpoint you intend to remove and open its details.
3. Click **Reveal maintenance token** and provide the reason for removal, then select **Reveal Token** to obtain the token【834133930996457†L130-L144】.  Copy this token for use in the uninstall commands.

If the **Reveal maintenance token** button does not appear, uninstall protection has likely been disabled by policy【834133930996457†L146-L148】.

## Windows Uninstallation

### Option 1 – Control Panel

1. Open **Control Panel** → **Programs and Features**.
2. Find **CrowdStrike Windows Sensor** in the list of installed programs and select **Uninstall**.  If uninstall protection is enabled, the uninstaller will prompt for your maintenance token【834133930996457†L150-L155】.

### Option 2 – Falcon Uninstall Tool

1. Download **CsUninstallTool.exe** from the CrowdStrike console’s **Tool Downloads** page【834133930996457†L158-L161】.
2. Open an **administrative Command Prompt** and change into the directory containing the tool.
3. Run one of the following commands.  Use the token only when uninstall protection is enabled【834133930996457†L165-L171】:

   ```cmd
   CsUninstallTool.exe /quiet
   CsUninstallTool.exe MAINTENANCE_TOKEN=<your‑token> /quiet
   ```

### Option 3 – Windows Sensor Uninstaller

Some distributions provide a sensor uninstaller (`WindowsSensor.exe`).  Run the following command from an administrative command prompt, substituting your token for `<YOUR‑CODE>`:

```cmd
WindowsSensor.exe /uninstall /quiet /norestart PASSWORD=<YOUR‑CODE>
```

After removal, verify the service has been removed by running `sc query csagent`; the command should return **“The specified service does not exist as an installed service”**【829915623743594†L86-L99】.

## macOS Uninstallation

### With uninstall protection

1. Obtain the maintenance token as described above.
2. Open **Terminal** and run the following command, supplying the token when prompted【834133930996457†L225-L234】:

   ```bash
   sudo /Applications/Falcon.app/Contents/Resources/falconctl uninstall --maintenance-token
   ```

3. Enter the maintenance token when the tool prompts you and allow the process to complete【834133930996457†L225-L234】.

### Without uninstall protection

If uninstall protection is disabled, a maintenance token is not required.  Run the following command from Terminal to remove the sensor【834133930996457†L236-L241】:

```bash
sudo /Applications/Falcon.app/Contents/Resources/falconctl uninstall
```

After the uninstall completes, you can confirm removal by running:

```bash
sudo /Applications/Falcon.app/Contents/Resources/falconctl stats
```

The command should return “command not found” or report that the sensor is not present【829915623743594†L118-L121】.

**Note:** On macOS 13 and later you must grant Terminal full disk access before you can uninstall the sensor【834133930996457†L189-L194】.

## Linux Uninstallation

1. Open a **terminal** on the target Linux system.
2. Run the appropriate command for your distribution【834133930996457†L270-L277】:

   | Distribution                     | Command to remove the sensor                                    |
   |---------------------------------|------------------------------------------------------------------|
   | Ubuntu or Debian                | `sudo apt‑get purge falcon‑sensor`                              |
   | Red Hat, CentOS, Alma, Amazon   | `sudo yum remove falcon‑sensor`                                  |
   | SUSE Linux Enterprise Server    | `sudo zypper remove falcon‑sensor`                               |

3. After the package is removed, verify that the sensor service is no longer running (e.g., `sudo systemctl status falcon‑sensor`).  A successful uninstall will report that the service could not be found【829915623743594†L137-L140】.

## Best Practices

- **Retrieve the maintenance token before attempting to uninstall**.  Tokens can expire; obtain a fresh token if an “Invalid token” error occurs【829915623743594†L146-L150】.
- **Run commands with administrative privileges**.  On Windows, open the command prompt as **Administrator**; on macOS and Linux, use `sudo`【829915623743594†L151-L154】.
- **Verify uninstallation**.  Always confirm that the sensor and associated services have been removed from the system【829915623743594†L157-L165】.
- **Avoid disabling tamper protection**.  Use the maintenance token method rather than turning off sensor protection to preserve security policies【829915623743594†L166-L179】.

## Disclaimer

These instructions are provided for educational and authorized administrative use only.  Removing CrowdStrike Falcon may leave an endpoint unprotected.  Always coordinate with your security team and ensure that replacement protections are in place before removal.
