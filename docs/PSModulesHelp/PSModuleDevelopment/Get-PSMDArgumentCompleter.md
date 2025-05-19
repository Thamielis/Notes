Get-PSMDArgumentCompleter
-------------------------

### Synopsis
Gets the registered argument completers.

---

### Description

This function can be used to serach the argument completers registered using either the Register-ArgumentCompleter command or created using the ArgumentCompleter attribute.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDArgumentCompleter
Get all argument completers in use in the current PowerShell session.
```

---

### Parameters
#### **CommandName**
Filter the results to a specific command. Wildcards are supported.

|Type      |Required|Position|PipelineInput                 |Aliases|
|----------|--------|--------|------------------------------|-------|
|`[String]`|false   |2       |true (ByValue, ByPropertyName)|Name   |

#### **ParameterName**
Filter results to a specific parameter name. Wildcards are supported.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-PSMDArgumentCompleter [[-CommandName] <String>] [-ParameterName <String>] [<CommonParameters>]
```
