ConvertTo-DnsFqdn
-----------------

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
#### **Cache**
{{ Fill Cache Description }}

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.PSReference]`|true    |1       |False        |

#### **ComputerName**
{{ Fill ComputerName Description }}

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[System.String]`|true    |0       |False        |

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

#### **ThisFqdn**
{{ Fill ThisFqdn Description }}

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[System.Management.Automation.Switch]`|false   |named   |False        |

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
ConvertTo-DnsFqdn [-ComputerName] <System.String> [-Cache] <System.Management.Automation.PSReference> [-ProgressAction <System.Management.Automation.ActionPreference>] [-ThisFqdn] [<CommonParameters>]
```
