Remove-DSRole
-------------

### Synopsis
Delete a role

---

### Description

Delete a role specified by the ID attribute.

---

### Related Links
* [Get-DSRole](Get-DSRole)

* [New-DSRole](New-DSRole)

* [Update-DSRole](Update-DSRole)

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RoleID**
Id of the role to delete.

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
For more information, type "Get-Help Remove-DSRole -detailed". For technical information, type "Get-Help Remove-DSRole -full".

---

### Syntax
```PowerShell
Remove-DSRole -RoleID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
