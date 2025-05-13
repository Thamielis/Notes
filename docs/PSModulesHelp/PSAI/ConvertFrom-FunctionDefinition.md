ConvertFrom-FunctionDefinition
------------------------------

### Synopsis
Converts a PowerShell function definition to an OpenAI function specification.

---

### Description

This function takes a PowerShell function definition and converts it to an OpenAI function specification.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-FunctionDefinition -FunctionInfo (Get-Command Get-ChildItem)
This example converts the Get-ChildItem function to an OpenAI function specification.
```

---

### Parameters
#### **FunctionInfo**
An array of CommandInfo objects representing the functions to convert.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CommandInfo[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
ConvertFrom-FunctionDefinition [[-FunctionInfo] <CommandInfo[]>] [<CommonParameters>]
```
