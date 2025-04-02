New-VBRPeriodicallyOptions
--------------------------

### Synopsis
Creates periodically schedule settings.

---

### Description

This cmdlet creates an object containing periodical schedule settings. You can use this object to create a discovery schedule for a protection group. Veeam Backup & Replication performs a discovery operation according to this schedule: connects to computers of a selected protection group and gathers information about them.
To create a discovery schedule, run the New-VBRProtectionGroupScheduleOptions cmdlet.

---

### Related Links
* [New-VBRProtectionGroupScheduleOptions](New-VBRProtectionGroupScheduleOptions)

* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Set-VBRProtectionGroup](Set-VBRProtectionGroup)

---

### Examples
> Example 1. Creating Periodical Schedule Settings

```PowerShell
New-VBRPeriodicallyOptions -FullPeriod 12 -PeriodicallyKind
This command creates an object containing periodical schedule settings.
```
> Example 2. Creating Discovery Schedule for Protection Group

$periodically = New-VBRPeriodicallyOptions -FullPeriod 12 -PeriodicallyKind Hours
New-VBRProtectionGroupScheduleOptions -PolicyType Periodically -PeriodicallyOptions $periodically
This example shows how to create a discovery schedule for a protection group. Per this schedule, Veeam Backup & Replication will perform new computer discovery every 12 hours.
Perform the following steps:
1. Run the New-VBRPeriodicallyOptions cmdlet. Set the 12 value as the FullPeriod parameter value. Set the Hours value as the PeriodicallyKind parameter value. Save the result to the $periodically variable.
2. Run the New-VBRProtectionGroupScheduleOptions cmdlet. Set the Periodically option for the PolicyType parameter. Set the $periodically variable as the PeriodicallyOptions parameter value.
> Example 3. Applying Discovery Schedule to Protection Group

$periodically = New-VBRPeriodicallyOptions -FullPeriod 12 -PeriodicallyKind Hours
$schedule = New-VBRProtectionGroupScheduleOptions -PolicyType Periodically -PeriodicallyOptions $periodically
$group = Get-VBRProtectionGroup -Name "East Computers"
Set-VBRProtectionGroup -ProtectionGroup $group -ScheduleOptions $schedule
This example shows how to apply a discovery schedule to a protection group. Per this schedule, Veeam Backup & Replication will perform new computer discovery every 12 hours.
Perform the following steps:
1. Run the New-VBRPeriodicallyOptions cmdlet. Set the 12 value as the FullPeriod parameter value. Set the Hours value as the PeriodicallyKind parameter value. Save the result to the $periodically variable.
2. Run the New-VBRProtectionGroupScheduleOptions cmdlet. Set the Periodically option for the PolicyType parameter. Set the $periodically variable as the PeriodicallyOptions parameter value. Save the result to the $schedule variable.
3. Apply a discovery schedule to a protection group:
- Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
- Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $schedule variable as the ScheduleOptions parameter value.

---

### Parameters
#### **FullPeriod**
Specifies the number of hours or minutes for the PeriodicallyKind parameter.
Permitted values:
* For Hours: 1, 2, 3, 4, 6, 8, 12, 24.
* For Minutes: 1-999.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **HourlyOffset**
Used for adjusting the discover window start time.
Specifies the number of minutes (1-59). Discovery operations will start at the hour set in the discovery window plus the indicated period (for example, at 8:30).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |True (ByPropertyName)|

#### **PeriodicallyKind**
Specifies the type of periodical schedule settings:
* Hours: Veeam Backup & Replication will perform discovery operations repeatedly in specified number of hours (for example, every 6 hours).
* Minutes: Veeam Backup & Replication will perform discovery operations repeatedly in specified number of minutes (for example, every 30 minutes).
* Continuously: Veeam Backup & Replication will discover new computers in a non-stop manner.
Valid Values:

* Hours
* Minutes
* Continuously

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRPeriodicallyKinds]`|false   |named   |True (ByPropertyName, ByValue)|

#### **PeriodicallySchedule**
Specifies the discovery window. The cmdlet sets the time period within which Veeam Backup & Replication is allowed to perform discovery operations for computers of a protection group.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRBackupWindowOptions]`|false   |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRPeriodicallyKinds

System.Int32

Veeam.Backup.PowerShell.Infos.VBRBackupWindowOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRPeriodicallyOptions [-FullPeriod <Int32>] [-HourlyOffset <Int32>] [-PeriodicallyKind {Hours | Minutes | Continuously}] [-PeriodicallySchedule <VBRBackupWindowOptions>] [<CommonParameters>]
```
