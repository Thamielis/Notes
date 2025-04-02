Unprotect-DSSealedEntry
-----------------------

### Synopsis
Unseal an entry.

---

### Description

Unseal an entry.

---

### Related Links
* [Get-DSEntry](Get-DSEntry)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $entry = Get-DSEntry -FilterBy Name -FilterMatch ExactExpression -FilterValue 'InCaseOfEmergency';
PS C:\> Unprotect-DSSealedEntry -ID $entry.ID;
PS C:\> $sensitiveData = Get-DSEntrySensitiveData -EntryID $entry.ID;
PS C:\> Update-DSEntryBase -FromRDMConnection $entry
Unseal the entry 'InCaseOfEmergency', get its sensitive data, and reseal the entry. The entry is sealed because the seal state value in $entry has never been modified.
```

---

### Parameters
#### **ID**
ID of the entry to unseal.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Unprotect-DSSealedEntry -detailed". For technical information, type "Get-Help Unprotect-DSSealedEntry -full".

---

### Syntax
```PowerShell
Unprotect-DSSealedEntry -ID <Guid> [<CommonParameters>]
```
