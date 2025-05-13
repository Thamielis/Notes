<#
.synopsis

Install or uninstall the MBAM Recovery and Hardware Service on MP role server

.description

Requires MP site role to be fully installed. Assumes MBAMRecoverySer.cab deployed
to the location specified in HKLM\SOFTWARE\Microsoft\SMS\Indetification 'Installation
Directory' value.

Script also depends on other MP registry values from HKLM\SOFTWARE\Microsoft\SMS\MP

.parameter Uninstall

Switch parameter. Uninstalls MBAM Recovery Service when present.

#>
param(
    [Parameter(Mandatory=$false)]
    [switch] $Uninstall
)

Import-Module WebAdministration

# This is the effective version of the script. There are fixes to the script, which don't change materially what the script does,
# but fix bugs in the script itself. There is no reason to re-run setup for script fixes.
$script:ScriptVersion = 2111

function ExitScript
{
    param(
        [Parameter(Mandatory=$true)]
        [int]$exitCode
    )

    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\MBAM Server' -Name 'SetupStatus' -Value $exitCode -ErrorAction Stop
    if(-not $?) { exit 1 }

    exit $exitCode
}

function IsRecoveryServiceUpToDate
{
    $regKey = 'HKLM:\SOFTWARE\Microsoft\MBAM Server'
    if(-not (Test-Path $regKey))
    {
        return $false
    }

    $scriptVer = Get-ItemProperty -Path $regKey -Name "InstallerVersion" -ErrorAction Ignore

    return (($null -ne $scriptVer) -and ($scriptVer.InstallerVersion -eq $script:ScriptVersion))
}

function IsHelpDeskOrSSPInstalled
{
    $regKey = 'HKLM:\SOFTWARE\Microsoft\MBAM Server\Enabled'
    if(-not (Test-Path $regKey))
    {
        return $false
    }

    $ssp = Get-ItemProperty -Path $regKey -Name "SelfServicePortal" -ErrorAction Ignore
    $help = Get-ItemProperty -Path $regKey -Name "AdministrationPortal" -ErrorAction Ignore

    return (($null -ne $ssp) -and ($ssp.SelfServicePortal -eq 1)) -or (($null -ne $help) -and ($help.AdministrationPortal -eq 1))
}

<#
.synopsis

Install MBAM Recovery Service registry structure.
#>
function Install-MBAMRecoveryServiceRegistry
{
    param(
        [Parameter(Mandatory=$true)]
        [string]$SqlServer,
        [Parameter(Mandatory=$true)]
        [string]$DatabaseName,
        [Parameter(Mandatory=$false)]
        [string]$WebSite
    )

    Write-Host "Installing MBAM recovery service registry"
    $connectionString = "Data Source={0};Initial Catalog={1};Integrated Security=True;Encrypt=True;TrustServerCertificate=False" -f $SqlServer, $DatabaseName
    $registryRoot = "HKLM:\SOFTWARE\Microsoft"

    $registryStructure = @{
        "MBAM Server" = @{ "InstallerVersion" = $script:ScriptVersion }
        "MBAM Server\Enabled" = @{ "AgentServices" = 1 }
        "MBAM Server\Version" = @{ "AgentServices" = "2.5.1152.0"}
        "MBAM Server\Web" = @{ "RecoveryDBConnectionString"=$connectionString; "ComplianceDBConnectionString"=$connectionString; "WebSite"=$WebSite }
     }

     foreach($key in $registryStructure.Keys)
     {
         $regKeyPath = Join-Path $registryRoot $key

         if(-not (Test-Path $regKeyPath))
         {
             $null = New-Item $regKeyPath -Force -ErrorAction Stop
             if(-not $?) { return $false }
         }

         $regValues = $registryStructure[$key]
         if($null -ne $regValues)
         {
             foreach($valKey in $regValues.Keys)
             {
                 $null = Set-ItemProperty -Path $regKeyPath -Name $valKey -Value $regValues[$valKey] -ErrorAction Stop
                 if(-not $?) { return $false }
             }
         }
     }

     return $true
}

<#
.synopsis

Uninstalls MBAM Recovery Service registry structure.
#>
function Uninstall-MBAMRecoveryServiceRegistry
{
    if(Test-Path 'HKLM:\SOFTWARE\Microsoft\MBAM Server')
    {
        Write-Host "Uninstalling MBAM recovery service registry"

        if(IsHelpDeskOrSSPInstalled)
        {
            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\MBAM Server" -Name "InstallerVersion"
            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\MBAM Server\Enabled" -Name "AgentServices"
            Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\MBAM Server\Version" -Name "AgentServices"
        }
        else
        {
            Remove-Item -Path 'HKLM:\SOFTWARE\Microsoft\MBAM Server' -Recurse -Force
        }
    }
}

<#
.synopsis

Adds a new IIS app pool for MBAM Recovery Service.
#>
function Add-IISAppPool
{
    $poolName = "SMS MP MBAM Pool"
    $poolPath = "IIS:\AppPools\$poolName"

    if(-not (Test-Path $poolPath))
    {
        Write-Host "Adding new app pool $poolName"
        $pool = New-WebAppPool -Name $poolName -ErrorAction Stop
    }
    else
    {
        Write-Host "Refreshing existing app pool $poolName"
        $pool = Get-Item -Path $poolPath -ErrorAction Stop
    }

    if(-not $?) { return $false }

    if($null -eq $pool)
    {
        Write-Error "Failed to create IIS application pool"
        return $false
    }

    # Set the identity as Network Service
    $pool.processModel.identityType = 2

    $pool | Set-Item -ErrorAction Stop
    if(-not $?) { return $false}

    return $true
}

<#
.synopsis

Removes IIS app pool used by MBAM Recovery Service.
#>
function Remove-IISAppPool
{
    $poolName = "SMS MP MBAM Pool"
    $poolPath = "IIS:\AppPools\$poolName"

    if(Test-Path $poolPath)
    {
        Write-Host "Removing app pool $poolName"
        Remove-WebAppPool -Name $poolName -ErrorAction Stop
    }
}

<#
.synopsis

