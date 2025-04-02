Start-VBRDataLabCDPReplicaFailover
----------------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **Force**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LongTermRestorePoint**

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRCDPLongTermRestorePoint]`|true    |named   |False        |

#### **PowerOn**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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

#### **ToPointInTime**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

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
Start-VBRDataLabCDPReplicaFailover [-Force] -LongTermRestorePoint <VBRCDPLongTermRestorePoint> [-PowerOn] [-Reason <String>] -Replica <VBRCDPReplica> [-RunAsync] -Session <VBROrchestratedTaskSession> [-Confirm] 
```
```PowerShell
[-WhatIf] [<CommonParameters>]
```
```PowerShell
Start-VBRDataLabCDPReplicaFailover [-Force] [-PowerOn] [-Reason <String>] -Replica <VBRCDPReplica> [-RunAsync] -Session <VBROrchestratedTaskSession> [-ToPointInTime <DateTime>] [-Confirm] [-WhatIf] 
```
```PowerShell
[<CommonParameters>]
```
