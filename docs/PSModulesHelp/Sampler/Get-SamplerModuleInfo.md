Get-SamplerModuleInfo
---------------------

### Synopsis
Loads the PowerShell data file of a module manifest.

---

### Description

This function loads a psd1 (usually a module manifest), and return the hashtable.
This implementation works around the issue where Windows PowerShell version have issues
with the pwsh $Env:PSModulePath such as in vscode with the vscode powershell extension.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SamplerModuleInfo -ModuleManifestPath C:\src\MyProject\output\MyProject\MyProject.psd1
```

---

### Parameters
#### **ModuleManifestPath**
Path to the ModuleManifest to load. This will not use Import-Module because the
module may not be finished building, and might be missing some information to make
it a valid module manifest.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |Path   |

---

### Outputs
* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
Get-SamplerModuleInfo [-ModuleManifestPath] <String> [<CommonParameters>]
```
