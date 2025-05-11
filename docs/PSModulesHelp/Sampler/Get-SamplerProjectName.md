Get-SamplerProjectName
----------------------

### Synopsis
Gets the Project Name based on the ModuleManifest if Available.

---

### Description

Finds the Module Manifest through `Get-SamplerProjectModuleManifest`
and deduce ProjectName based on the BaseName of that manifest.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-SamplerProjectName -BuildRoot 'C:\src\MyModule'
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
Get-SamplerProjectName [-BuildRoot] <String> [<CommonParameters>]
```
