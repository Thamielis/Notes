Get-VBRvCDCDPLongTermRestorePoint
---------------------------------

### Synopsis
Returns long-term restore points of a Cloud Director CDP replica.

---

### Description

This cmdlet returns long-term restore points of a Cloud Director CDP replica.

---

### Examples
> Example 1

$replica = Get-VBRCDPReplica
Get-VBRvCDCDPLongTermRestorePoint -Replica $replica
This cmdlet returns long-term restore points of a Cloud Director CDP replica.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Save the result to the $monthly variable.
2. Run the New-VBRSureBackupJobScheduleOptions cmdlet. Set the $replica variable as the Replica parameter value.

---

### Parameters
#### **ApplicationConsistent**
Defines that the cmdlet will return only application-consistent restore points.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Last**
Defines that the cmdet will return only the latest long-term restore points.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**
Specifies the replica whose long-term restore point you want to get.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRvCDCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDCDPReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRvCDCDPLongTermRestorePoint [-ApplicationConsistent] [-Last] -Replica <VBRvCDCDPReplica> [<CommonParameters>]
```
