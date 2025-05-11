Remove-DSEntry
--------------

### Synopsis
Remove a specified entry from the database.

---

### Description

Remove an entry specified by its id from the database.

---

### Related Links
* [Get-DSEntry](Get-DSEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Remove-DSEntry -EntrID $id
Delete the entry whose ID is stored in $id
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EntryID**
ID of the entry to delete

|Type    |Required|Position|PipelineInput|Aliases      |
|--------|--------|--------|-------------|-------------|
|`[Guid]`|true    |named   |false        |CandidEntryID|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Remove-DSEntry -detailed". For technical information, type "Get-Help Remove-DSEntry -full".

---

### Syntax
```PowerShell
Remove-DSEntry -EntryID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
