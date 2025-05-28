Add-Path
--------

### Synopsis
Prepends a directory to the system PATH variable for all subsequent actions in the current job. 
The currently running action cannot access the new path variable.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Add-Path -Path C:\foo\bar
```

---

### Parameters
#### **Path**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Add-Path [-Path] <String> [<CommonParameters>]
```
