Set-DSVaultUser
---------------

### Synopsis
Sets the allowed users for a given vault.

---

### Description

Sets which users have access to a given vault. If the "Update" flag is present and a supplied username is already a member of the vault, it will remove this user.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-DSVaultUser @("User1", "User2")
No user allowed in the vault before the execution. User1 and User2 allowed in the vault after the command.
```
> EXAMPLE 2

```PowerShell
PS C:\> Set-DSVaultUser @("User3")
User1 and User2 allowed in the vault before the execution. User3 is the only user allowed in the vault after the command.
```
> EXAMPLE 3

```PowerShell
PS C:\> Set-DSVaultUser @("User2") -Update
User1 allowed in the vault before the execution. User1 and User2 allowed in the vault after the command. The update flag keeps previous users.
```
> EXAMPLE 4

```PowerShell
PS C:\> Set-DSVaultUser @("User2", "User3") -Update
User1 and User2 allowed in the vault before the execution. User1 and User3 allowed in the vault after the command. User2 lose his access because of the presence of the update flag.
```

---

### Parameters
#### **AllowedUsernameList**
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
For more information, type "Get-Help Set-DSVaultUser -detailed". For technical information, type "Get-Help Set-DSVaultUser -full".

---

### Syntax
```PowerShell
Set-DSVaultUser [[-AllowedUsernameList] <String[]>] [-Update] -VaultID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
