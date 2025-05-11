Get-FunctionType
----------------

### Synopsis
Extracts function types from a specified PowerShell script.

---

### Description

Parses the given PowerShell script file and retrieves all function types
defined within it. This function utilizes the PowerShell Abstract Syntax Tree (AST)
to analyze the script and extract function definitions.

---

### Related Links
* [https://psmodule.io/AST/Functions/Functions/Get-FunctionType/](https://psmodule.io/AST/Functions/Functions/Get-FunctionType/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FunctionType -Path "C:\Scripts\MyScript.ps1"
Retrieves all function types defined in the specified script file.
```

---

### Parameters
#### **Path**
The path to the PowerShell script file to be parsed.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-FunctionType -Path <String> [<CommonParameters>]
```
