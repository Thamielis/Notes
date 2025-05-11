Get-BuildVersion
----------------

### Synopsis
Calculates or retrieves the version of the Repository.

---

### Description

Attempts to retrieve the version associated with the repository or the module within
the repository.
If the Version is not provided, the preferred way is to use GitVersion if available,
but alternatively it will locate a module manifest in the source folder and read its version.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-BuildVersion -ModuleManifestPath source\MyModule.psd1
```

---

### Parameters
#### **ModuleManifestPath**
Path to the Module Manifest that should determine the version if GitVersion is not available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ModuleVersion**
Provide the Version to be splitted and do not rely on GitVersion or the Module's manifest.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-BuildVersion [[-ModuleManifestPath] <String>] [[-ModuleVersion] <String>] [<CommonParameters>]
```
