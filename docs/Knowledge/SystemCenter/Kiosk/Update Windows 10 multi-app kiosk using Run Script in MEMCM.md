# Update Windows 10 multi-app kiosk using Run Script in Microsoft Endpoint Configuration Manager (MEMCM)

Contents
<!-- vscode-markdown-toc -->
- [Update Windows 10 multi-app kiosk using Run Script in Microsoft Endpoint Configuration Manager (MEMCM)](#update-windows-10-multi-app-kiosk-using-run-script-in-microsoft-endpoint-configuration-manager-memcm)
  - [1. How to update the kiosk machine](#1-how-to-update-the-kiosk-machine)
  - [2. Script to update the kiosk](#2-script-to-update-the-kiosk)
  - [3. Run Script in MEMCM](#3-run-script-in-memcm)
  - [4. Group Policy to configure Windows settings options](#4-group-policy-to-configure-windows-settings-options)
  - [5. Summary](#5-summary)
  - [6. Subscribe to 4sysops newsletter](#6-subscribe-to-4sysops-newsletter)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->
---
A little background. In the last post, we deployed a Windows multi-app kiosk using an assigned access and PowerShell script during OS deployment. But now, when we have the kiosk machine in production, we get a service desk ticket that the kiosk users must be able to add printers to the kiosk machine.

Let's look at how we can achieve this using Run Scripts in MEMCM.

##  1. <a name='Howtoupdatethekioskmachine'></a>How to update the kiosk machine

In the last post, when we deployed the kiosk computer, we wrote two registry values during OSD. One had the version of the kiosk configuration and one had the username used for AutoLogon. The version can be inventoried using MEMCM. Then we can create reports, collections, and all the MEMCM goodness based on the kiosk version.

![Registry value](https://4sysops.com/wp-content/uploads/2020/10/Registry-value-1-600x176.png "Registry value")

The kiosk machine was configured as shown below to allow Excel, Edge, and Google Chrome to run.

![Multi app kiosk example](https://4sysops.com/wp-content/uploads/2020/10/Multi-app-kiosk-example-1-600x452.png "Multi app kiosk example")

Now, when we reconfigure the kiosk configuration, we can use the versioning that we wrote to the registry and update that registry value using the script to keep track of the configuration version. We need to do three things so that the service desk can allow users to add printers to the kiosk:

1. Allow the Settings app to run.
2. Add the settings app to the Start Menu.
3. Configure a Group Policy to only show printers.

##  2. <a name='Scripttoupdatethekiosk'></a>Script to update the kiosk

The script we use to update the kiosk is a subset of what we used to deploy the kiosk computer. It reads the username we used when we deployed it and then reconfigures the kiosk using the updated XML payload in this script. The XML payload has two added lines compared to the one used for the initial deployment.

In the allowed apps section:

```xml
<App AppUserModelId="windows.immersivecontrolpanel\_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" />
```

And in the Start Menu section:

```xml
<start:Tile Size="2x2" Column="0" Row="6" AppUserModelID="windows.immersivecontrolpanel\_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" />
```

The script:

```powershell
# Name: MultiKiosk
# Authors: Jörgen Nilsson

# Set values
$Version="1.1"
$RegKeyName = "CCMEXECOSD"
$Domain="4sysops"
$FullRegKeyName = "HKLM:\SOFTWARE\" + $regkeyname 

$username=Get-ItemPropertyValue -Path $FullRegKeyName -Name "UserName"

function Update-KioskMode {

    $DomainUser = "$($Domain)\$($UserName)".TrimStart('\')

    $nameSpaceName="root\cimv2\mdm\dmmap"
    $className="MDM_AssignedAccess"
    $obj = Get-CimInstance -Namespace $namespaceName -ClassName $className
    Add-Type -AssemblyName System.Web
    $obj.Configuration = [System.Web.HttpUtility]::HtmlEncode(@"
    <?xml version="1.0" encoding="utf-8" ?>
    <AssignedAccessConfiguration 
      xmlns="http://schemas.microsoft.com/AssignedAccess/2017/config"
      xmlns:v2="http://schemas.microsoft.com/AssignedAccess/201810/config"
      xmlns:v3="http://schemas.microsoft.com/AssignedAccess/2020/config"
    >
      <Profiles>
        <Profile Id="{9A2A490F-10F6-4764-974A-43B19E722C23}">
          <AllAppsList>
            <AllowedApps>
              <App AppUserModelId="Windows.PrintDialog_cw5n1h2txyewy" />
              <App AppUserModelId="windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" />
              <App DesktopAppPath="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" />
              <App DesktopAppPath="C:\Program Files\Microsoft Office\root\Office16\Excel.exe" />
              <App DesktopAppPath="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" />
            </AllowedApps>
          </AllAppsList>
          <v2:FileExplorerNamespaceRestrictions>
            <v2:AllowedNamespace Name="Downloads"/>
            <v3:AllowRemovableDrives/>
          </v2:FileExplorerNamespaceRestrictions>
          <StartLayout>
            <![CDATA[<LayoutModificationTemplate xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout" Version="1" xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification">
                          <LayoutOptions StartTileGroupCellWidth="6" />
                          <DefaultLayoutOverride>
                            <StartLayoutCollection>
                              <defaultlayout:StartLayout GroupCellWidth="6">
                                <start:Group Name="Product">
                                  <start:DesktopApplicationTile Size="2x2" Column="0" Row="0" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk" />
                                  <start:DesktopApplicationTile Size="2x2" Column="2" Row="0" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk" />
                                  <start:DesktopApplicationTile Size="2x2" Column="4" Row="0" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" />
                                  <start:Tile Size="2x2" Column="0" Row="6" AppUserModelID="windows.immersivecontrolpanel_cw5n1h2txyewy!microsoft.windows.immersivecontrolpanel" />
                                </start:Group>
                              </defaultlayout:StartLayout>
                            </StartLayoutCollection>
                          </DefaultLayoutOverride>
                        </LayoutModificationTemplate>
                    ]]>
          </StartLayout>
          <Taskbar ShowTaskbar="true"/>
        </Profile>
      </Profiles>
      <Configs>
        <Config>
          <Account>$DomainUser</Account>
          <DefaultProfile Id="{9A2A490F-10F6-4764-974A-43B19E722C23}"/>
        </Config>
      </Configs>
    </AssignedAccessConfiguration>
"@)
    Set-CimInstance -CimInstance $obj
}

Update-KioskMode 

```

##  3. <a name='RunScriptinMEMCM'></a>Run Script in MEMCM

To reconfigure the kiosk, the script needs to be run in the system context. That is exactly what Run Script in MEMCM does. We could, of course, create a package/program in MEMCM and run the script, but Run Script is faster and cooler. To create the Run Script in MEMCM, save the script above and make any necessary changes to it.

Then, in the Configuration Manager console, we select **Create script** under **Software Library > Scripts** and import the script we saved earlier.

![Create script in MEMCM](https://4sysops.com/wp-content/uploads/2020/10/Create-script-in-MEMCM.png "Create script in MEMCM")

When the script is created, we need to find a coworker who can approve the script for us so we can run it. You could, of course, change the site settings so you can approve it yourself, but that is only recommended in a test environment.

![Script waiting for approval](https://4sysops.com/wp-content/uploads/2020/10/Script-waiting-for-approval.png "Script waiting for approval")

When the script is approved, we can run the script against the computer or collection of kiosk computers that need to be reconfigured. In the Admin console, select the kiosk computer you want to reconfigure and select the script to run.

![Run script](https://4sysops.com/wp-content/uploads/2020/10/Run-script.png "Run script")

When the script has finished, the Kiosk computer is reconfigured.

![Run script status](https://4sysops.com/wp-content/uploads/2020/10/Run-script-status.png "Run script status")

We could have added a reboot to the script so that the change takes effect. We need to configure one more thing before we restart and test the new configuration.

##  4. <a name='GroupPolicytoconfigureWindowssettingsoptions'></a>Group Policy to configure Windows settings options

When we deployed the kiosk computer, we moved the computer account in Active Directory to a dedicated OU used for kiosk computers. To only show the Printers page in Windows Settings, we create a Group Policy and link it to that OU with the "Settings Page Visibility" setting configured to "ShowOnly:Printers," as shown below.

![Settings page visibility](https://4sysops.com/wp-content/uploads/2020/10/Settings-page-visibility.png "Settings page visibility")

##  5. <a name='Summary'></a>Summary

The result is a reconfigured kiosk computer with a Start Menu layout as shown below.

![Updated kiosk](https://4sysops.com/wp-content/uploads/2020/10/Updated-kiosk.png "Updated kiosk")

When we launch Windows Settings to add our printer, only the Devices options are available for us to add our printer.

##  6. <a name='Subscribeto4sysopsnewsletter'></a>Subscribe to 4sysops newsletter

![Windows settings](https://4sysops.com/wp-content/uploads/2020/10/Windows-settings.png "Windows settings")

When deploying a Multi App kiosk machine, it is important to have a plan for reconfiguring it. It's preferable to do so without reinstalling it simply because it is faster. In this example, we used Run Scripts, which is one of the coolest features introduced in Configuration Manager. This is one example of how it can speed up tasks and make things easier and faster than they were before.
