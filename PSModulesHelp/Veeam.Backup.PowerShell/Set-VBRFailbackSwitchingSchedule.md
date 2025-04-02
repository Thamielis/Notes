Set-VBRFailbackSwitchingSchedule
--------------------------------

### Synopsis
Modifies the failback switching schedule.

---

### Description

This cmdlet modifies the failback switching schedule.

---

### Related Links
* [Get-VBRCDPReplica](Get-VBRCDPReplica)

* [Get-VBRFailbackSwitchingSchedule](Get-VBRFailbackSwitchingSchedule)

---

### Examples
> Getting Failback Schedule

$replica = Get-VBRCDPReplica -Name "Win05"
$schedule = Get-VBRFailbackSwitchingSchedule -Replica $replica
Set-VBRFailbackSwitchingSchedule -SwitchingSchedule $schedule -Replica $replica
This example shows how to get a failback schedule of the CDP replica of the Win05 VM.

Perform the following steps:
1. Run the Get-VBRCDPReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRFailbackSwitchingSchedule cmdlet. Save the result to the $replica variable.
3. Run the Set-VBRFailbackSwitchingSchedule cmdlet. Set the $replica variable as the Replica parameter.

---

### Parameters
#### **Replica**
Specifies a CDP replica that failback switching schedule you want to modify.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[VBRReplica]`|true    |named   |False        |

#### **SwitchingSchedule**
Specifies the failback schedule that you want to modify.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRFailbackSwitchingSchedule]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFailbackSwitchingSchedule

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRFailbackSwitchingSchedule -Replica <VBRReplica> -SwitchingSchedule <VBRFailbackSwitchingSchedule> [<CommonParameters>]
```
