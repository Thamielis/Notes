

Function createSQLConfigISO
{
    param(
    [parameter(mandatory=$true)]
    [array]$machineObject,
    [parameter(mandatory=$true)]
    [array]$sharedDetails,
    [parameter(mandatory=$true)]
    [array]$domainDetails
    )
    #Create necessary folders
    LogMessage "Creating Temporary Folders"
    New-Item -ItemType Directory -Path $buildfolder | Out-File $logFile -encoding ASCII -append
    New-Item -ItemType Directory -Path "$buildfolder\SupportingFiles" | Out-File $logFile -encoding ASCII -append
    New-Item -ItemType File -Path "$buildfolder\SupportingFiles\configure-host.ps1" | Out-File $logFile -encoding ASCII -append
    
    LogMessage "Creating and Injecting Windows Unattended Installation File"
    
    #Set destination iso file name
    $DestinationAnswerFilesIsoPath = "$isosPath\$environment-$($machineObject.machinename)-answerfiles.iso"
    
    #Read in the template AutoUnattend.xml for SQL, replace key strings with values from JSON inputs and save to working folder
    $AutoUnattendXml = Get-Content $sqlTemplateXml
    $AutoUnattendXml | ForEach-Object { $_ `
        -replace '<!--REPLACE WITH PRODUCTKEY-->',$commonJSON.isoGeneration.productKey `
        -replace '<!--REPLACE WITH MACHINENAME-->',$machineObject.machinename `
        -replace '<!--REPLACE WITH IPCIDR-->', $machineObject.ipCidr `
        -replace '<!--REPLACE WITH GATEWAY-->',$machineObject.gateway `
        -replace '<!--REPLACE WITH ADMINISTRATOR PASSWORD-->',$commonJson.environment.commonPassword `
        -replace '<!--REPLACE WITH CHILD DOMAIN-->',$sharedDetails.activeDirectory.childDomain `
        -replace '<!--REPLACE WITH ROOT DOMAIN-->',$commonJSON.activeDirectory.rootDomai `
    } | Set-Content "$buildfolder\SupportingFiles\autounattend.xml"

    #Read in template SQL installation answer file, replace key strings and save to working flder
    LogMessage "Creating and Injecting files required for SQL Installation"
    $domainNameParts = $commonJSON.activeDirectory.rootDomain -split "\."
    $netBIOSName = $domainNameParts[0] 
    $configIni = Get-Content $SQLConfigurationFilePath
    $configIni | ForEach-Object { $_ `
        -replace '<!--REPLACE WITH ADMINISTRATOR PASSWORD-->',$commonJson.environment.commonPassword `
        -replace '<!--REPLACE WITH ROOT NETBIOS NAME-->',$netBIOSName `
    } | Set-Content "$buildfolder\SupportingFiles\sql-configuration-file.ini"
    
    #Copy pre-create SQL Database creation script to working folder
    copy-item $SQLDatabaseScriptPath -Destination "$buildfolder\SupportingFiles"
    
    #Create configure-host.ps1 file content
    LogMessage "Creating Post Installation Scripts"
    
    #Start transcript on VM being built, to ease troubleshooting
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Start-Transcript "C:\Windows\Setup\Scripts\transcript.txt"'
    
    #Set desired DNS Servers
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip add dns Ethernet0 $($machineObject.dnsServer1)"
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "netsh interface ip add dns Ethernet0 $($machineObject.dnsServer2) index=2"
    
    #Set desired timezone (in this case hard coded)
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'tzutil /s "GMT Standard Time"'
    
    #Build up details to create a powershell credential needed to add server to domain
    $rootAdministrator = 'Administrator@'+$commonJSON.activeDirectory.rootDomain
    $newline = '$lab_username = "'+$rootAdministrator+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    $newline = '$lab_plain_password = "'+$commonJson.environment.commonPassword+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$lab_password = ConvertTo-SecureString -String $lab_plain_password -AsPlainText -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$lab_credentials = New-Object System.Management.Automation.PSCredential ($lab_username, $lab_password)'

    #Add server to domain
    $newline = 'Add-Computer -DomainName '+$($commonJSON.activeDirectory.rootDomain)+' -Credential $lab_credentials'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    
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
    
    #Add specific user as admin (as required)
    $domainNameParts = $commonJSON.activeDirectory.rootDomain -split "\."
    $netBIOSName = $domainNameParts[0]    
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" "net localgroup administrators $netBIOSName\special-admin /add"
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"'

    #Configure said admin to autologin (as required)
    $newline = '$DefaultDomainName = "'+$netBIOSName+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    $newline = '$DefaultUsername = "'+$netBIOSName+'\special-admin"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    $newline = '$DefaultPassword = "'+$commonJSON.activeDirectory.rootDefaultAdministratorPassword+'"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" $newline
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "AutoAdminLogon" -Value "1" -type String '
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "DefaultDomainName" -Value "$DefaultDomainName" -type String'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "DefaultUsername" -Value "$DefaultUsername" -type String'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty $RegPath -Name "DefaultPassword" -Value "$DefaultPassword" -type String'

    #Disable IE Enhanced Security
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$AdminKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$UserKey = "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $AdminKey -Name "IsInstalled" -Value 0 -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $UserKey -Name "IsInstalled" -Value 0 -Force'

    #Enable RDP
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-Item -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty -path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System\CredSSP\Parameters" -Name "AllowEncryptionOracle" -Value "2" -type DWORD'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0 -PropertyType dword -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\" -Name "UserAuthentication" -Value 0'    

    #Install SQL
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'D:\Software\SQL-Install\setup.exe /ConfigurationFile=E:\sql-configuration-file.ini'

    #Create Database
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$con = New-Object Data.SqlClient.SqlConnection;'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$con.ConnectionString = "Data Source=.;Initial Catalog=master;UID=sa;PWD=VMw@re1!";'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$con.Open();'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$sql = get-content E:\sql-create-database-ps.txt'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$cmd = New-Object Data.SqlClient.SqlCommand $sql, $con;'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$cmd.ExecuteNonQuery();'
    
    #Install SQL Management Studio
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Start-Process "D:\Software\SQL-Install\SSMS-Setup-ENU.exe" -args "/Install /Passive /Norestart" -wait'

    #Configure MSDTC
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" '$MSTDCKey = "HKLM:\SOFTWARE\Microsoft\MSDTC\Security"'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $MSTDCKey -Name "NetworkDtcAccess" -Value 1 -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $MSTDCKey -Name "NetworkDtcAccessAdmin" -Value 1 -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $MSTDCKey -Name "NetworkDtcAccessClients" -Value 1 -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $MSTDCKey -Name "NetworkDtcAccessTransactions" -Value 1 -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $MSTDCKey -Name "NetworkDtcAccessInbound" -Value 1 -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-ItemProperty -Path $MSTDCKey -Name "NetworkDtcAccessOutbound" -Value 1 -Force'

    #Enable PS Remoting to allow management via remote machines
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Enable-PSRemoting -Force'
    Add-Content "$buildfolder\SupportingFiles\configure-host.ps1" 'Set-Item wsman:\localhost\client\trustedhosts * -Force'

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
    uploadISO Internal $domainDetails $commonJSON.environment.type $sharedDetails $DestinationAnswerFilesIsoPath
}
