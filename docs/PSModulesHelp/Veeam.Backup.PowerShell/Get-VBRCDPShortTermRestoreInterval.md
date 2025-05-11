Get-VBRCDPShortTermRestoreInterval
----------------------------------

### Synopsis
Returns a list of replicated states for VM replicas.

---

### Description

This cmdlet returns a list of the replicated states for VM replicas in the date and time format.
You may want to run this cmdlet to get a list of all replicated states before you perform a failover.
Run the Start-VBRCDPReplicaFailover cmdlet, to perform a failover.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Getting Replicated States of VMs Protected with CDP

$replica = Get-VBRCDPReplica -Name "Win07"
Get-VBRCDPShortTermRestoreInterval -Replica $replica
This example shows how to get a list of replicated states that are available for the Win07 VM protected with CDP.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRCDPShortTermRestoreInterval cmdlet. Set the $replica variable as the Replica parameter.

---

### Parameters
#### **Replica**
Specifies a VM protected with CDP.
The cmdlet will return all replicated states that are available for this replica.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRCDPReplica]`|true    |named   |False        |

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
Get-VBRCDPShortTermRestoreInterval -Replica <VBRCDPReplica> [<CommonParameters>]
```
