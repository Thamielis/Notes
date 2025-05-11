Show-NcHelp
-----------

### Synopsis
Display Data ONTAP PowerShell Toolkit documentation in a browser.

---

### Description

Display Data ONTAP PowerShell Toolkit documentation in a browser.

The bundled HTML documentation lists the clustered ONTAP cmdlets by category and API, allowing the user to quickly find cmdlets of interest.

---

### Related Links
* [Get-NcHelp](Get-NcHelp)

---

### Examples
> Example 1

```PowerShell
Show-NcHelp
Display clustered Data ONTAP Toolkit documentation in a browser.
```

---

### Parameters
#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Show-NcHelp [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
