Get-ToolProperty
----------------

### Synopsis
Retrieves the properties of a specified tool.

---

### Description

The Get-ToolProperty function retrieves the properties of a specified tool from a given parameter.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ToolProperty -Parameter "FilePath"
Returns a string type property for the FilePath parameter.
```

---

### Parameters
#### **Parameter**
Gets the type from the parameter and returns a tool property object.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |1       |true (ByValue)|

---

### Syntax
```PowerShell
Get-ToolProperty [-Parameter] <Object> [<CommonParameters>]
```
