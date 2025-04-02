Install-RDMPackage
------------------

### Synopsis
Install the latest or specified version of Remote Desktop Manager

---

### Description

Install the latest or specified version of Remote Desktop Manager

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Install-RDMPackage
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
|`[Switch]`|false   |named   |false        |

#### **NoDesktopShortcut**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoStartMenuShortcut**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Quiet**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RequiredVersion**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Install-RDMPackage -detailed". For technical information, type "Get-Help Install-RDMPackage -full".

---

### Syntax
```PowerShell
Install-RDMPackage [[-Edition] <Free | Enterprise>] [[-RequiredVersion] <String>] [-NoDesktopShortcut] [-NoStartMenuShortcut] [-Quiet] [-Force] [<CommonParameters>]
```
