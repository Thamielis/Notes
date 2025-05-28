New-BicepModuleBuildScript
--------------------------

### Synopsis
Generates a build script.

---

### Description

Generates a build script, from a template, that uses InvokeBuild and functionality available in this module.

---

### Examples
> EXAMPLE 1

```PowerShell
New-BicepModuleBuildScript -Path ./build.ps1
Generates a build script in the current directory configured for building & publishing Bicep modules.
```

---

### Parameters
#### **OutputPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Force**
When true, any existing file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-BicepModuleBuildScript [[-OutputPath] <String>] [-Force] [<CommonParameters>]
```
