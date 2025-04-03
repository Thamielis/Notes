# Deploy a Windows 10 multi-app kiosk with Microsoft Endpoint Manager Configuration Manager (MEMCM) and PowerShell

This post will cover how to create a maintainable Windows 10 multi-app kiosk with PowerShell and Configuration Manager and a PowerShell script that I wrote. I wrote a blog post here a couple of years ago about deploying [Windows 10 1809 in kiosk mode with an AD domain account][1]. Much has happened since then.

Contents
<!-- vscode-markdown-toc -->
- [Deploy a Windows 10 multi-app kiosk with Microsoft Endpoint Manager Configuration Manager (MEMCM) and PowerShell](#deploy-a-windows-10-multi-app-kiosk-with-microsoft-endpoint-manager-configuration-manager-memcm-and-powershell)
  - [1.  Configuring Assigned Access](#1--configuring-assigned-access)
  - [2. Configure auto logon](#2-configure-auto-logon)
  - [3. Deploying the kiosk using MEMCM](#3-deploying-the-kiosk-using-memcm)
  - [4. Configure kiosk mode](#4-configure-kiosk-mode)
  - [5. Reboot after OSD](#5-reboot-after-osd)
  - [6. Writing information to the registry](#6-writing-information-to-the-registry)
  - [7. Summary](#7-summary)
  - [8. Subscribe to 4sysops newsletter](#8-subscribe-to-4sysops-newsletter)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->

---
Kiosk machines, or single-purpose computers, are used in many scenarios and organizations. Kiosks come in several flavors, including single-purpose locked down kiosks and multi-app kiosks where you need to be able download files and work with them as well. They also need to be secure, as they are exposed in some use cases.

The result of the example script will look like the screen capture below.

![Multi app kiosk example](https://4sysops.com/wp-content/uploads/2020/10/Multi-app-kiosk-example.png "Multi app kiosk example")

We also allow access to removable media and the Downloads folder, so if we want to save a file in Google Chrome and then open it in Excel, for example, it possible as shown below.

![Open in Excel](https://4sysops.com/wp-content/uploads/2020/10/Open-in-Excel.png "Open in Excel")

The script will carry out the following configurations:

* Configure AutoLogon with a domain user
* Configure the Start Menu
* Add applications to the allow list
* Allow saving/reading from the Downloads folder
* Allow removable USB drives
* Write kiosk information to the registry

Here is the PowerShell script:

```powershell
# Name: MultiKiosk
# Authors: Jörgen Nilsson

[CmdletBinding()]
Param(
    [Parameter(Mandatory=$True)]
    [string]$Username,
    [Parameter(Mandatory=$True)]
    [string]$Password
  )

# Set values
$Version="1"
$RegKeyName = "CCMEXECOSD"
$FullRegKeyName = "HKLM:\SOFTWARE\" + $regkeyname 
$Domain="4sysops"

# Create Registry key 
New-Item -Path $FullRegKeyName -type Directory -ErrorAction SilentlyContinue

function Set-KioskMode {

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

$Code = @'
Add-Type @"
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
 
namespace PInvoke.LSAUtil {
    public class LSAutil {
        [StructLayout (LayoutKind.Sequential)]
        private struct LSA_UNICODE_STRING {
            public UInt16 Length;
            public UInt16 MaximumLength;
            public IntPtr Buffer;
        }
 
        [StructLayout (LayoutKind.Sequential)]
        private struct LSA_OBJECT_ATTRIBUTES {
            public int Length;
            public IntPtr RootDirectory;
            public LSA_UNICODE_STRING ObjectName;
            public uint Attributes;
            public IntPtr SecurityDescriptor;
            public IntPtr SecurityQualityOfService;
        }
 
        private enum LSA_AccessPolicy : long {
            POLICY_VIEW_LOCAL_INFORMATION = 0x00000001L,
            POLICY_VIEW_AUDIT_INFORMATION = 0x00000002L,
            POLICY_GET_PRIVATE_INFORMATION = 0x00000004L,
            POLICY_TRUST_ADMIN = 0x00000008L,
            POLICY_CREATE_ACCOUNT = 0x00000010L,
            POLICY_CREATE_SECRET = 0x00000020L,
            POLICY_CREATE_PRIVILEGE = 0x00000040L,
            POLICY_SET_DEFAULT_QUOTA_LIMITS = 0x00000080L,
            POLICY_SET_AUDIT_REQUIREMENTS = 0x00000100L,
            POLICY_AUDIT_LOG_ADMIN = 0x00000200L,
            POLICY_SERVER_ADMIN = 0x00000400L,
            POLICY_LOOKUP_NAMES = 0x00000800L,
            POLICY_NOTIFICATION = 0x00001000L
        }
 
        [DllImport ("advapi32.dll", SetLastError = true, PreserveSig = true)]
        private static extern uint LsaStorePrivateData (
            IntPtr policyHandle,
            ref LSA_UNICODE_STRING KeyName,
            ref LSA_UNICODE_STRING PrivateData
        );
 
        [DllImport ("advapi32.dll", SetLastError = true, PreserveSig = true)]
        private static extern uint LsaOpenPolicy (
            ref LSA_UNICODE_STRING SystemName,
            ref LSA_OBJECT_ATTRIBUTES ObjectAttributes,
            uint DesiredAccess,
            out IntPtr PolicyHandle
        );
 
        [DllImport ("advapi32.dll", SetLastError = true, PreserveSig = true)]
        private static extern uint LsaNtStatusToWinError (
            uint status
        );
 
        [DllImport ("advapi32.dll", SetLastError = true, PreserveSig = true)]
        private static extern uint LsaClose (
            IntPtr policyHandle
        );
 
        [DllImport ("advapi32.dll", SetLastError = true, PreserveSig = true)]
        private static extern uint LsaFreeMemory (
            IntPtr buffer
        );
 
        private LSA_OBJECT_ATTRIBUTES objectAttributes;
        private LSA_UNICODE_STRING localsystem;
        private LSA_UNICODE_STRING secretName;
 
        public LSAutil (string key) {
            if (key.Length == 0) {
                throw new Exception ("Key lenght zero");
            }
 
            objectAttributes = new LSA_OBJECT_ATTRIBUTES ();
            objectAttributes.Length = 0;
            objectAttributes.RootDirectory = IntPtr.Zero;
            objectAttributes.Attributes = 0;
            objectAttributes.SecurityDescriptor = IntPtr.Zero;
            objectAttributes.SecurityQualityOfService = IntPtr.Zero;
 
            localsystem = new LSA_UNICODE_STRING ();
            localsystem.Buffer = IntPtr.Zero;
            localsystem.Length = 0;
            localsystem.MaximumLength = 0;
 
            secretName = new LSA_UNICODE_STRING ();
            secretName.Buffer = Marshal.StringToHGlobalUni (key);
            secretName.Length = (UInt16) (key.Length * UnicodeEncoding.CharSize);
            secretName.MaximumLength = (UInt16) ((key.Length + 1) * UnicodeEncoding.CharSize);
        }
 
        private IntPtr GetLsaPolicy (LSA_AccessPolicy access) {
            IntPtr LsaPolicyHandle;
            uint ntsResult = LsaOpenPolicy (ref this.localsystem, ref this.objectAttributes, (uint) access, out LsaPolicyHandle);
            uint winErrorCode = LsaNtStatusToWinError (ntsResult);
            if (winErrorCode != 0) {
                throw new Exception ("LsaOpenPolicy failed: " + winErrorCode);
            }
            return LsaPolicyHandle;
        }
 
        private static void ReleaseLsaPolicy (IntPtr LsaPolicyHandle) {
            uint ntsResult = LsaClose (LsaPolicyHandle);
            uint winErrorCode = LsaNtStatusToWinError (ntsResult);
            if (winErrorCode != 0) {
                throw new Exception ("LsaClose failed: " + winErrorCode);
            }
        }
 
        private static void FreeMemory (IntPtr Buffer) {
            uint ntsResult = LsaFreeMemory (Buffer);
            uint winErrorCode = LsaNtStatusToWinError (ntsResult);
            if (winErrorCode != 0) {
                throw new Exception ("LsaFreeMemory failed: " + winErrorCode);
            }
        }
 
        public void SetSecret (string value) {
            LSA_UNICODE_STRING lusSecretData = new LSA_UNICODE_STRING ();
 
            if (value.Length > 0) {
                //Create data and key
                lusSecretData.Buffer = Marshal.StringToHGlobalUni (value);
                lusSecretData.Length = (UInt16) (value.Length * UnicodeEncoding.CharSize);
                lusSecretData.MaximumLength = (UInt16) ((value.Length + 1) * UnicodeEncoding.CharSize);
            } else {
                //Delete data and key
                lusSecretData.Buffer = IntPtr.Zero;
                lusSecretData.Length = 0;
                lusSecretData.MaximumLength = 0;
            }
 
            IntPtr LsaPolicyHandle = GetLsaPolicy (LSA_AccessPolicy.POLICY_CREATE_SECRET);
            uint result = LsaStorePrivateData (LsaPolicyHandle, ref secretName, ref lusSecretData);
            ReleaseLsaPolicy (LsaPolicyHandle);
 
            uint winErrorCode = LsaNtStatusToWinError (result);
            if (winErrorCode != 0) {
                throw new Exception ("StorePrivateData failed: " + winErrorCode);
            }
        }
    }
}
"@
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultUserName" -Value "%USERNAME%"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "DefaultDomainName" -Value "%DOMAINNAME%"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoAdminLogon" -Value "1"
[PInvoke.LSAUtil.LSAutil]::new("DefaultPassword").SetSecret("%PASSWORD%")
Unregister-ScheduledTask -TaskName "CreateAutologon" -Confirm:$false -EA SilentlyContinue
Restart-Computer -Force
'@

function Create-Task ($Argument) {

    $Schedule = New-Object -ComObject "Schedule.Service"
    $Schedule.Connect('localhost')
    $Folder = $Schedule.GetFolder('\')

    $task = $Schedule.NewTask(0)
    $task.RegistrationInfo.Author = "Onevinn"
    $task.RegistrationInfo.Description = "CreateAutologon"

    $action = $task.Actions.Create(0)
    $action.Path = "PowerShell.exe"
    $action.Arguments = "$Argument"

    $task.Settings.StartWhenAvailable = $true

    $trigger = $task.Triggers.Create(8)
    $trigger.Delay = "PT120S"


    $result = $Folder.RegisterTaskDefinition("CreateAutologon", $task, 0, "SYSTEM", $null, 5)
}

$Code = $Code.Replace("%USERNAME%", $Username)
$Code = $Code.Replace("%DOMAINNAME%", $Domain)
$Code = $Code.Replace("%PASSWORD%", $Password)

$bytes = [System.Text.Encoding]::Unicode.GetBytes($Code)
$b64 = [System.Convert]::ToBase64String($bytes)

Set-KioskMode

Create-Task -Argument "-EncodedCommand $($b64)"

# Set registry values to be used later
new-itemproperty $FullRegKeyName -Name "Kiosk Version" -Value $Version -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null
new-itemproperty $FullRegKeyName -Name "UserName" -Value $username -Type STRING -Force -ErrorAction SilentlyContinue | Out-Null

```

## 1.  <a name='ConfiguringAssignedAccess'></a>Configuring Assigned Access

We configure the assigned access parts in the script in the XML that we configure in the script. More information about what we can configure can be found [here][11] and [here][12]. Examples are included.

```xml
<AssignedAccessConfiguration 
   xmlns="http://schemas.microsoft.com/AssignedAccess/2017/config"
   xmlns:v2="http://schemas.microsoft.com/AssignedAccess/201810/config"
   xmlns:v3="http://schemas.microsoft.com/AssignedAccess/2020/config"
\>
```

The AllowedApps section lists all apps that can run. In the back end, this includes AppLocker rules that are created on the machine, so troubleshooting in a third-party application calls more binaries. These binaries also need to be listed to be allowed to run. Everything that is not on the list is blocked.

```xml
<AllowedApps>
     <App AppUserModelId="Windows.PrintDialog_cw5n1h2txyewy" />
     <App DesktopAppPath="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" />
     <App DesktopAppPath="C:\Program Files\Microsoft Office\root\Office16\Excel.exe">
     <App DesktopAppPath="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" />
</AllowedApps>
```

Allowing folder access and removable media is done by using the V2 and V3 schemas that we defined earlier in the XML file, as shown in the example below. It is very easy to add new folders if necessary.

```xml
<v2:FileExplorerNamespaceRestrictions>
     <v2:AllowedNamespace Name="Downloads"/>
     <v3:AllowRemovableDrives/>
</v2:FileExplorerNamespaceRestrictions>
```

##  2. <a name='Configureautologon'></a>Configure auto logon

In my previous post, I used Group Policy preferences to configure AutoLogon, which stores the username and password in clear text in the registry. I also used AutoLogon.exe, which is a Microsoft tool that configures AutoLogon since it stores passwords as LSA secrets and not in clear text in the registry. In the sample script posted here, there is a section rewritten by my colleague, Johan Schrewelius, which does the same thing that AutoLogon.exe does. It also adds a scheduled task that is used to configure AutoLogon, as all attempts to configure it during OS deployment are cleared by the OOBE part of the setup.

##  3. <a name='DeployingthekioskusingMEMCM'></a>Deploying the kiosk using MEMCM

To deploy the kiosk script using Configuration Manager, I have a kiosk group in my task sequence that includes the following steps:

![Task sequence steps](https://4sysops.com/wp-content/uploads/2020/10/Task-sequence-steps.png "Task sequence steps")

Task sequence steps

For the kiosk computers, I added them to a collection with the variables shown below:

![Collection variables](https://4sysops.com/wp-content/uploads/2020/10/Collection-variables.png "Collection variables")

Collection variables

The variables are picked up by the PowerShell script in the task sequence when we deploy the computer. In my script, I hardcoded the domain name, which could easily have been a variable as well. It is set early in the script:

```powershell
$Domain="4sysops"
```

Let's look at the three different steps in the task sequence. Move to correct OUI use a simple PowerShell script to move the computer to my Kiosk OU to make sure that the correct Group Policies are applied. It is then executed using an account with the correct permissions to move the account in AD.

![Move to correct OU](https://4sysops.com/wp-content/uploads/2020/10/Move-to-correct-OU-600x509.png)
Move to correct OU

##  4. <a name='Configurekioskmode'></a>Configure kiosk mode

This step executes the PowerShell script that configures the computer in Kiosk mode. The variables passed to the script are -Username and -Password, as shown below.

![Configure Kiosk Mode](https://4sysops.com/wp-content/uploads/2020/10/Configure-Kiosk-Mode-600x510.png)
Configure Kiosk Mode

##  5. <a name='RebootafterOSD'></a>Reboot after OSD

This step sets the task sequence variable "SMSTSPOSTaction," which reboots the computer after OSD is finished. There will be dual reboots before the computer is in kiosk mode, one caused by the SMSTSPostaction and one caused by the scheduled task that is configured. AutoLogon.

![Reboot after OSD](https://4sysops.com/wp-content/uploads/2020/10/Reboot-after-OSD.png "Reboot after OSD")
Reboot after OSD

##  6. <a name='Writinginformationtotheregistry'></a>Writing information to the registry

We also write information to the registry about the account that was used and the version of the kiosk configuration. This comes in handy if and when we need to update the machine's kiosk configuration.

![Registry value](https://4sysops.com/wp-content/uploads/2020/10/Registry-value.png "Registry value")
Registry value

The name of the registry key can be modified in the script at the very beginning by changing the variable to your preference.

```powershell
$RegKeyName = "CCMEXECOSD"
```

##  7. <a name='Summary'></a>Summary

If you are still deploying kiosk machines and locking them down with Group Policy, AppLocker, and scripts, I highly recommend that you check out assigned access mode. It is so simple to deploy and lock down straight off and is locked down much more tightly than many kiosk setups I have seen.

##  8. <a name='Subscribeto4sysopsnewsletter'></a>Subscribe to 4sysops newsletter

In my next post, I will explain how you can [update the Windows 10 kiosk][19].

[1]: https://4sysops.com/archives/windows-10-1809-kiosk-mode-with-an-ad-domain-account/
[11]: https://docs.microsoft.com/en-us/windows/configuration/kiosk-xml
[12]: https://docs.microsoft.com/en-us/windows/configuration/lock-down-windows-10-to-specific-apps
[19]: https://4sysops.com/archives/update-windows-10-multi-app-kiosk-using-run-script-in-microsoft-endpoint-configuration-manager-memcm/
