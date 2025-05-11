Get-SamplerSourcePath
---------------------

### Synopsis
Gets the project's source Path based on the ModuleManifest location.

---

### Description

By finding the ModuleManifest of the project using `Get-SamplerProjectModuleManifest`
this function assumes that the source folder is the parent folder of
that module manifest.
This allows the source folder to be src, source, or the Module name's, without
hardcoding the name.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SamplerSourcePath -BuildRoot 'C:\src\MyModule'
```

---

### Parameters
#### **BuildRoot**
BuildRoot of the Sampler project to search the Module manifest from.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Get-SamplerSourcePath [-BuildRoot] <String> [<CommonParameters>]
```
