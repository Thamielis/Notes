Get-DSPamAccountSecurity
------------------------

### Synopsis
Get the security of a pam account

---

### Description

Get the security of a pam account.

---

### Related Links
* [New-DSPamAccount](New-DSPamAccount)

* [Update-DSPamAccount](Update-DSPamAccount)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $security = Get-DSPamAccountSecurity -ID $existingAccountID;
    New-DSPamAccount -Name DomAcc -CredentialType DomainUser -FolderID $folderID -Username MyUsername -Password Pa$$w0rd! -ProviderID $providerID -Security $security
Create a new PAM account named 'DomAcc' with the same security as the PAM account whose ID is stored in $existingAccountID
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
For more information, type "Get-Help Get-DSPamAccountSecurity -detailed". For technical information, type "Get-Help Get-DSPamAccountSecurity -full".

---

### Syntax
```PowerShell
Get-DSPamAccountSecurity [-ID] <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
