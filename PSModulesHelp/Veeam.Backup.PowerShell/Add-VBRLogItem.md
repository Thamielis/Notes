Add-VBRLogItem
--------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Cookie**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PassThru**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[VBRSession]`|true    |named   |True (ByValue)|

#### **Status**

Valid Values:

* None
* Succeeded
* Warning
* Failed

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRLogStatus]`|false   |named   |False        |

#### **Title**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSession

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRLogItem [-Cookie <String>] [-PassThru] -Session <VBRSession> [-Status {None | Succeeded | Warning | Failed}] -Title <String> [<CommonParameters>]
```
