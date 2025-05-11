New-VBRFailbackSwitchingSchedule
--------------------------------

### Synopsis
Defines the failback switching schedule.

---

### Description

This cmdlet defines the VBRFailbackSwitchingSchedule object.
This object defines when the switch from replicas to production VMs must be performed.

---

### Examples
> Example 1. Defining Manual Failback Schedule

```PowerShell
New-VBRFailbackSwitchingSchedule -Type Manual
This command defines the manual failback schedule.
```
> Example 2. Defining Auto Failback Schedule

```PowerShell
New-VBRFailbackSwitchingSchedule -Type Auto
This command defines the auto failback schedule.
```
> Example 3. Defining Sheduled Failback

$date = Get-Date  -Year 2021 -Month 6 -Day 2 -Hour 9 -Minute 05 -Second 54
New-VBRFailbackSwitchingSchedule -Type Scheduled -ScheduledTime $date
This command schedules the failback to run at 9.05.54 AM.

Perform the following steps:
1. Run the Get-Date cmdlet. Specify the Year, Month, Day, Hour, Minute and Second parameter values. Save the result to the $date variable.
2. Run the New-VBRFailbackSwitchingSchedule cmdlet. Specify the Type parameter value. Set the $date variable as the ScheduledTime parameter value.

---

### Parameters
#### **ScheduledTime**
For the scheduled type of the failback.
Specifies the date and time when Veeam Backup & Replication must perform a failback from a CDP replica Vm to a production VM.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Type**
Specifies a type of the failback schedule.
You can set one of the following types:
* Manual: Use this option if you want to switch CDP replica to production VMs manually once CDP replicas are ready.
* Auto: Use this option if you want to switch CDP replica to production VMs automatically once CDP replicas are ready.
* Scheduled: Use this option if you want to switch CDP replica to production VMs according to a specific schedule.
Use the ScheduledTime parameter to specify the date and time for a scheduled failback.
Valid Values:

* Manual
* Auto
* Scheduled

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRFailbackSwitchingType]`|false   |named   |False        |

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
New-VBRFailbackSwitchingSchedule [-ScheduledTime <DateTime>] [-Type {Manual | Auto | Scheduled}] [<CommonParameters>]
```
