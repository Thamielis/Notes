Set-DSVaultRole
---------------

### Synopsis
Sets the allowed user groups for a given vault.

---

### Description

Sets which users have access to a given vault. If the "Update" flag is present and a supplied username is already a member of the vault, it will remove this user.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-DSVaultRole @("Role1", "Role2")
No role allowed in the vault before the execution. Role1 and Role2 allowed in the vault after the command.
```
> EXAMPLE 2

```PowerShell
PS C:\> Set-DSVaultRole @("Role3")
Role1 and Role2 allowed in the vault before the execution. Role3 is the only role allowed in the vault after the command.
```
> EXAMPLE 3

```PowerShell
PS C:\> Set-DSVaultRole @("Role2") -Update
User1 allowed in the vault before the execution. Role1 and Role2 allowed in the vault after the command. The update flag keeps previous users.
```
> EXAMPLE 4

```PowerShell
PS C:\> Set-DSVaultRole @("User2", "Role3") -Update
Role1 and Role2 allowed in the vault before the execution. Role1 and Role3 allowed in the vault after the command. Role2 lose his access because of the presence of the update flag.
```

---

### Parameters
#### **AllowedRolesList**
Accept an array of strings containing usernames (not id) to allow in vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Update**
Update the current users instead of overwriting them.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultID**
Vault's ID to update

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Set-DSVaultRole -detailed". For technical information, type "Get-Help Set-DSVaultRole -full".

---

### Syntax
```PowerShell
Set-DSVaultRole [[-AllowedRolesList] <String[]>] [-Update] -VaultID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
