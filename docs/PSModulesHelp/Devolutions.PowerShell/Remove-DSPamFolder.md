Remove-DSPamFolder
------------------

### Synopsis
Remove a pam folder

---

### Description

Remove a pam folder identified by its ID. For the moment, the pam folder must be empty of subfolders and credentials.

---

### Related Links
* [Get-DSPamFolder](Get-DSPamFolder)

* [New-DSPamFolder](New-DSPamFolder)

* [Update-DSPamFolder](Update-DSPamFolder)

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FolderID**
Id of the pam folder to delete.

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
For more information, type "Get-Help Remove-DSPamFolder -detailed". For technical information, type "Get-Help Remove-DSPamFolder -full".

---

### Syntax
```PowerShell
Remove-DSPamFolder -FolderID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
