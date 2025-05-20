Get-PSMDModuleDebug
-------------------

### Synopsis
Retrieves module debugging configurations

---

### Description

Retrieves a list of all matching module debugging configurations.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDModuleDebug -Filter *net*
Returns the module debugging configuration for all modules with a name that contains "net"
```

---

### Parameters
#### **Filter**
Default: "*"
A string filter applied to the module name. All modules of matching name (using a -Like comparison) will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-PSMDModuleDebug [[-Filter] <String>] [<CommonParameters>]
```
