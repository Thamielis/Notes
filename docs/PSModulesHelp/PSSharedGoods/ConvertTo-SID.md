ConvertTo-SID
-------------

### Synopsis
Converts a given identity to a Security Identifier (SID).

---

### Description

This function takes one or more identity strings and converts them to their corresponding Security Identifiers (SIDs). It caches the results for faster lookup.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-SID -Identity 'Administrator'
Converts the 'Administrator' identity to its corresponding SID.
```
> EXAMPLE 2

```PowerShell
ConvertTo-SID -Identity 'Guest', 'User1'
Converts the 'Guest' and 'User1' identities to their corresponding SIDs.
```

---

### Parameters
#### **Identity**
Specifies the identity strings to be converted to SIDs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
ConvertTo-SID [[-Identity] <String[]>] [<CommonParameters>]
```
