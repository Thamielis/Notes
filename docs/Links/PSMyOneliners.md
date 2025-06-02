# Meine Oneliner

## Modulsuche

```powershell
$PSModules = Find-Module -Filter 'PSModule' 
$PSModules = $PSModules | Where-Object { $_.Name -notmatch '^OCI' } #| Sort-Object -Property Name

$PSModules | Select-Object -Property Name, Version, PublishedDate, ProjectUri, Description | Sort-Object -Property Name | FT -AutoSize
```
