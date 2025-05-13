# Windows 10 1809 kiosk mode with an AD domain account

One of the great new features in Windows 10 1809 is that Microsoft Edge now supports kiosk mode. It is extremely easy to configure and long awaited, so we don't have to use Internet Explorer or Google Chrome for our kiosk computers.

Contents
<!-- vscode-markdown-toc -->
- [Windows 10 1809 kiosk mode with an AD domain account](#windows-10-1809-kiosk-mode-with-an-ad-domain-account)
  - [1. Configure Edge for kiosk/assigned access with a local account](#1-configure-edge-for-kioskassigned-access-with-a-local-account)
  - [2. Configure Edge kiosk/assigned access with an AD domain account](#2-configure-edge-kioskassigned-access-with-an-ad-domain-account)
  - [3. Configure Microsoft Edge using Group Policy](#3-configure-microsoft-edge-using-group-policy)
  - [4. Configure autologon using Group Policy Preferences](#4-configure-autologon-using-group-policy-preferences)
  - [5. Deployment with a Configuration Manager task sequence](#5-deployment-with-a-configuration-manager-task-sequence)
  - [6. Subscribe to 4sysops newsletter!](#6-subscribe-to-4sysops-newsletter)

<!-- vscode-markdown-toc-config
	numbering=true
	autoSave=true
	/vscode-markdown-toc-config -->
<!-- /vscode-markdown-toc -->
---
Setting up Windows 10 1809 in kiosk mode using Intune is really easy and beautiful. If you have the chance, be sure to test it out. The kiosk mode in Microsoft Edge is great. We can configure a reset after idle time and configure the behavior of Microsoft Edge in kiosk, single, or multi-app mode. An example might look like the screenshot below:

![Microsoft Edge in kiosk mode](https://4sysops.com/wp-content/uploads/2018/11/Microsoft-Edge-in-kiosk-mode-600x451.png)

Microsoft Edge in kiosk mode

##  1. <a name='ConfigureEdgeforkioskassignedaccesswithalocalaccount'></a>Configure Edge for kiosk/assigned access with a local account

I recommend a local account when using Windows 10 in kiosk/assigned access so you don't expose domain credentials. To do this (during operating system deployment using Configuration Manager for instance) we can simply run a PowerShell script:

```powershell
$usrname = 'Kiosk'
$PlainPassword = "Kiosk0!234"
$SecurePassword = $PlainPassword | ConvertTo-SecureString -AsPlainText  Force
New-LocalUser -Name Kiosk -Password $SecurePassword -PasswordNeverExpires  -UserMayNotChangePassword
Set-AssignedAccess -AppUserModelId Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge -UserName $usrname
```

The script performs these actions:

1. Creates a local user named "Kiosk"
2. Sets a password for that user
3. Configures Microsoft Edge to run in kiosk/assigned access for the local user named "Kiosk"

##  2. <a name='ConfigureEdgekioskassignedaccesswithanADdomainaccount'></a>Configure Edge kiosk/assigned access with an AD domain account

This is really easy, but if we want to want to use a domain account, it becomes much harder, since we can't use the built-in PowerShell command to configure assigned access for just that domain account. However, we have the PowerShell WMI Bridge.

The PowerShell script below will use the PowerShell WMI Bridge to configure Microsoft Edge for "User1" in the "CCMEXEC" domain. Note: The script must be executed in System context.

```powershell
$LogonDomain = "CCMEXEC"
$User = "Kiosk"

function Set-KioskMode {
    param(
        [string]$Domain,
        [string]$UserName
    )
    
    $User = "$($Domain)\$($UserName)".TrimStart('\')
    
    $nameSpaceName="root\cimv2\mdm\dmmap"
    $className="MDM_AssignedAccess"
    $obj = Get-CimInstance -Namespace $namespaceName -ClassName $className
    
    $obj.Configuration = @"
    <?xml version="1.0" encoding="utf-8" ?>
    <AssignedAccessConfiguration
        xmlns="http://schemas.microsoft.com/AssignedAccess/2017/config"
        xmlns:rs5="http://schemas.microsoft.com/AssignedAccess/201810/config"
        >
        <Profiles>
            <Profile Id="{AFF9DA33-AE89-4039-B646-3A5706E92957}">
                <KioskModeApp AppUserModelId="Microsoft.MicrosoftEdge_8wekyb3d8bbwe!MicrosoftEdge"/>
            </Profile>
        </Profiles>
        <Configs>
            <Config>
                <Account>$($User)</Account>
                <DefaultProfile Id="{AFF9DA33-AE89-4039-B646-3A5706E92957}"/>
            </Config>
        </Configs>
    </AssignedAccessConfiguration>
"@
    
    Set-CimInstance -CimInstance $obj
}

Set-KioskMode -Domain $LogonDomain -UserName $User
```

##  3. <a name='ConfigureMicrosoftEdgeusingGroupPolicy'></a>Configure Microsoft Edge using Group Policy

Windows 10 1809 introduces new Microsoft Edge Group Policies we can use to configure Microsoft Edge in kiosk mode. Here are the Group Policies I have configured in my example.

![Microsoft Edge Group Policy settings](https://4sysops.com/wp-content/uploads/2018/11/Microsoft-Edge-Group-Policy-settings-600x160.png)

The two new settings are "Configure kiosk mode" and "Configure kiosk reset after idle timeout" where we configure the use of Microsoft Edge in multi-app mode or single-app mode and the idle timeout before it refreshes the session. I use the "Configure Start pages" Group Policy to set the start page for the kiosk as well. It's really simple.

![Configuring kiosk mode](https://4sysops.com/wp-content/uploads/2018/11/Configuring-kiosk-mode.png)

And this is the policy that sets the idle timeout:

![Setting the timeout limit](https://4sysops.com/wp-content/uploads/2018/11/Setting-the-timeout-limit.png)

##  4. <a name='ConfigureautologonusingGroupPolicyPreferences'></a>Configure autologon using Group Policy Preferences

I prefer to configure autologon using Group Policy Preferences, so you can easily change the password. You could configure it during operating system deployment as well of course or by using a script. I have two different organizational units (OUs): one for the kiosk with the local logon and one for computers for the domain account to log onto. We could filter this using security groups as well, but the functionality is the same, and I use the same Group Policy Object (GPO) to configure the OS and Microsoft Edge in kiosk mode as well.

The autologon registry keys are basically the same; for the kiosk GPO that uses a local user, simply remove the _DefaultDomainName_ registry key.

![Autologon registry keys](https://4sysops.com/wp-content/uploads/2018/11/Autologon-registry-keys-600x95.png)

##  5. <a name='DeploymentwithaConfigurationManagertasksequence'></a>Deployment with a Configuration Manager task sequence

How do we deploy the kiosk machines then? Well, in my lab, I use my own PowerShell front-end, which is not worth mentioning here. You can use collection variables, computer variables, or a front-end where you can select which kiosk you want to deploy. In the _Task Sequence_, I filter the group based on a _Task Sequence Variable_. I follow these steps:

1. Run the PowerShell script to configure kiosk/assigned access
2. Move the computer to the correct OU
3. Restart the computer
4. Set the _SMSTSPostAction_ to run "cmd /c shutdown /r /t 60 /f" that so far has applied the correct GPO so that autologon works after the first reboot. You could modify this to run a GPUpdate as well if necessary.

![Condition for the KioskDomain group](https://4sysops.com/wp-content/uploads/2018/11/Condition-for-the-KioskDomain-group.png)

Configuring the kiosk mode step that runs the script

For the step that moves the computer to the correct OU, I use the script I blogged about [here][17]. [We could also use][18] a web service as long as we move the computer to the correct OU.

![Moving the computer object to the OU](https://4sysops.com/wp-content/uploads/2018/11/Moving-the-computer-object-to-the-OU-600x467.png)

And the next step configures the _SMSTSpostaction_.

##  6. <a name='Subscribeto4sysopsnewsletter'></a>Subscribe to 4sysops newsletter!

![Setting the SMSTSpostaction variable](https://4sysops.com/wp-content/uploads/2018/11/Setting-the-SMSTSpostaction-variable.png)

That's it! We now have a script for configuring a Windows 10 1809 system in kiosk mode using either a local user account or a domain user account. The latter one is a bit more challenging to configure.

[17]: https://ccmexec.com/2018/03/move-the-computer-to-the-correct-ou-during-osd-ps-version/
[18]: https://ccmexec.com/2016/10/web-service-for-os-deployment-sccm-configuration-manager-current-branch/
