Get-DSVaultPermission
---------------------

### Synopsis
Get the vault permissions.

---

### Description

Get the vault permissions.

---

### Related Links
* [New-DSVault](New-DSVault)

* [Remove-DSVault](Remove-DSVault)

* [Update-DSVault](Update-DSVault)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $response = Get-DSVaultPermission -VaultID $vaultID -PrincipalType Applications;
        $apps = response.Data | Select Name, Description, IsMember;
        Set-DSVaultApplication -VaultID $vaultID -AllowedApplicationsList $apps[1].Name,$apps[3].Name -Update
Fetch all the applications for the vault $vaultID and keep only their name, description and isMember attributes. Update the second and fourth applications of the list, changing their membership status.
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrincipalTypes**
Specify the type of users.
Valid Values:

* All
* Applications
* Roles
* Users

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |false        |

#### **VaultID**
Specify the ID of the desired vault.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.Entities.RepositoryAssignmentEntity[]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RepositoryAssignmentEntity, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSVaultPermission -detailed". For technical information, type "Get-Help Get-DSVaultPermission -full".

---

### Syntax
```PowerShell
Get-DSVaultPermission -PrincipalTypes <All | Applications | Roles | Users> -VaultID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
