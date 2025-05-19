Get-PSMDBuildProject
--------------------

### Synopsis
Reads & returns a build project.

---

### Description

Reads & returns a build project.
A build project is a container including the steps executed during the build.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDBuildProject -Path 'C:\code\project' -Name project
Will load the build project stored in the file "C:\code\project\project.build.json"
```

---

### Parameters
#### **Path**
Path to the build project file.
May target the folder, in which case the -Name parameter must be specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Name**
The name of the build project to read.
Use together with the -Path parameter only.
Absolute file path assumed will be: "<Path>\<Name>.build.json"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Selected**
Rather than specifying the path to read from, return the currently selected build project.
Use Select-PSMDBuildProject to select a build project as the default ("selected") project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Syntax
```PowerShell
Get-PSMDBuildProject -Path <String> [-Name <String>] [<CommonParameters>]
```
```PowerShell
Get-PSMDBuildProject -Selected [<CommonParameters>]
```
