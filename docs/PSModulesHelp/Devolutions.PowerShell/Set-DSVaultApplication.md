Set-DSVaultApplication
----------------------

### Synopsis
Sets the allowed applications for a given vault.

---

### Description

Sets which application have access to a given vault. If the "Update" flag is present and a supplied application name is already a member of the vault, it will remove this application.

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Set-DSVaultApplication @("App1", "App2")
No application allowed in the vault before the execution. App1 and App2 allowed in the vault after the command.
```
> EXAMPLE 2

```PowerShell
PS C:\> Set-DSVaultApplication @("App3")
App1 and User2 allowed in the vault before the execution. App3 is the only application allowed in the vault after the command.
```
> EXAMPLE 3

```PowerShell
PS C:\> Set-DSVaultApplication @("App2") -Update
App1 allowed in the vault before the execution. App1 and App2 allowed in the vault after the command. The update flag keeps previous applications.
```
> EXAMPLE 4

```PowerShell
PS C:\> Set-DSVaultApplication @("App2", "App3") -Update
App1 and App2 allowed in the vault before the execution. App1 and App3 allowed in the vault after the command. App2 lose his access because of the presence of the update flag.
```

---

### Parameters
#### **AllowedApplicationsList**
Accept an array of strings containing application names (not id) to allow in vault

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Update**
Update the current applications instead of overwriting them.

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
For more information, type "Get-Help Set-DSVaultApplication -detailed". For technical information, type "Get-Help Set-DSVaultApplication -full".

---

### Syntax
```PowerShell
Set-DSVaultApplication [[-AllowedApplicationsList] <String[]>] [-Update] -VaultID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
