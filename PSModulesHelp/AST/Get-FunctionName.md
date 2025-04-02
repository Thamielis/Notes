Get-FunctionName
----------------

### Synopsis
Extracts function names from a specified PowerShell script.

---

### Description

Parses the given PowerShell script file and retrieves all function names
defined within it. This function utilizes the PowerShell Abstract Syntax Tree (AST)
to analyze the script and extract function definitions.

---

### Related Links
* [https://psmodule.io/AST/Functions/Functions/Get-FunctionName/](https://psmodule.io/AST/Functions/Functions/Get-FunctionName/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FunctionName -Path "C:\Scripts\MyScript.ps1"
Retrieves all function names defined in the specified script file.
```

---

### Parameters
#### **Path**
The path to the script file to parse

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Notes
Uses PowerShell's AST to analyze script structure.

---

### Syntax
```PowerShell
Get-FunctionName [-Path] <String> [<CommonParameters>]
```
