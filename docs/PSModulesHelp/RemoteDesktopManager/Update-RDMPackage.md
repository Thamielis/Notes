Update-RDMPackage
-----------------

### Synopsis
Update the installed version of Remote Desktop Manager

---

### Description

Update the installed version of Remote Desktop Manager

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Update-RDMPackage
```

---

### Parameters
#### **Edition**

Valid Values:

* Free
* Enterprise

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Force**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |3       |false        |

#### **Quiet**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Update-RDMPackage -detailed". For technical information, type "Get-Help Update-RDMPackage -full".

---

### Syntax
```PowerShell
Update-RDMPackage [[-Edition] <String>] [[-Quiet]] [[-Force]] [<CommonParameters>]
```
