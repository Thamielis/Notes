Uninstall-RDMPackage
--------------------

### Synopsis
Uninstall the installed version of Remote Desktop Manager

---

### Description

Uninstall the installed version of Remote Desktop Manager

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Uninstall-RDMPackage
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

#### **Quiet**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Uninstall-RDMPackage -detailed". For technical information, type "Get-Help Uninstall-RDMPackage -full".

---

### Syntax
```PowerShell
Uninstall-RDMPackage [[-Edition] <Free | Enterprise>] [-Quiet] [<CommonParameters>]
```
