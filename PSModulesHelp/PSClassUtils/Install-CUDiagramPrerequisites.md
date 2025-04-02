Install-CUDiagramPrerequisites
------------------------------

### Synopsis
This function installs the prerequisites for PSClassUtils.

---

### Description

Installation of PSGraph

---

### Examples
> EXAMPLE 1

```PowerShell
Install-CUDiagramPrerequisites
```
> EXAMPLE 2

```PowerShell
Install-CUDiagramPrerequisites -proxy "10.10.10.10" -Scope CurrentUser
```

---

### Parameters
#### **Proxy**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Scope**

Valid Values:

* AllUsers
* CurrentUser

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
Author: Stephanevg
Version: 2.0

---

### Syntax
```PowerShell
Install-CUDiagramPrerequisites [[-Proxy] <String>] [[-Scope] <String>] [<CommonParameters>]
```
