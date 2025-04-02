Get-VBRvCDCDPShortTermRestoreInterval
-------------------------------------

### Synopsis
Returns short-term restore points of a Cloud Director CDP replica.

---

### Description

This cmdlet returns short-term restore points of a Cloud Director CDP replica.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Example 1

$replica = Get-VBRCDPReplica
Get-VBRvCDCDPShortTermRestoreInterval -Replica $replica
This example shows how to get short-term restore points of a Cloud Director CDP replica.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Save the result to the $replica variable.
2. Run the Get-VBRvCDCDPShortTermRestoreInterval cmdlet. Set the $replica variable as the Replica parameter value.

---

### Parameters
#### **Replica**
Specifies the replica whose short-term restore point you want to get.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRvCDCDPReplica]`|true    |named   |False        |

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
Get-VBRvCDCDPShortTermRestoreInterval -Replica <VBRvCDCDPReplica> [<CommonParameters>]
```
