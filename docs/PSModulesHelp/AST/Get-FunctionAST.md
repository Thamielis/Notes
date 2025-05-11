Get-FunctionAST
---------------

### Synopsis
Retrieves the abstract syntax tree (AST) of function definitions from a PowerShell script.

---

### Description

Parses a specified PowerShell script file and extracts function definitions matching the given name.
By default, it returns all function definitions if no specific name is provided.

---

### Related Links
* [https://psmodule.io/AST/Functions/Core/Get-FunctionAST/](https://psmodule.io/AST/Functions/Core/Get-FunctionAST/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FunctionAST -Path "C:\Scripts\MyScript.ps1"
Retrieves all function definitions from "MyScript.ps1".
```
> EXAMPLE 2

```PowerShell
Get-FunctionAST -Name "Get-Data" -Path "C:\Scripts\MyScript.ps1"
Retrieves only the function definition named "Get-Data" from "MyScript.ps1".
```

---

### Parameters
#### **Name**
The name of the function to search for. Defaults to all functions ('*').

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Path**
The path to the PowerShell script file to be parsed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Syntax
```PowerShell
Get-FunctionAST [[-Name] <String>] [-Path] <String> [<CommonParameters>]
```
