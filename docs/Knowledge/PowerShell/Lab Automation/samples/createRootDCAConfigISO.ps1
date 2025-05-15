
Function createRootDCAConfigISO
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

    #Read in the template AutoUnattend.xml for RootDC, replace key strings with values from JSON inputs and save to working folder
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
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Install-WindowsFeature AD-Domain-Services'
    #Install the AD module required
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Import-Module ADDSDeployment'
    
    #Build up details required to deploy the new Forest
    $newline = '$PlainSafeModeAdministratorPassword = "'+$commonJSON.activeDirectory.rootDefaultAdministratorPassword+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$SecureSafeModeAdministratorPassword = ConvertTo-SecureString -String $PlainSafeModeAdministratorPassword -AsPlainText -Force'
    $domainNameParts = $commonJSON.activeDirectory.rootDomain -split "\."
    $netBIOSName = $domainNameParts[0]

    #Build command required to deploy the Forest
    $newline = 'Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold" -DomainName "'+$commonJSON.activeDirectory.rootDomain+'" -DomainNetbiosName "'+$netBIOSName+'" -ForestMode "WinThreshold" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$true -SysvolPath "C:\Windows\SYSVOL" -Force:$true -SafeModeAdministratorPassword $SecureSafeModeAdministratorPassword'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    
    #Remove localhost DNS server address and set permanent DNS servers
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip del dns Ethernet0 all"
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip add dns Ethernet0 $($machineObject.dnsServer1) index=1"
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip add dns Ethernet0 $($machineObject.dnsServer2) index=2"
    
    #Install AD Management Tools
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Install-WindowsFeature -name "RSAT-ADDS"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Install-WindowsFeature -name "RSAT-ADLDS"'
    
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
