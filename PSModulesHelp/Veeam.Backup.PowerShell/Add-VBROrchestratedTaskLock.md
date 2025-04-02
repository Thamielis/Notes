Add-VBROrchestratedTaskLock
---------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **PassThru**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**

|Type             |Required|Position|PipelineInput        |
|-----------------|--------|--------|---------------------|
|`[VBRCDPReplica]`|true    |named   |True (ByPropertyName)|

#### **RestorePoint**

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[COib]`|true    |named   |True (ByPropertyName)|

#### **Session**

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBROrchestratedTaskSession]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBROrchestratedTaskSession

Veeam.Backup.Core.COib

Veeam.Backup.PowerShell.Infos.VBRCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBROrchestratedTaskLock [-PassThru] -Replica <VBRCDPReplica> -Session <VBROrchestratedTaskSession> [<CommonParameters>]
```
```PowerShell
Add-VBROrchestratedTaskLock [-PassThru] -RestorePoint <COib> -Session <VBROrchestratedTaskSession> [<CommonParameters>]
```
