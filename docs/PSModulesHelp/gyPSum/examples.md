```powershell
$ModuleParams = @{
    ModuleType = 'FullModule'
    TemplatePath = 'A:\PowerShell\gyPSum\Templates\Module'
    ModuleAuthor = 'Mario Mellunig'
    ModuleName = 'PSConfigBase'
    ModuleDescription = 'Configs and Settings for All Modules developed'
    CustomRepo = ''
    ModuleVersion = '0.0.1'
    UseGit = $true
    MainGitBranch = 'main'
    UseGitVersion = $true
    UseGitHub = $false
    UseAzurePipelines = $false
    GitHubOwner = ''
    UseVSCode = $true
    LicenseType = 'MIT'
    SourceDirectory = 'Source'
    Features = @('Enum','Classes','git','Unittests','build')
    DestinationPath = "./"
}

New-gyPSumModule @ModuleParams
```

```powershell
New-gyPSumModule -ModuleType FullModule -TemplatePath 'C:\Users\simon\github\gyPSum\Templates\Module' -ModuleAuthor 'Simon Wåhlin' -ModuleName 'MyNewModule' -ModuleDescription 'A great module for lots of things' -CustomRepo '' -ModuleVersion '0.0.1' -UseGit $true -MainGitBranch 'main' -UseGitVersion $true -UseGitHub $false -UseAzurePipelines $false -GitHubOwner '' -UseVSCode $true -LicenseType 'MIT' -SourceDirectory 'Source' -Features @('Enum','Classes','git','Unittests','build') -DestinationPath "~/"
```
