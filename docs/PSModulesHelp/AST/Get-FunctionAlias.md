Get-FunctionAlias
-----------------

### Synopsis
Retrieves function aliases from a PowerShell script file.

---

### Description

Parses a specified PowerShell script file to identify function definitions and extract their associated aliases.
Returns a custom object containing function names and their corresponding aliases.

---

### Related Links
* [https://psmodule.io/AST/Functions/Functions/Get-FunctionAlias/](https://psmodule.io/AST/Functions/Functions/Get-FunctionAlias/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FunctionAlias -Path "C:\Scripts\MyScript.ps1"
Retrieves all function aliases defined in the specified script file.
```
> EXAMPLE 2

```PowerShell
Get-FunctionAlias -Name "Get-Data" -Path "C:\Scripts\MyScript.ps1"
Retrieves the alias information for the function named "Get-Data" from the specified script file.
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
Get-FunctionAlias [[-Name] <String>] [-Path] <String> [<CommonParameters>]
```
