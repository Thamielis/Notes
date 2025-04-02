# PowerShell Module

## Zertifikatfehler GitHub

```shell
git config --global http.sslBackend schannel
```

## Cmdlets Help

```powershell
$VeeamCmdlets = Get-Command -Module Veeam.Backup.PowerShell
$VeeamCmdlets | Select-Object -Property * -ExcludeProperty Source, Version, ModuleName, ResolvedCommand, HelpUri | ConvertTo-Csv -Delimiter ';' -NoTypeInformation | Out-File -FilePath "A:\Veeam\VeeamCmdlets.csv" -Encoding utf8
```

## Links

[Secrets Of PowerShell Remoting](https://github.com/devops-collective-inc/secrets-of-powershell-remoting)
[PowerShell Optimizing operating system and network performance](https://learn.microsoft.com/en-us/biztalk/technical-guides/windows-powershell-scripts)

## PSResourceGet

```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12

Install-PackageProvider -Name NuGet -Force
Install-Module PowerShellGet -AllowClobber -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Remove-Module -Name PowerShellGet
Import-Module -Name PowerShellGet -RequiredVersion 2.2.5

Install-Module Microsoft.PowerShell.PSResourceGet -Repository PSGallery
Import-Module -Name Microsoft.PowerShell.PSResourceGet

# QUERY
Get-InstalledPSResource
Find-Module ISHRemote -Repository PSGallery 
Find-Module ISHRemote -Repository PSGallery -AllowPrerelease

# INSTALL LATEST RELEASED
Install-PSResource -Name ISHRemote -Repository PSGallery -Scope CurrentUser

# INSTALL PRERELEASE
Install-PSResource -Name ISHRemote -Repository PSGallery -Scope CurrentUser -Prerelease

# UPDATE EXISTING MODULES
Get-InstalledPSResource | Out-GridView -PassThru | Update-PSResource 
Get-InstalledPSResource | Out-GridView -PassThru | Update-PSResource -Prerelease
# The -PassThru allows you to multiselect several packages

# UNINSTALL
Uninstall-PSResource -Name ISHRemote
```

## Help to Markdown (HelpOut)

```powershell
$ModuleName = 'PSXLDevTools'
Save-MarkdownHelp -Module $ModuleName -OutputPath "$PWD\$ModuleName" -Wiki -SkipCommandType Alias
```

## Module

```powershell
Import-Module PSDiagnostics

Install-Module core

Install-PSResource EventLogConverter
Install-PSResource PSWindowsUpdate

Install-PSResource DocTreeGenerator

Install-PSResource PowerML
Install-PSResource PSCodeHealth
Install-PSResource Logging
Install-PSResource ClassExplorer
Install-PSResource CodeConversion
Install-Module CimPSDrive


Install-PSResource PSWriteHTML
Install-PSResource PSParseHTML

Install-Module PSWriteExcel
Install-Module PSwriteOffice
Install-PSResource ImportExcel

Install-PSResource PSCCMClient

Install-Module RemoteDesktopManager (depreciated)
Install-Module Devolutions.PowerShell
Install-Module RemoteCimRegistry

Install-Module PowerShellForGitHub

```

### PSWinDocumentation

```powershell
    Install-Module PSWinDocumentation
```

- [PSWinDocumentation](https://evotec.xyz/hub/scripts/pswindocumentation-powershell-module/)

### PSWinReporting

```powershell
Install-Module PSWinReportingV2
Install-Module PSWinReporting
Install-Module ReportingHelper
```

## Bypass CertificateCheck

```powershell
add-type @"
    using System.Net;
    using System.Security.Cryptography.X509Certificates;
    public class TrustAllCertsPolicy : ICertificatePolicy {
        public bool CheckValidationResult(
            ServicePoint srvPoint, X509Certificate certificate,
            WebRequest request, int certificateProblem) {
            return true;
        }
    }
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
```

## PowerShell 7: Providing Module Compatibility with PowerShell 5 Modules

Many of us need it, but for just as many it is sometimes a nuisance. What I am talking about is PowerShell 7 module compatibility. In this post I will show how to make PowerShell 5 modules PowerShell 7 executable. Let's dive in.

We all know the issue that we cannot run all common PowerShell 5 commands in PowerShell 7. Therefore I will show you a parameter that can solve this problem.

For example, I want to run Get-EventLog. This cmdlet is part of the Microsoft.PowerShell.Manangement module in PowerShell 5 and definitely not available in PowerShell 7.

![](https://sid-500.com/wp-content/uploads/2022/03/image-2.png)

But with a small fine parameter we can import the module from PowerShell 5 to PowerShell 7 and thus run the cmdlet.

I am now goint to import the module in PowerShell 7 and use the **\-UseWindowsPowerShell** parameter.

```powershell
Import-Module Microsoft.PowerShell.Management -UseWindowsPowerShell -WarningAction Ignore
```

Voila, now we can use the cmdlet.

![](https://sid-500.com/wp-content/uploads/2022/03/image-3.png)

## Enums

```powershell
# Enumerate Weekdays
 
[Enum]::GetValues([System.DayOfWeek])
 
# Enumerate Months
 
(New-Object System.Globalization.DateTimeFormatInfo).MonthNames
 
# List Numbers
 
1..10
-10..-5
 
# List Alphabet
 
[char[]](65..90)
 
# Side note: List console colors
 
[Enum]::GetValues([System.ConsoleColor])
```
