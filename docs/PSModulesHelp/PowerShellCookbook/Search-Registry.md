Search-Registry
---------------

### Synopsis
Search the registry for keys or properties that match a specific value.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Set-Location HKCU:\Software\Microsoft\
PS > Search-Registry Run
```

---

### Parameters
#### **Pattern**
The text to search for

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Search-Registry [-Pattern] <String> [<CommonParameters>]
```
