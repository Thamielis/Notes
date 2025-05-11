Get-DSPamFolderSecurity
-----------------------

### Synopsis
Get the security of a pam folder

---

### Description

Get the security of a pam folder.

---

### Related Links
* [New-DSPamFolder](New-DSPamFolder)

* [Update-DSPamFolder](Update-DSPamFolder)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $foldersResponse = Get-DSPamFolder;
    $pamVault = $foldersResponse | Where Name -eq 'AnExistingVault';
    $security = Get-DSPamFolderSecurity -ID $pamVault.ID;
    New-DSPamFolder -Name 'PamVaultA' -Security $security -AsNewVault
Create a new PAM vault named 'PamFolderA' with the same security as the PAM vault named 'AnExistingVault'
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ID**
Id of the pam folder whose security will be get.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission[]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.Pam.Dto.Permission.PamUserPermission[], RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSPamFolderSecurity -detailed". For technical information, type "Get-Help Get-DSPamFolderSecurity -full".

---

### Syntax
```PowerShell
Get-DSPamFolderSecurity [-ID] <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
