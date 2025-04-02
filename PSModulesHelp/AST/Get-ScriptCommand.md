Get-ScriptCommand
-----------------

### Synopsis
Retrieves the commands used within a specified PowerShell script.

---

### Description

Analyzes a given PowerShell script and extracts all command invocations.
Optionally includes call operators (& and .) in the results.
Returns details such as command name, position, and file reference.

---

### Related Links
* [https://psmodule.io/AST/Functions/Scripts/Get-ScriptCommand/](https://psmodule.io/AST/Functions/Scripts/Get-ScriptCommand/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ScriptCommand -Path "C:\Scripts\example.ps1"
Extracts and lists all commands found in the specified PowerShell script.
```
> EXAMPLE 2

```PowerShell
Get-ScriptCommand -Path "C:\Scripts\example.ps1" -IncludeCallOperators
Extracts all commands, including those executed with call operators (& and .).
```

---

### Parameters
#### **Path**
The path to the PowerShell script file to be parsed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **IncludeCallOperators**
Include call operators in the results, i.e. & and .

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ScriptCommand [-Path] <String> [-IncludeCallOperators] [<CommonParameters>]
```
