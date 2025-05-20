Select-PSMDBuildProject
-----------------------

### Synopsis
Set the specified build project as the default project.

---

### Description

Set the specified build project as the default project.
This will have most other commands in this Component automatically use the specified project.

---

### Examples
> EXAMPLE 1

```PowerShell
Select-PSMDBuildProject -Path 'c:\code\Project\Project.build.json'
Sets the specified build project as the default project.
```

---

### Parameters
#### **Path**
Path to the project file to pick.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Register**
Persist the choice as default build project file across PowerShell sessions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Select-PSMDBuildProject [-Path] <String> [-Register] [<CommonParameters>]
```