Get the root directory where MBAM Recovery Service is installed.
Registry must be installed for valid path.
#>
function Get-MBAMRoot
{
    if(-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\SMS\MP'))
    {
        return
    }

    $mpKey = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\SMS\MP\'

    return $mpKey.InstallDir
}

function Get-MBAMWebSite
{
    if(-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\MBAM Server\Web'))
    {
        return
    }

    return ((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\MBAM Server\Web' -Name WebSite).WebSite)
}

<#
.synopsis

Deletes MBAM Recovery Service files.
#>
function Uninstall-MBAMRecoveryServiceFiles
{
    $installRoot = Get-MBAMRoot

    if($null -eq $installRoot)
    {
        return;
    }

    if(Test-Path $installRoot)
    {
        Write-Host "Uninstalling MBAM recovery service files"

        if(IsHelpDeskOrSSPInstalled)
        {
            @("Recovery And Hardware Service") | ForEach-Object {
                $websiteFolder = [System.IO.Path]::Combine($installRoot, "Microsoft BitLocker Management Solution", $_)

                if(Test-Path $websiteFolder)
                {
                    Remove-Item $websiteFolder -Recurse -Force
                }
            }
        }
        else
        {
            Remove-Item ([System.IO.Path]::Combine($installRoot, "Microsoft BitLocker Management Solution")) -Recurse -Force
        }
    }
}

<#
.synopsis

Sets file system acl on file or folder for specified user.
#>
function Set-FileSystemAcl
{
    param(
        [Parameter(Mandatory=$true)]
        [System.IO.FileSystemInfo]$fsObject,
        [Parameter(Mandatory=$true)]
        [string]$DesiredAcl,
        [Parameter(Mandatory=$false)]
        [string]$UserSID = "S-1-5-20"
    )

    Write-Host "Setting ACL $DesiredAcl on $fsObject"

    $acl = Get-Acl $fsObject.FullName -ErrorAction Stop
    if(-not $? -or ($null -eq $acl))
    {
        Write-Error ("Error getting ACL on " + $fsObject.FullName)
        return $false
    }

    [System.Security.Principal.SecurityIdentifier]$UserIdent = New-Object System.Security.Principal.SecurityIdentifier($UserSID)

    if($fsObject.GetType() -eq [System.IO.DirectoryInfo])
    {
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($UserIdent, $DesiredAcl,"ContainerInherit,ObjectInherit", "None", "Allow")
    }
    else
    {
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule($UserIdent, $DesiredAcl, "Allow")
    }

    if($null -eq $accessRule)
    {
        Write-Error "Unable to create FileSystemAccessRule"
        return $false
    }

    $acl.SetAccessRule($accessRule)

    Set-Acl -Path $fsObject.FullName -AclObject $acl -ErrorAction Stop
    if(-not $?)
    {
        Write-Error ("Error setting ACL on " + $fsObject.FullName)
        return $false
    }

    return $true
}

<#
.synopsis

Sets security access on MBAM Recovery Service files.

Gives read/list/execute to NetworkService on all files.
Gives write on log folder.
#>
function Set-WebServiceFileAcls
{
    param(
        [Parameter(Mandatory=$true)]
        [System.IO.DirectoryInfo]$InstallRoot
    )

    [System.IO.DirectoryInfo]$webRoot = Join-Path $InstallRoot.FullName "Microsoft BitLocker Management Solution"

    $success = Set-FileSystemAcl $webRoot "ReadAndExecute"

    if(-not $success[-1])
    {
        return $false
    }

    # Create log folders and set write permissions so that the service
    # can create and write log files.
    [System.IO.DirectoryInfo]$logRoot = Join-Path $webRoot.FullName "Logs\Recovery And Hardware Service"

    if(-not $logRoot.Exists)
    {
        Write-Host "Creating log folder"
        try
        {
            $logRoot.Create()
        }
        catch
        {
            Write-Error ("Unable to create log folder. " + $_.Exception.Message)
            return $false
        }
    }
    else
    {
        Write-Host "Log folder already exists"
    }

    # Grant full control on log folder
    $success = Set-FileSystemAcl $logRoot "FullControl"

    if(-not $success[-1])
    {
        return $false
    }

    [System.IO.FileInfo]$eventRes = Join-Path $webRoot.FullName "Recovery And Hardware Service\bin\MicrosoftWindowsMbamWeb.dll"

    # Grant read and execute on the event log resource file so that all users can see event logs.
    $success = Set-FileSystemAcl $eventRes "ReadAndExecute" "S-1-5-32-545"

    if(-not $success[-1])
    {
        Write-Warning "Unable to set permissions on event source resource dll ($eventRes). Event log probably won't work."
    }

    return $true
}

<#
.synopsis

Generic find and replace on a file.
#>
function Repair-FileContent
{
    param(
        [Parameter(Mandatory=$true)]
        [System.IO.FileInfo]$file,
        [Parameter(Mandatory=$true)]
        [hashtable]$replacements
    )

    if(-not $file.Exists)
    {
        Write-Error ("File " + $file.FullName + " does not exist")
        return $false
    }

    $content = Get-Content $file.FullName -ErrorAction Stop

    if(-not $? -or [string]::IsNullOrEmpty($content))
    {
        Write-Error ("Error reading " + $file.FullName)
        return $false
    }

    foreach($key in $replacements.Keys)
    {
        $content = $content.Replace($key, $replacements[$key])
    }

    $content | Set-Content $file.FullName -Force -ErrorAction Stop

    if(-not $?)
    {
        Write-Error ("Error writing " + $file.FullName)
        return $false
    }

    return $true
}

<#
.synopsis

Registers event log event source with system.
#>
function Register-EventSource
{
    param(
        [Parameter(Mandatory=$true)]
        [System.IO.DirectoryInfo]$BinDirectory
    )

    Write-Host "Registering event sources"

    [System.IO.FileInfo] $manifest = Join-Path $BinDirectory.FullName "MicrosoftWindowsMbamWeb.man"

    if(-not (Repair-FileContent $manifest @{"[INSTALLDIR]" = $BinDirectory.FullName}))
    {
        return $false
    }

    $result = wevtutil.exe im $manifest.FullName

    Write-Host $result

    if(-not $?)
    {
        Write-Error "Error registering event source"
        return $false
    }

    return $true
}

<#
.synopsis

Unregisters event source with system.
#>
function UnRegister-EventSource
{
    Write-Host "Unregistering event sources"

    [System.IO.DirectoryInfo]$root = Get-MBAMRoot

    if(-not $root.Exists)
    {
        return
    }

    [System.IO.FileInfo] $manifest = Join-Path $root.FullName "Recovery And Hardware Service\bin\MicrosoftWindowsMbamWeb.man"

    $result = wevtutil.exe um $manifest.FullName

    Write-Host $result
}

<#
.synopsis

Register perf counters with system. Performed in a separate process since perf counter dll gets loaded.
#>
function Register-PerfCounters
{
    param(
        [System.IO.DirectoryInfo]$BinRoot
    )

    Write-Host "Registering perf counters"
    [System.IO.FileInfo]$assembly = Join-Path $BinRoot "Microsoft.Mbam.Server.dll"

    if(-not $assembly.Exists)
    {
        Write-Warning "Perfcounter registration skipped due to missing assembly $assembly.Name"
        return $true
    }

    try {

        $job = Start-Job -ScriptBlock { param($assembly) Add-Type -Path $assembly; $keyPerf = New-Object Microsoft.Mbam.Server.Performance.KeyRecoveryServicePerformanceCounterSet; $keyPerf.Register() } -ArgumentList $assembly.FullName
        Wait-Job $job
        $result = Receive-Job $job
        Write-Host $result
    }
    catch {
        Write-Warning "Exception trying to register perf counters $_.Exception.Message"
        return $true
    }

    return $true
}

<#
.synopsis

Unregister perf counters with system. Performed in a separate process since perf counter dll gets loaded.
#>
function UnRegister-PerfCounters
{
    Write-Host "Unregistering perf counters"

    [System.IO.DirectoryInfo]$root = Get-MBAMRoot

    if(-not $root.Exists)
    {
        return
    }

    $binRoot = Join-Path $root.FullName "Recovery And Hardware Service\bin"

    [System.IO.FileInfo]$assembly = Join-Path $binRoot "Microsoft.Mbam.Server.dll"

    if(-not $assembly.Exists)
    {
        Write-Warning "Perfcounter unregistration skipped due to missing assembly $assembly.Name"
        return $true
    }

    try {

        $job = Start-Job -ScriptBlock { param($assembly) Add-Type -Path $assembly; $keyPerf = New-Object Microsoft.Mbam.Server.Performance.KeyRecoveryServicePerformanceCounterSet; $keyPerf.UnRegister() } -ArgumentList $assembly.FullName
        Wait-Job $job
    }
    catch {
        Write-Warning "Exception trying to register perf counters $_.Exception.Message"
        return $true
    }

    return $true
}

<#
    Checks web.config file to see if someone enabled multiple site binding.
#>
function Is-MultiSiteBindingEnabled
{
    param(
        [Parameter(Mandatory=$true)]
        [System.IO.DirectoryInfo]$installRoot
    )

    if(-not (Test-Path $installRoot))
    {
        return $false
    }

    $webconfig = Join-Path $installRoot "Recovery And Hardware Service\web.config"

    if(-not (Test-Path $webconfig))
    {
        return $false
    }

    [xml]$xml = Get-Content $webconfig

    return ($xml.configuration.'system.serviceModel'.serviceHostingEnvironment.multipleSiteBindingsEnabled -eq "true")
}

<#
    Sets the multipleSiteBindingsEnabled setting in web.config
#>
function Set-MultiSiteBinding
{
    param(
        [Parameter(Mandatory=$true)]
        [System.IO.DirectoryInfo]$installRoot
    )

    if(-not (Test-Path $installRoot))
    {
        return
    }

    $webconfig = Join-Path $installRoot "Recovery And Hardware Service\web.config"

    if(-not (Test-Path $webconfig))
    {
        return
    }

    [xml]$xml = Get-Content $webconfig

    $attr = $xml.CreateAttribute("multipleSiteBindingsEnabled")
    $attr.Value = "true"

    $elem = $xml.CreateElement("serviceHostingEnvironment")
    $elem.Attributes.Append($attr)

    $xml.configuration.'system.serviceModel'.PrependChild($elem)

    $xml.Save($webconfig)
}

<#
Adds MBAM Recovery Service application in IIS.
#>
function Add-MBAMWebApplication
{
    param(
        [Parameter(Mandatory=$true)]
        [string]$webDir,
        [Parameter(Mandatory=$false)]
        [string]$webSite = "Default Web Site"
    )
    $appName = "SMS_MP_MBAM"

    $iisAppPath =  ("IIS:\Sites\{0}\SMS_MP_MBAM" -f $webSite)

    # Create web app if it doesn't exist; otherwise, refresh it's settings
    if(-not (Test-Path $iisAppPath))
    {
        Write-Host "Creating new web application SMS_MP_MBAM"
        New-WebApplication -Name $appName -Site $webSite -PhysicalPath $webDir -ApplicationPool "SMS MP MBAM Pool" -ErrorAction Stop

        if(-not $?)
        {
            Write-Error "Failed to create new web app SMS_MP_MBAM"
            return $false
        }
    }
    else
    {
        Write-Host "Refressing existing web application SMS_MP_MBAM"
        Set-ItemProperty $iisAppPath -Name 'applicationPool' -Value "SMS MP MBAM Pool" -ErrorAction Stop

        if(-not $?)
        {
            Write-Error "Failed to update web app SMS_MP_MBAM app pool to SMS MP MBAM Pool"
            return $false
        }

        Set-ItemProperty $iisAppPath -Name 'physicalPath' -Value $webDir -ErrorAction Stop

        if(-not $?)
        {
            Write-Error "Failed to update web app SMS_MP_MBAM physical path"
            return $false
        }
    }

    # Disable anonymous auth and enable windows auth
    Set-WebConfigurationProperty -Filter "/system.webServer/security/authentication/anonymousAuthentication" -Name Enabled -Value False -PSPath 'IIS:\' -location "$webSite/$appName" -ErrorAction Stop

    if(-not $?)
    {
        Write-Error "Failed to disable anonymous auth on web app SMS_MP_MBAM"
        return $false
    }

    Set-WebConfigurationProperty -Filter "/system.webServer/security/authentication/windowsAuthentication" -Name Enabled -Value True -PSPath 'IIS:\' -location "$webSite/$appName" -ErrorAction Stop

    if(-not $?)
    {
        Write-Error "Failed to enable windows auth on web app SMS_MP_MBAM"
        return $false
    }

    Set-WebConfigurationProperty -Filter "/system.webServer/security/access" -Name sslFlags -Value Ssl -PSPath 'IIS:\' -location "$webSite/$appName" -ErrorAction Stop

    if(-not $?)
    {
        Write-Error "Failed to set 'require ssl' flag on on web app SMS_MP_MBAM"
        return $false
    }

    return $true
}

<#
.synopsis

Removes MBAM Recovery Service application from IIS.
#>
function Remove-MBAMWebApplication
{
    $webSite = Get-MBAMWebSite

    if([string]::IsNullOrEmpty($webSite))
    {
        $webSite = "Default Web Site"
    }

    $sitePath = ("IIS:\Sites\{0}\SMS_MP_MBAM" -f $webSite)

    if(Test-Path $sitePath)
    {
        Write-Host "Removing web application SMS_MP_MBAM"
        Remove-WebApplication -Site $webSite -Name 'SMS_MP_MBAM'
    }
}

<#
.synopsis

Create a folder in the temporary path location

#>
function New-TemporaryDirectory {
  $parent = [System.IO.Path]::GetTempPath()
  $name = [System.IO.Path]::GetRandomFileName()
  New-Item -ItemType Directory -Path (Join-Path $parent $name)
}

<#
.synopsis

Restore the MBAM recovery service registry to match values
specified in the MP registry.

#>
function Restore-MBAMRecoveryServiceRegistry
{
    $mpKey = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\SMS\MP\'

    $sqlServerName = $mpKey.'SQL Server Name'
    $databaseName = $mpKey.'Database Name'

    if([String]::IsNullOrEmpty($sqlServerName))
    {
        Write-Error "SQL Server not specified in MP key"
        return
    }

    if([String]::IsNullOrEmpty($databaseName))
    {
        Write-Error "SQL Server database name not specified in MP key"
        return
    }

    # If the instance name is in the database name, then it
    # needs to be split off and appended to the sql server name.
    if(($slashIndex = $databaseName.IndexOf("\")) -ge 0)
    {
        $instanceName = $databaseName.Substring(0, $slashIndex)

        if(-not [string]::IsNullOrEmpty($instanceName))
        {
            $sqlServerName += "\" + $instanceName
        }

        $databaseName = $databaseName.Substring($slashIndex + 1)
    }

    $webSite = $mpKey.'IISCustomWebSiteName'

    if([string]::IsNullOrEmpty($webSite))
    {
        $webSite = "Default Web Site"
    }

    Install-MBAMRecoveryServiceRegistry -SqlServer $sqlServerName -DatabaseName $databaseName -WebSite $webSite
}

<#
.synopsis

Installer for MBAM Recovery Service

.description

Fully installs MBAM Recovery Service
1. Installs registry
2. INstalls files
3. Creates app pool
4. Creates application
5. Registers event source and perf counters

#>
function Install-MBAMRecoveryService
{
    Write-Host "Installing MBAM Recovery Service"

    if(IsRecoveryServiceUpToDate)
    {
        Write-Host "Recovery Service is up to date with current installer."
        Restore-MBAMRecoveryServiceRegistry
        ExitScript 0
    }

    if(-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\SMS\MP'))
    {
        Write-Error "MP registry key does not exist on local machine."
        exit 1
    }

    $identityKey = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\SMS\Identification'
    [System.IO.DirectoryInfo] $cabRoot = Join-Path $identityKey.'Installation Directory' 'bin\x64'

    $mpKey = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\SMS\MP\'

    $sqlServerName = $mpKey.'SQL Server Name'

    if([String]::IsNullOrEmpty($sqlServerName))
    {
        Write-Error "SQL Server not specified in MP key"
        exit 1
    }

    $databaseName = $mpKey.'Database Name'

    if([String]::IsNullOrEmpty($databaseName))
    {
        Write-Error "SQL Server database name not specified in MP key"
        exit 1
    }

    # If the instance name is in the database name, then it
    # needs to be split off and appended to the sql server name.
    if(($slashIndex = $databaseName.IndexOf("\")) -ge 0)
    {
        $instanceName = $databaseName.Substring(0, $slashIndex)

        if(-not [string]::IsNullOrEmpty($instanceName))
        {
            $sqlServerName += "\" + $instanceName
        }

        $databaseName = $databaseName.Substring($slashIndex + 1)
    }

    if([String]::IsNullOrEmpty($databaseName))
    {
        Write-Error "SQL Server database name not specified in MP key"
        exit 1
    }

    [System.IO.DirectoryInfo]$InstallRoot = $mpKey.InstallDir

    if(-not $InstallRoot.Exists)
    {
        Write-Error "Install Root does not exist"
        exit 1
    }

    [System.IO.FileInfo]$RecoveryServiceCab = Join-Path $cabRoot.FullName "MBAMRecoverySer.cab"

    if(-not $RecoveryServiceCab.Exists)
    {
        Write-Error ($RecoveryServiceCab.FullName + " does not exist")
        exit 1
    }

    # Get the server host name from the MP registry
    $serverFqdn = $mpKey.'MP Hostname'
    # If the MP registry doesn't specify the host name
    # fall back on FQDN
    if([String]::IsNullOrEmpty($serverFqdn))
    {
        $serverFqdn = [System.Net.Dns]::GetHostEntry([string]$env:computername).HostName
    }

    $appDir = Join-Path $InstallRoot "Microsoft BitLocker Management Solution"
    $webDir = Join-Path $appDir "Recovery And Hardware Service"
    $binDir = Join-Path $webDir "bin"
    $webSite = $mpKey.'IISCustomWebSiteName'

    if([string]::IsNullOrEmpty($webSite))
    {
        $webSite = "Default Web Site"
    }

    [array]$httpsBindings = Get-WebBinding -Name $webSite | Where-Object { $_.protocol -like "https" }
    if($httpsBindings.Count -eq 0)
    {
        Write-Error("Website {0} does not have an https protocol binding." -f $webSite)
        exit 1
    }

    $multiSiteBindingEnabled = ($httpsBindings.Count -ge 2) -or (Is-MultiSiteBindingEnabled (Join-Path $InstallRoot.FullName "Microsoft BitLocker Management Solution"))

    [array]$certificates = $httpsBindings | ForEach-Object { Get-ChildItem -Path ("Cert:\LocalMachine\{0}\{1}" -f $_.certificateStoreName, $_.certificateHash) }
    if(($certificates.Count -eq 0) -or ($certificates.Count -ne $httpsBindings.Count))
    {
        Write-Error("Website {0} SSL certificate(s) does not exist in certificate store." -f $webSite)
        exit 1
    }

    $success = Install-MBAMRecoveryServiceRegistry -SqlServer $sqlServerName -DatabaseName $databaseName -WebSite $webSite

    if(-not $success[-1])
    {
        Write-Error "Failed to create registry structure"
        Uninstall-MBAMRecoveryServiceRegistry
        exit 1
    }

    $cabFullName = $RecoveryServiceCab.FullName
    $installFullName = $InstallRoot.FullName

    $tempExpandFolder = New-TemporaryDirectory

    Write-Host ("Expanding $RecoveryServiceCab to temporary folder " + $tempExpandFolder)
    Expand.exe "$cabFullName" $tempExpandFolder -F:*

    Write-Host ("Moving temp folder to " + $InstallRoot.FullName)

    @("Recovery And Hardware Service") | ForEach-Object {
        $websiteFolder = [System.IO.Path]::Combine($InstallRoot.FullName, "Microsoft BitLocker Management Solution", $_)

        if(Test-Path $websiteFolder)
        {
            Remove-Item $websiteFolder -Recurse -Force
        }
    }

    Copy-Item (Join-Path $tempExpandFolder "Microsoft BitLocker Management Solution") $InstallRoot.FullName -Recurse -Force

    if($multiSiteBindingEnabled)
    {
        Write-Host "MultipleSiteBinding attribute set previously. Turning it back on"
        Set-MultiSiteBinding (Join-Path $InstallRoot.FullName "Microsoft BitLocker Management Solution")
    }

    if(-not $? -or (-not (Test-Path $appDir)))
    {
        Write-Error "Failure expanding cab file into install destination."
        Write-Error ("Cab path: " + $cabFullName)
        Write-Error ("Install destination: " + $installFullName)
        Uninstall-MBAMRecoveryServiceRegistry
        exit 1
    }

    [System.IO.FileInfo]$deploymentConfigTemplate = Join-Path $appDir "DeploymentConfigTemplate.xml"

    if(-not $deploymentConfigTemplate.Exists)
    {
        Write-Error ("Windows feature install configuration file does not exist at " + $deploymentConfigTemplate.FullName)
        Uninstall-MBAMRecoveryServiceRegistry
        exit 1
    }

    $featueInstallResult = Install-WindowsFeature -ConfigurationFilePath $deploymentConfigTemplate.FullName -ErrorAction Stop
    $restartBit = 0
    if($featueInstallResult.RestartNeeded -notlike "No")
    {
        $restartBit = 2
    }


    if($false -eq $featueInstallResult.Success)
    {
        Write-Error "Error install windows features required for MBAM Recovery Service"
        Uninstall-MBAMRecoveryServiceRegistry
        exit (1 -bor $restartBit)
    }

    # Delete the configuration template file since it's no longer needed.
    $deploymentConfigTemplate.Delete()

    $success = Add-IISAppPool

    if(-not $success[-1])
    {
        Write-Error "Failure creating IIS app pool."
        Uninstall-MBAMRecoveryServiceRegistry
        exit (1 -bor $restartBit)
    }

    $success = Set-WebServiceFileAcls -InstallRoot $InstallRoot

    if(-not $success[-1])
    {
        Write-Error "Failed to set ACLs"
        Uninstall-MBAMRecoveryServiceRegistry
        exit (1 -bor $restartBit)
    }

    $success = Register-EventSource -BinDirectory $binDir

    if(-not $success[-1])
    {
        Write-Error "Failed to register event source"
        Uninstall-MBAMRecoveryServiceRegistry
        exit (1 -bor $restartBit)
    }

    $webConfig = Join-Path $webDir "web.config"
    $svclog = Join-Path $appDir "Logs\Recovery And Hardware Service\trace.svclog"
    $repLog = "C:\inetpub\Microsoft BitLocker Management Solution\Logs\Recovery And Hardware Service\trace.svclog"

    $success = Repair-FileContent $webConfig @{ $repLog = $svclog; "[MBAMSERVERFQDN]" = $serverFqdn }

    if(-not $success[-1])
    {
        Write-Error "Failed to repair web.config"
        Uninstall-MBAMRecoveryServiceRegistry
        exit (1 -bor $restartBit)
    }

    $success = Add-MBAMWebApplication $webDir $webSite

    if(-not $success[-1])
    {
        Uninstall-MBAMRecoveryServiceRegistry
        exit (1 -bor $restartBit)
    }

    Register-PerfCounters $binDir

    ExitScript $restartBit
}

<#
.synopsis

Uninstall MBAM Recovery Service

.description

More or less completely removes MBAM Recovery Service.
#>
function Uninstall-MBAMRecoveryService
{
    Write-Host "Uninstalling MBAM Recovery Service"
    if(-not (IsHelpDeskOrSSPInstalled))
    {
        UnRegister-PerfCounters
        UnRegister-EventSource
    }
    Remove-MBAMWebApplication
    Uninstall-MBAMRecoveryServiceFiles
    Remove-IISAppPool
    Uninstall-MBAMRecoveryServiceRegistry
}

if($Uninstall)
{
    Uninstall-MBAMRecoveryService
}
else
{
    Install-MBAMRecoveryService
}

# SIG # Begin signature block
# MIIoRgYJKoZIhvcNAQcCoIIoNzCCKDMCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD0RsQdUbajwRex
# x3f/3+TNfoiUTg/LYldoG3rtfGmRjaCCDYUwggYDMIID66ADAgECAhMzAAADTU6R
# phoosHiPAAAAAANNMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjMwMzE2MTg0MzI4WhcNMjQwMzE0MTg0MzI4WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDUKPcKGVa6cboGQU03ONbUKyl4WpH6Q2Xo9cP3RhXTOa6C6THltd2RfnjlUQG+
# Mwoy93iGmGKEMF/jyO2XdiwMP427j90C/PMY/d5vY31sx+udtbif7GCJ7jJ1vLzd
# j28zV4r0FGG6yEv+tUNelTIsFmmSb0FUiJtU4r5sfCThvg8dI/F9Hh6xMZoVti+k
# bVla+hlG8bf4s00VTw4uAZhjGTFCYFRytKJ3/mteg2qnwvHDOgV7QSdV5dWdd0+x
# zcuG0qgd3oCCAjH8ZmjmowkHUe4dUmbcZfXsgWlOfc6DG7JS+DeJak1DvabamYqH
# g1AUeZ0+skpkwrKwXTFwBRltAgMBAAGjggGCMIIBfjAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUId2Img2Sp05U6XI04jli2KohL+8w
# VAYDVR0RBE0wS6RJMEcxLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEWMBQGA1UEBRMNMjMwMDEyKzUwMDUxNzAfBgNVHSMEGDAW
# gBRIbmTlUAXTgqoXNzcitW2oynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIw
# MTEtMDctMDguY3JsMGEGCCsGAQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDov
# L3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDEx
# XzIwMTEtMDctMDguY3J0MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIB
# ACMET8WuzLrDwexuTUZe9v2xrW8WGUPRQVmyJ1b/BzKYBZ5aU4Qvh5LzZe9jOExD
# YUlKb/Y73lqIIfUcEO/6W3b+7t1P9m9M1xPrZv5cfnSCguooPDq4rQe/iCdNDwHT
# 6XYW6yetxTJMOo4tUDbSS0YiZr7Mab2wkjgNFa0jRFheS9daTS1oJ/z5bNlGinxq
# 2v8azSP/GcH/t8eTrHQfcax3WbPELoGHIbryrSUaOCphsnCNUqUN5FbEMlat5MuY
# 94rGMJnq1IEd6S8ngK6C8E9SWpGEO3NDa0NlAViorpGfI0NYIbdynyOB846aWAjN
# fgThIcdzdWFvAl/6ktWXLETn8u/lYQyWGmul3yz+w06puIPD9p4KPiWBkCesKDHv
# XLrT3BbLZ8dKqSOV8DtzLFAfc9qAsNiG8EoathluJBsbyFbpebadKlErFidAX8KE
# usk8htHqiSkNxydamL/tKfx3V/vDAoQE59ysv4r3pE+zdyfMairvkFNNw7cPn1kH
# Gcww9dFSY2QwAxhMzmoM0G+M+YvBnBu5wjfxNrMRilRbxM6Cj9hKFh0YTwba6M7z
# ntHHpX3d+nabjFm/TnMRROOgIXJzYbzKKaO2g1kWeyG2QtvIR147zlrbQD4X10Ab
# rRg9CpwW7xYxywezj+iNAc+QmFzR94dzJkEPUSCJPsTFMIIHejCCBWKgAwIBAgIK
# YQ6Q0gAAAAAAAzANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNV
# BAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jv
# c29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlm
# aWNhdGUgQXV0aG9yaXR5IDIwMTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEw
# OTA5WjB+MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYD
# VQQDEx9NaWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG
# 9w0BAQEFAAOCAg8AMIICCgKCAgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+la
# UKq4BjgaBEm6f8MMHt03a8YS2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc
# 6Whe0t+bU7IKLMOv2akrrnoJr9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4D
# dato88tt8zpcoRb0RrrgOGSsbmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+
# lD3v++MrWhAfTVYoonpy4BI6t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nk
# kDstrjNYxbc+/jLTswM9sbKvkjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6
# A4aN91/w0FK/jJSHvMAhdCVfGCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmd
# X4jiJV3TIUs+UsS1Vz8kA/DRelsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL
# 5zmhD+kjSbwYuER8ReTBw3J64HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zd
# sGbiwZeBe+3W7UvnSSmnEyimp31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3
# T8HhhUSJxAlMxdSlQy90lfdu+HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS
# 4NaIjAsCAwEAAaOCAe0wggHpMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRI
# bmTlUAXTgqoXNzcitW2oynUClTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
# BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBD
# uRQFTuHqp8cx0SOJNDBaBgNVHR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jv
# c29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3JsMF4GCCsGAQUFBwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3
# dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFf
# MDNfMjIuY3J0MIGfBgNVHSAEgZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEF
# BQcCARYzaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1h
# cnljcHMuaHRtMEAGCCsGAQUFBwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkA
# YwB5AF8AcwB0AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn
# 8oalmOBUeRou09h0ZyKbC5YR4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7
# v0epo/Np22O/IjWll11lhJB9i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0b
# pdS1HXeUOeLpZMlEPXh6I/MTfaaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/
# KmtYSWMfCWluWpiW5IP0wI/zRive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvy
# CInWH8MyGOLwxS3OW560STkKxgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBp
# mLJZiWhub6e3dMNABQamASooPoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJi
# hsMdYzaXht/a8/jyFqGaJ+HNpZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYb
# BL7fQccOKO7eZS/sl/ahXJbYANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbS
# oqKfenoi+kiVH6v7RyOA9Z74v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sL
# gOppO6/8MO0ETI7f33VtY5E90Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtX
# cVZOSEXAQsmbdlsKgEhr/Xmfwb1tbWrJUnMTDXpQzTGCGhcwghoTAgEBMIGVMH4x
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01p
# Y3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTECEzMAAANNTpGmGiiweI8AAAAA
# A00wDQYJYIZIAWUDBAIBBQCggbgwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIHde
# mWq+mfmTI16b+NqU/4oisIIOehroSmAkVah0IJJ1MEwGCisGAQQBgjcCAQwxPjA8
# oB6AHABNAEIAQQBNAEMAbABpAGUAbgB0AC4AbQBzAGmhGoAYaHR0cDovL3d3dy5t
# aWNyb3NvZnQuY29tMA0GCSqGSIb3DQEBAQUABIIBALDpOtbunJus5gpVkTl5fxaI
# spltPXBVrBw/HpCuHjFDtTkMhvivSgutwET8kjXY+ShRISYVRbv0w18/2kwbpzfA
# Vv/jcbRCvXxQ0J75ZzZIV3TpMAiyS/GottOz0A41TT+p03THWZ29wF9DHl5Qlnj/
# lUstV4zhozmzu/kbGalj62/E7tIxfiJlvTsihcdAntAvK/lYFxzVE36iB6zi8w5b
# tKmMt4D1ckvxKeW77Cr4Mu8YqX3jIn4LBYvBKo+ZsF3o8blkY69Eb4qC4pNMXImq
# sylvtlvSw2lkvp23+JqICbfTuOeX7lEl4LTsPglTvB5Of3y3JzxjfzntwUk4rFKh
# gheXMIIXkwYKKwYBBAGCNwMDATGCF4Mwghd/BgkqhkiG9w0BBwKgghdwMIIXbAIB
# AzEPMA0GCWCGSAFlAwQCAQUAMIIBUgYLKoZIhvcNAQkQAQSgggFBBIIBPTCCATkC
# AQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQglBcaV8ki66EnCf4sd5o0
# 7PVblPASdhWJ5vYOMLSV6ygCBmUorWf7YxgTMjAyMzEwMjYwODA1NTEuNTE4WjAE
# gAIB9KCB0aSBzjCByzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEnMCUGA1UE
# CxMeblNoaWVsZCBUU1MgRVNOOkUwMDItMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNy
# b3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIR7TCCByAwggUIoAMCAQICEzMAAAHZ
# nFwFkrCDaz4AAQAAAdkwDQYJKoZIhvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3Rh
# bXAgUENBIDIwMTAwHhcNMjMwNjAxMTgzMjU4WhcNMjQwMjAxMTgzMjU4WjCByzEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjElMCMGA1UECxMcTWlj
# cm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEnMCUGA1UECxMeblNoaWVsZCBUU1Mg
# RVNOOkUwMDItMDVFMC1EOTQ3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA1ekgzda4
# GNt9Oci3QnVDbxwhBOGdLnA+giry+ZQOxzPNUjJFt+kVO+1GgS/T0nL4qn1cxNq9
# qUW0TLQwTMBMdYmos1dhGbDRhrs3kd1zWDm0LyVS2gogZLQGXau+QTRSIpfkn3aV
# 4Cs1UGYgwSQzedFggAza62+PGeGe/yr8s2g+Bm/mmXgoqAdhoNZud3fuqVEwXN1j
# ucR2Yv66yP13Z4YhOv27KY6VOWrnwpSA8dEA6tUEcNOGnayoXA1shi90mgaf4Yzf
# uCSVOys77ClmVXU7lz6I52k8FnB3RBn88Ymhd9M3fEmOGEVHDBjzkDkR9SD8JMMJ
# akJHNBwZCQkM4ml2PyKYDEcP1z+FL/iQSfEWRimTdc0T1k/XebxxlEpl95u+0SqA
# n5IEiYnyIkIuhXNDmCkuoGTgO53eLfpYgK6/Z4qngv1HDTrla3FQuAm5MHydnh5G
# lodfLFLd1A/EB2C0MJ/eT/h5vD2SYoK9UkS3LJvKTj3nuzwW53SP1XiibJkHY3pN
# mhTvVRp1LcwwwaMJYV7IbMGTDJCyf+I1M0JlAX5viQB9edehPhtNsEuzYMzMJqR1
# gpgGhXXew8iSKhmum3Ga0e0AC3ZMCIVUA4M2QLjcasL4eCGuGSOVaMo+G+81gIZr
# q6cKTKYo8/onnlsH+mXZsrEY0f8melF5hmsCAwEAAaOCAUkwggFFMB0GA1UdDgQW
# BBQcOsEpU2eoBV5dOcP7NxmtX+dcJzAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJl
# pxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAx
# MCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3Rh
# bXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQM
# MAoGCCsGAQUFBwMIMA4GA1UdDwEB/wQEAwIHgDANBgkqhkiG9w0BAQsFAAOCAgEA
# KjbVWCzutUzLiGpwu3JbdIvl0UWx8J8DaNOUN7OKaRbXeJwpgf0yTwyerrxK8sbN
# L8OWPo0MFIip4ZdlRhsCKtKVgyLmluKaTFdaWEHyenbQRpEYkz9XilbwEWGTEWiE
# 3vWYcCSZ2D/N6TMRwsWhLGQuIpWN/+eXaneGV0ws/3KRuWp5g2q7Z1poMrMoDbLU
# 8G1iSUY/OYGEZI8Yv58SgIhBcZehn5HJ11cvA0RUI9XdwIqrHj6HiM8btYrgCUcA
# 633uDZyh6qE4FrL+3gliZ1o1lkbe0URq6b8y0KPwcVG/IuPVMEYPRuW8aXeUrtW9
# tuBr+htR0VPqiRwdc6HuNQ9q/4nNgT6LrFfZ3mCuaiOTxy7IQJ+mE0JZW1faQmzl
# L2TtHbXcKeRx9n8OqHyTcCnDxJWqpBHMb64YUVqsDYGhFU8iFeIzHPIz28djYfcw
# M7Z2/TX5wxThPv4BfHGak2v0+uUxjT97jIj94K/JyF0NiEcDFVKC5hrtqn5oQ6Hs
# LN3XL5OrNWgOplx8PjADRCAyio8N4thuibWZBHprtTl7bJIP7Rp38sGjIKuQmrlP
# W+np07QPlBPhip5okFumFBz4QSNC9kBu+k0Qa3uT6TVR4snP9NW41BDKXmgfiJwB
# +Jw8WF8dfMGyRPnvyGzL9NeOxBS+/dnRCxdF8KqnFNEwggdxMIIFWaADAgECAhMz
# AAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9v
# dCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIyMjVaFw0z
# MDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
# MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
# b24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMIICIjAN
# BgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5vQ7VgtP9
# 7pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64NmeFRiMM
# tY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhuje3XD9gm
# U3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl3GoPz130
# /o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPgyY9+tVSP
# 3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I5JasAUq7
# vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2ci/bfV+A
# utuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/TNuvXsLz
# 1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy16cg8ML6
# EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y1BzFa/Zc
# UlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6HXtqPnhZy
# acaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMBAAEwIwYJ
# KwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQWBBSfpxVd
# AF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30BATBBMD8G
# CCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL0RvY3Mv
# UmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYBBAGCNxQC
# BAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wHwYD
# VR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZF
# aHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvTWljUm9v
# Q2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcw
# AoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNSb29DZXJB
# dXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1VffwqreEsH2cB
# MSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27DzHkwo/7
# bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pvvinLbtg/
# SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9AkvUCgvxm2
# EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWKNsIdw2Fz
# Lixre24/LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2kQH2zsZ0
# /fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+c23Kjgm9
# swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep8beuyOiJ
# Xk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+DvktxW/tM4+
# pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1ZyvgDbjmjJnW
# 4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/2XBjU02N
# 7oJtpQUQwXEGahC0HVUzWLOhcGbyoYIDUDCCAjgCAQEwgfmhgdGkgc4wgcsxCzAJ
# BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25k
# MR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJTAjBgNVBAsTHE1pY3Jv
# c29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJzAlBgNVBAsTHm5TaGllbGQgVFNTIEVT
# TjpFMDAyLTA1RTAtRDk0NzElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
# U2VydmljZaIjCgEBMAcGBSsOAwIaAxUA4hxFugmt5+QYGVf7UP3wkdPU3/eggYMw
# gYCkfjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDANBgkqhkiG9w0BAQsF
# AAIFAOjkTocwIhgPMjAyMzEwMjYwMjMzNDNaGA8yMDIzMTAyNzAyMzM0M1owdzA9
# BgorBgEEAYRZCgQBMS8wLTAKAgUA6OROhwIBADAKAgEAAgIuLAIB/zAHAgEAAgIT
# KTAKAgUA6OWgBwIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMCoAow
# CAIBAAIDB6EgoQowCAIBAAIDAYagMA0GCSqGSIb3DQEBCwUAA4IBAQCfX+UJO4ax
# eb02nDxTExL24hNNC4dtsKJArrLQviMJVMIriHZg8XKc/meG6elNzN2gEgQEQABx
# W3JkFW1EFxqnBtHcsgr9FIxmHG6dQPQwM/7URz8ZrB/wk0TOVgxBfOA06qYRYbfy
# DEoyJvp06c0lc4nnhFoUI/QRezKdha9rG/qV4rC5kAcCrPDEDfxIO20iMaPMqcJ5
# ljjZgUED9iuGdFD87FHdeMhjSPoqeNXwgLjT3MUG9cjtGc1HAdEmUzFtevb4p7dz
# kuMtj5e8tBd8x0N7WVdS8y9vw0d6cviFy+KPlqq4ZRX+OHoBt10V+j8Jp33aepfE
# ZeaMC66kjqtKMYIEDTCCBAkCAQEwgZMwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTACEzMAAAHZnFwFkrCDaz4AAQAAAdkwDQYJYIZIAWUDBAIBBQCgggFKMBoG
# CSqGSIb3DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgO9BHlovy
# g7NMHJYe4xGtRvG890QRmDHpbEuREHm2dJswgfoGCyqGSIb3DQEJEAIvMYHqMIHn
# MIHkMIG9BCCfoBWyLTpv1DAwJxE82yXtLtA1ndjIKYG9EnG0IAd58zCBmDCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAB2ZxcBZKwg2s+AAEA
# AAHZMCIEIKsXBcqR4h+142/KrDEJV13VFvsJiscNpzVY26BQ2FuxMA0GCSqGSIb3
# DQEBCwUABIICAMatwg5YhsQWktfd2JXRSYytuwAZCjfs4x0AhICiuifnm8b8bOcK
# ZG0O8UyBiay320kIF5n03y7PrrTQUoaIMfx5WclwqKpT7gAMxWrDWbqad+c0x06e
# l90GecySNAquAMePmSsow1FnrSEyBp2/XHtzYTeWMaekWqwafi6AyBeeFT+z2vaL
# p9nWHuWN6zIqvKn12xw2GUvh1MjIAOTQT1WgiMwVstGYr9LThrJNXEXVBNIXGwvJ
# d9Rv4Pme5mtUdbNwVyHDnxSdgujEXuXS4cyA57LGxhBj0cUht6PFFHsgAIY3r+4f
# p5k7QaVWF62mt3gKYcZKH4DtSKkSSzXEof6wNUBGHI3dWRP7OEDQ6wfTpRX+jWoD
# kiO7HyKQ/N6x3Csf+3bSJaEdmtFZ5wU99MghF44Pl9P3hidcZWHEMMDbUWTQNq+g
# 0CJ2nv7wGrL0KmmE5HkF9v/ebLxJRJLb+F9BKNuaTV8LkcvvPRdDO5P9dgUasV6t
# sd18L4zcZ3nVL5f5Ge8aff2jBqv+vEklTGjg0ixIeTQ0tR77proRrm+CYB5VSh1D
# 0HyyIKGaSjBgMLwGsX0JHtxlz2MbZ+2rTnZ5tkUFiTNs3ZUIKr3kS0rzDdEMm60e
# m2psqD3Kyy8RkghxuClWCJikSrSdFKZJy1+oWfZA+HYJcY/KQ2TOgakA
# SIG # End signature block
