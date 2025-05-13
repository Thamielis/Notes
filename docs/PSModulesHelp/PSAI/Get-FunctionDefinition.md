Get-FunctionDefinition
----------------------

### Synopsis
Returns the definition of one or more PowerShell functions.

---

### Description

The Get-FunctionDefinition function takes an array of CommandInfo objects representing PowerShell functions and returns their definitions as strings.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FunctionDefinition (Get-Command Get-FunctionDefinition)
```

---

### Parameters
#### **FunctionInfo**
An array of CommandInfo objects representing PowerShell functions.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CommandInfo[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-FunctionDefinition [[-FunctionInfo] <CommandInfo[]>] [<CommonParameters>]
```
