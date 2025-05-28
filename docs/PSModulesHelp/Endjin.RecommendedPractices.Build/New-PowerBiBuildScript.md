New-PowerBiBuildScript
----------------------

### Synopsis
Generates a build script.

---

### Description

Generates a build script, from a template, that uses InvokeBuild and functionality available in this module.

---

### Examples
> EXAMPLE 1

```PowerShell
New-PowerBiBuildScript -Path ./build.ps1
Generates a build script in the current directory configured for building & publishing Bicep modules.
```

---

### Parameters
#### **PbixFilesPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ReportsPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **OutputPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Force**
When true, any existing file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-PowerBiBuildScript [-PbixFilesPath] <String> [-ReportsPath] <String> [[-OutputPath] <String>] [-Force] [<CommonParameters>]
```
