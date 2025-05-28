Add-Mask
--------

### Synopsis
Masking a value prevents a string or variable from being printed in the log. 
Each masked word separated by whitespace is replaced with the * character.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Add-Mask -Value "Super Secret"
```

---

### Parameters
#### **Value**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Syntax
```PowerShell
Add-Mask [-Value] <String> [<CommonParameters>]
```
