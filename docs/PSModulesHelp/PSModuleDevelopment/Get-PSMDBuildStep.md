Get-PSMDBuildStep
-----------------

### Synopsis
Read the steps that are part of the specified build project.

---

### Description

Read the steps that are part of the specified build project.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDBuildStep
Read all steps that are part of the default build project.
```
> EXAMPLE 2

```PowerShell
Get-PSMDBuildStep -Name CreateSession -BuildProject C:\code\Project\Project.build.json
Return the CreateSession step from the specified project file.
```

---

### Parameters
#### **Name**
The name by which to filter the steps returned.
Defaults to '*'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **BuildProject**
Path to the build project file to read from.
Defaults to the currently selected project if available.
Use Select-PSMDBuildProject to select a default project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-PSMDBuildStep [[-Name] <String>] [[-BuildProject] <String>] [<CommonParameters>]
```
