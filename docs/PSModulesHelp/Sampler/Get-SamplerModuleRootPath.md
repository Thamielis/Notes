Get-SamplerModuleRootPath
-------------------------

### Synopsis
Gets the absolute ModuleRoot path (the psm1) of a module.

---

### Description

This function reads the module manifest (.psd1) and if the ModuleRoot property
is defined, it will resolve its absolute path based on the ModuleManifest's Path.

If no ModuleRoot is defined, then this function will return $null.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SamplerModuleRootPath -ModuleManifestPath C:\src\MyModule\output\MyModule\2.3.4\MyModule.psd1
# C:\src\MyModule\output\MyModule\2.3.4\MyModule.psm1
```

---

### Parameters
#### **ModuleManifestPath**
The path (relative to the current working directory or absolute) to the ModuleManifest to
read to find the ModuleRoot.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |Path   |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-SamplerModuleRootPath [-ModuleManifestPath] <String> [<CommonParameters>]
```
