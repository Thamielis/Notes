Remove-DSPamAccount
-------------------

### Synopsis
Delete a pam account.

---

### Description

Delete a pam account.

---

### Related Links
* [Get-DSPamAccount](Get-DSPamAccount)

* [Get-DSPamAccountSyncStatus](Get-DSPamAccountSyncStatus)

* [New-DSPamAccount](New-DSPamAccount)

* [Update-DSPamAccount](Update-DSPamAccount)

---

### Parameters
#### **AccountID**
Id of the account to delete

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.PamCredential

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamCredential, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Remove-DSPamAccount -detailed". For technical information, type "Get-Help Remove-DSPamAccount -full".

---

### Syntax
```PowerShell
Remove-DSPamAccount -AccountID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
