Convert-LogFunctions
--------------------

### Synopsis
Converts default cmdlets in given script file into logger methods

---

### Description

Converts default cmdlets in given script file into logger methods. For example Write-Information into Write-InfoLog, Write-Error into Write-ErrorLog and so on.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-LogFunctions -FilePath C:\myscript.ps1
```

---

### Parameters
#### **FilePath**
Path to a script file in wich functions will be converted.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

---

### Inputs
string containing path to a script file

---

### Outputs
* None

---

### Syntax
```PowerShell
Convert-LogFunctions [-FilePath] <String> [<CommonParameters>]
```
