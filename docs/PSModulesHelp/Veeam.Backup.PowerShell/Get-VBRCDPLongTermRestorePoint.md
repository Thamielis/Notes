Get-VBRCDPLongTermRestorePoint
------------------------------

### Synopsis
Returns a long-term restore point of VM replicas.

---

### Description

This cmdlet returns a long-term restore point of VM replicas.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Example 1.  Getting all VMs Protected with CDP LongTerm Restore Points

$replica = Get-VBRCDPReplica -Name "WinK0t"
Get-VBRCDPLongTermRestorePoint -Replica $replica
This command returns all long-term restore points that are available for the WinK0t VM protected with CDP.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRCDPLongTermRestorePoint cmdlet. Set the $replica variable as the Replica parameter.
> Example 2. Getting ApplicationConsistent Restore Points for VM Protected with CDP

$replica = Get-VBRCDPReplica -Name "WinK0t"
Get-VBRCDPLongTermRestorePoint -Replica $replica -ApplicationConsistent
This command returns all application-consistent restore points that are available for the WinK0t VM protected with CDP.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRCDPLongTermRestorePoint cmdlet. Set the $replica variable as the Replica parameter. Provide the ApplicationConsistent parameter.
> Example 3. Getting Last LongTerm Restore Points for VM Protected with CDP

$replica = Get-VBRCDPReplica -Name "WinK0t"
Get-VBRCDPLongTermRestorePoint -Replica $replica -Last
This command returns the last restore point that is available for the WinK0t VM protected with CDP.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRCDPLongTermRestorePoint cmdlet. Set the $replica variable as the Replica parameter. Provide the Last parameter.

---

### Parameters
#### **ApplicationConsistent**
Defines that the cmdlet will return only application-consistent restore points.
If you do not provide this parameter, the cmdet will also return crash-consistent restore points.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Last**
Defines that the cmdlet will return only the last restore point.
If you do not provide this parameter, the cmdet will return all restore points.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Replica**
Specifies a VM protected with CDP which long-term restore points you want to get.
Accepts the VBRCDPReplica object.
To create this object, run the Get-VBRCDPReplica cmdlet.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRCDPReplica]`|true    |named   |True (ByPropertyName, ByValue)|

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
Get-VBRCDPLongTermRestorePoint [-ApplicationConsistent] [-Last] -Replica <VBRCDPReplica> [<CommonParameters>]
```
