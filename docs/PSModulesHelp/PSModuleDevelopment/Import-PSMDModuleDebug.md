Import-PSMDModuleDebug
----------------------

### Synopsis
Invokes the preconfigured import of a module.

---

### Description

Invokes the preconfigured import of a module.

---

### Examples
> EXAMPLE 1

```PowerShell
Import-PSMDModuleDebug -Name 'cPSNetwork'
Imports the cPSNetwork module as it was configured to be imported using Set-ModuleDebug.
```

---

### Parameters
#### **Name**
The exact name of the module to import using the specified configuration.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Import-PSMDModuleDebug [[-Name] <String>] [<CommonParameters>]
```
