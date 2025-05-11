Remove-DSUSer
-------------

### Synopsis
Delete a user

---

### Description

Delete a user specified by the ID attribute.

---

### Related Links
* [Get-DSUser](Get-DSUser)

* [New-DSUser](New-DSUser)

* [Update-DSUser](Update-DSUser)

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UserID**
Id of the user to delete.

|Type    |Required|Position|PipelineInput|Aliases     |
|--------|--------|--------|-------------|------------|
|`[Guid]`|true    |named   |false        |CandidUserId|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Remove-DSUSer -detailed". For technical information, type "Get-Help Remove-DSUSer -full".

---

### Syntax
```PowerShell
Remove-DSUSer -UserID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
