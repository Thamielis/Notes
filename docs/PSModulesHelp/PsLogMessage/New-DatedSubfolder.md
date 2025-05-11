New-DatedSubfolder
------------------

### Synopsis
{{ Fill in the Synopsis }}

---

### Description

{{ Fill in the Description }}

---

### Examples
> Example 1

```PowerShell
PS C:\> {{ Add example code here }}
{{ Add example description here }}
```

---

### Parameters
#### **ProgressAction**
{{ Fill ProgressAction Description }}
Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend
* Break

|Type                                             |Required|Position|PipelineInput|Aliases|
|-------------------------------------------------|--------|--------|-------------|-------|
|`[System.Management.Automation.ActionPreference]`|false   |named   |False        |proga  |

#### **Root**
{{ Fill Root Description }}

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[System.String]`|true    |0       |False        |

#### **Suffix**
{{ Fill Suffix Description }}

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[System.String]`|false   |1       |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-DatedSubfolder [-Root] <System.String> [[-Suffix] <System.String>] [-ProgressAction <System.Management.Automation.ActionPreference>] [<CommonParameters>]
```
