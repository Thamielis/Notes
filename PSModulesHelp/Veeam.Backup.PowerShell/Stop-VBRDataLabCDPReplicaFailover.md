Stop-VBRDataLabCDPReplicaFailover
---------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only.

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **ForceFailover**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBROrchestratedTaskSession]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRDataLabCDPReplicaFailover [-ForceFailover] -Replica <VBRCDPReplica> [-RunAsync] -Session <VBROrchestratedTaskSession> [<CommonParameters>]
```
