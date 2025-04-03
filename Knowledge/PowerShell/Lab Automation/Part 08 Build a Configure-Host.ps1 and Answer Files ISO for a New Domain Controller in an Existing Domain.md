---
created: 2022-03-04T13:09:44 (UTC +01:00)
tags: []
source: https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-viii-build-a-configure-host-ps1-and-answer-files-iso-for-new-domain-controller-in-existing-domain/
author: Published by feardamhan
---

# Lab Automation: Unattended Windows Deployments including AD Forests, Domains and SQL server – Part VIII: Build a Configure-Host.ps1 and Answer Files ISO for a New Domain Controller in an Existing Domain – FearDamhan

> ## Excerpt
> In this post we are going to build on what we did in Post VII where we built a new forest. This time we are going to add a second domain controller to that root domain ie Forest Root DC 02 PowerShe…

---
In this post we are going to build on what we did in Post VII where we built a new forest. This time we are going to add a second domain controller to that root domain ie **Forest Root DC 02**

![](https://feardamhancom.files.wordpress.com/2020/02/unattendedwindowsinstalls-domain-topology.png?w=371)

### PowerShell Script for New Domain Controller

This is the complete function that:

-   Customizes the autounattend.xml (covered in previous post in series)
-   Creates the Configure-Host.ps1 file
-   Builds the answerfiles-iso
-   Uploads the ISO to a vSphere Datastore

As you read the below, you will see a series of ‘Add-Content’ commands. Effectively, we are using these to construct a bespoke Configure-Host.ps1 file that will be included on the answer files ISO we build for the VM. Things to note:

-   In some cases we are creating lines where we want values from the script to be passed into the file.
-   In other cases we are actually creating variables on the remote machine to be used during execution

This function is very similar to that used to create the initial forest, with a few key differences:

-   The command to deploy a forest is replaced with the command to add a domain controller
-   The timing of setting the initial DNS server entry. We need to do it earlier in order to locate the existing domain and join it
-   The timing of setting the secondary DNS server entry. In this case, it will be itself, and we cant configure the setting until after we have installed DNS Server on the box

```powershell
Function createRootDCBConfigISO
{
    param(
    [parameter(mandatory=$true)]
    [array]$machineObject,
    [parameter(mandatory=$true)]
    [array]$sharedDetails,
    [parameter(mandatory=$true)]
    [array]$domainDetails
    )
    #Cleanup Temporary folders if they exist
    $folderExists = Test-Path $buildfolder
    If ($folderExists)
    {
       LogMessage "Cleaning Up up Temporary Folders"
       Remove-Item $buildfolder -recurse -force -confirm:$false
    }

    #create necessary folders
    LogMessage "Creating Temporary Folders"
    New-Item -ItemType Directory -Path $buildfolder | Out-File $logFile -encoding ASCII -append 
    New-Item -ItemType Directory -Path "$buildfolder\SupportingFiles" | Out-File $logFile -encoding ASCII -append 
    New-Item -ItemType File -Path "$buildfolder\SupportingFiles\configure-host.ps1" | Out-File $logFile -encoding ASCII -append 
    LogMessage "Creating and Injecting Windows Unattended Installation File"

    #Set the target output file
    $DestinationAnswerFilesIsoPath = "$isosPath\$environment-$($machineObject.machinename)-answerfiles.iso"
    
    #Read in the template AutoUnattend.xml for RootDC-B, replace key strings with values from JSON inputs and save to working folder
    $AutoUnattendXml = Get-Content $rootDCTemplateXml   
    $AutoUnattendXml | ForEach-Object { $_ `
        -replace '<!--REPLACE WITH PRODUCTKEY-->',$commonJSON.isoGeneration.productKey `
        -replace '<!--REPLACE WITH MACHINENAME-->',$machineObject.machinename `
        -replace '<!--REPLACE WITH IPCIDR-->', $machineObject.ipCidr `
        -replace '<!--REPLACE WITH GATEWAY-->',$machineObject.gateway `
        -replace '<!--REPLACE WITH ADMINISTRATOR PASSWORD-->',$commonJson.environment.commonPassword `
        -replace '<!--REPLACE WITH CHILD DOMAIN-->',$sharedDetails.activeDirectory.childDomain `
        -replace '<!--REPLACE WITH ROOT DOMAIN-->',$commonJSON.activeDirectory.rootDomain `
    } | Set-Content "$buildfolder\SupportingFiles\autounattend.xml"

    #Create configure-host.ps1 file content
    LogMessage "Creating Post Installation Scripts"
    #Start transcript on VM being built, to ease troubleshooting
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Start-Transcript "C:\Windows\Setup\Scripts\transcript.txt"'

    #Remove any localhost DNS servers and add first dns server (allowing us to resolve existing RootDC)
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip del dns Ethernet0 all"
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip add dns Ethernet0 $($machineObject.dnsServer1) index=1"

    #Set desired timezone (in this case hard coded)
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'tzutil /s "GMT Standard Time"'

    #Enable RDP
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty -path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters" -Name "AllowEncryptionOracle" -Value "2" -type DWORD'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0 -PropertyType dword -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\" -Name "UserAuthentication" -Value 0'    
    
    #Enable PS Remoting to allow management via remote machines
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Enable-PSRemoting -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-Item wsman:\localhost\client\trustedhosts * -Force'

    #Install the required Windows Feature to deploy AD
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Install-windowsfeature AD-Domain-Services'
    #Install the AD module required
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Import-Module ADDSDeployment'

    #Build up details required to deploy the new DC into the forest, including required credentials object
    $newline = '$PlainSafeModeAdministratorPassword = "'+$commonJSON.activeDirectory.rootDefaultAdministratorPassword+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$SecureSafeModeAdministratorPassword = ConvertTo-SecureString -String $PlainSafeModeAdministratorPassword -AsPlainText -Force'
    $rootAdministrator = 'Administrator@'+$commonJSON.activeDirectory.rootDomain
    $newline = '$lab_username = "'+$rootAdministrator+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$lab_credentials = New-Object System.Management.Automation.PSCredential ($lab_username, $SecureSafeModeAdministratorPassword)'
    
    #Build command required to deploy the new domain controller
    $newline = 'Install-ADDSDomainController -InstallDns:$true -Credential $lab_credentials -DomainName '+$commonJSON.activeDirectory.rootDomain+' -NoRebootOnCompletion:$true -SafeModeAdministratorPassword $SecureSafeModeAdministratorPassword -force:$true'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline

    #Install AD Management Tools
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Install-WindowsFeature -name "RSAT-ADDS"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Install-WindowsFeature -name "RSAT-ADLDS"'
    
    #Set secondary DNS server (to itself) now that DNS is installed
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip add dns Ethernet0 $($machineObject.dnsServer2) index=2"

    #Copy windows source files to VM and set policy
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'mkdir C:\sources\sxs'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'xcopy D:\sources\sxs C:\sources\sxs /e /v /c'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Servicing\" -Name "LocalSourcePath" -value "c:\sources\sxs"'

    #Set powershell parameters
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ExecutionPolicy Unrestricted'

    #Supress UAC
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value "0"'
    
    #Disable IPv6
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Tcpip6\Parameters" -Name "DisabledComponents" -Value 0xff'

    #set the credentials used for Auto Login (if required)
    $domainNameParts = $commonJSON.activeDirectory.rootDomain -split "\."
    $netBIOSName = $domainNameParts[0]
    $newline = '$DefaultDomainName = "'+$netBIOSName+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    $newline = '$DefaultUsername = "'+$netBIOSName+'\Administrator"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    $newline = '$DefaultPassword = '
    $newline += "'"
    $newline += $commonJSON.activeDirectory.rootDefaultAdministratorPassword
    $newline += "'"
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline

    #Configure to autologin as domain admin (as required)
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "AutoAdminLogon" -Value "1" -type String '
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "DefaultDomainName" -Value "$DefaultDomainName" -type String'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "DefaultUsername" -Value "$DefaultUsername" -type String'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "DefaultPassword" -Value "$DefaultPassword" -type String'

    #Disable IE Enhanced Security
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 -Force'

    #configure TimeSync
    $newline = 'w32tm /config /manualpeerlist:'+$commonJSON.labNTP.externalNTP+' /syncfromflags:MANUAL'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'net stop w32time'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'net start w32time'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'w32tm /resync'
    
    #Remove the SetupComplete.cmd file
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Remove-Item C:\Windows\Setup\Scripts\SetupComplete.cmd -force'

    #Stop Transcript
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Stop-Transcript'

    #Final Reboot
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Restart-Computer -force' 
    LogMessage "Creating Configuration ISO for $environment-$($machineObject.machinename)-answerfiles.iso for environment $environment"
    
    #Create Answerfiles ISO
    $data = '2#p0,e,b"{0}"#pEF,e,b"{1}"' -f $etfsboot, $efisys
    start-process $oscdimg -args @("-bootdata:$data",'-u2','-udfver102', "$buildfolder\SupportingFiles", $DestinationAnswerFilesIsoPath) -wait -nonewwindow -RedirectStandardError Null1 -RedirectStandardOutput Null2
    
    #Upload ISO (separate powershell function not shown here)
    uploadISO External $domainDetails $commonJSON.environment.type $sharedDetails $DestinationAnswerFilesIsoPath
}
```

Next I’ll show how to add a child domain to the forest

### Posts in this Series

-   [Part 1: Overview](https://feardamhan.com/2020/01/14/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-i-overview/)
-   [Part 2: Reading JSON](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ii-sample-json-and-reading-it/)
-   [Part 3: Creating a Single Binaries ISO](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iii-building-a-single-binaries-iso/)
-   [Part 4: Understanding the autoUnattend.xml](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-iv-understanding-and-building-the-autounattend-xml-file/)
-   [Part 5: Creating a Configure-Host.ps1 and Building the Answerfiles ISO for SQL Server](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-v-build-a-configure-host-ps1-and-answer-files-iso-for-sql-server/)
-   [Part 6: Creating the VM](https://feardamhan.com/2020/01/23/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-vi-creating-and-configuring-the-vm/)
-   [Part 7: Creating a New Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)
-   [Part 8: Adding a Domain Controller to an Existing Domain](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-viii-build-a-configure-host-ps1-and-answer-files-iso-for-new-domain-controller-in-existing-domain/)
-   [Part 9: Adding a New Child Domain to an Existing Active Directory Forest](https://feardamhan.com/2020/02/05/lab-automation-unattended-windows-deployments-including-ad-forests-domains-and-sql-server-part-ix-build-a-configure-host-ps1-and-answer-files-iso-for-new-child-domain-in-an-existing-forest/)
