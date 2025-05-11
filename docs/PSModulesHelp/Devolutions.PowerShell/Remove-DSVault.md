Remove-DSVault
--------------

### Synopsis
Delete a vault.

---

### Description

Deletes a vault from DVLS instance and delete all entries inside of it. Be careful, this action is irreversible if you don't have a recent back-up.

---

### Related Links
* [Get-DSVault](Get-DSVault)

* [New-DSVault](New-DSVault)

* [Update-DSVault](Update-DSVault)

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VaultID**
Vault's ID to delete

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
For more information, type "Get-Help Remove-DSVault -detailed". For technical information, type "Get-Help Remove-DSVault -full".

---

### Syntax
```PowerShell
Remove-DSVault -VaultID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
