New-DotNetBuildScript
---------------------

### Synopsis
Generates a build script.

---

### Description

Generates a build script, from a template, that uses InvokeBuild and functionality available in this module.

---

### Examples
> EXAMPLE 1

```PowerShell
New-DotNetBuildScript -SolutionPath ./src/MySolution/MySolution.sln -Path ./build.ps1
Generates a build script in the current directory configured to build the specified solution.
```

---

### Parameters
#### **SolutionPath**
The path to the Visual Studio solution associated with this build.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **OutputPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Force**
When true, any existing file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-DotNetBuildScript [-SolutionPath] <String> [[-OutputPath] <String>] [-Force] [<CommonParameters>]
```
