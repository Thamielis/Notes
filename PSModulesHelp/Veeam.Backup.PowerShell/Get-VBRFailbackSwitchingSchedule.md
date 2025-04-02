Get-VBRFailbackSwitchingSchedule
--------------------------------

### Synopsis
Returns the failback switching schedule.

---

### Description

This cmdlet returns the failback switching schedule.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

---

### Examples
> Getting Failback Schedule

$replica = Get-VBRCDPReplica -Name "Win05"
Get-VBRFailbackSwitchingSchedule -Replica $replica
This example shows how to get a failback replica schedule of the CDP replica of the Win05 VM.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRFailbackSwitchingSchedule cmdlet. Set the $replica variable as the Replica parameter.

---

### Parameters
#### **Replica**
Specifies a CDP replica for which you want to get a failback schedule.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[VBRReplica]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRReplica

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRFailbackSwitchingSchedule -Replica <VBRReplica> [<CommonParameters>]
```
