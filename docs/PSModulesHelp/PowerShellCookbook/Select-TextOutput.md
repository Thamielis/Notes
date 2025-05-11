Select-TextOutput
-----------------

### Synopsis
Searches the textual output of a command for a pattern.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Service | Select-TextOutput audio
Finds all references to "Audio" in the output of Get-Service
```

---

### Parameters
#### **Pattern**
The pattern to search for

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Select-TextOutput [[-Pattern] <Object>] [<CommonParameters>]
```
