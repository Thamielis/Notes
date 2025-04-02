New-VBRProtectionGroupScheduleOptions
-------------------------------------

### Synopsis
Creates a discovery schedule.

---

### Description

This cmdlet creates the VBRProtectionGroupScheduleOptions object representing a discovery schedule for a protection group. Per this schedule, <%VBR%> performs a discovery operation: connects to computers of a selected protection group and gathers information about them. After the discovery operation is complete, processed computers are recognized by <%VBR%> as discovered.
Run the Set-VBRProtectionGroup cmdlet to apply a discovery schedule to a protection group.
Run the Rescan-VBREntity cmdlet to discover computers manually.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Set-VBRProtectionGroup](Set-VBRProtectionGroup)

---

### Examples
> Example 1. Creating Discovery Schedule for Protection Group

$daily = New-VBRDailyOptions -DayofWeek Friday -Period 17:00
New-VBRProtectionGroupScheduleOptions -PolicyType Daily -DailyOptions $daily
This example shows how to create a discovery schedule for a protection group. Per this schedule, Veeam Backup & Replication will perform discovery operations every Friday at 5 PM.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Set the Friday option for the DayofWeek parameter. Specify the Period parameter value. Save the result to the $daily variable.
2. Run the New-VBRProtectionGroupScheduleOptions cmdlet. Set the Daily option for the PolicyType parameter. Set the $daily variable as the DailyOptions parameter value.
> Example 2. Applying Discovery Schedule to Protection Group

$daily = New-VBRDailyOptions -DayOfWeek Friday -Period 17:00
$schedule = New-VBRProtectionGroupScheduleOptions -PolicyType Daily -DailyOptions $daily
$group = Get-VBRProtectionGroup -Name "North Computers"
Set-VBRProtectionGroup -ProtectionGroup $group -ScheduleOptions $schedule
This example shows how to apply a discovery schedule to a protection group. Per this schedule, Veeam Backup & Replication will perform discovery operations every Friday at 5 PM.
Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Set the Friday option for the DayofWeek parameter. Specify the Period parameter value. Save the result to the $daily variable.
2. Run the New-VBRProtectionGroupScheduleOptions cmdlet. Set the Daily option for the PolicyType parameter. Set the $daily variable as the DailyOptions parameter value. Save the result to the $schedule variable.
3. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
4. Run the Set-VBRProtectionGroup cmdlet. Set the $group variable as the ProtectionGroup parameter value. Set the $schedule variable as the ScheduleOptions parameter value.

---

### Parameters
#### **DailyOptions**
For daily schedule.
Specifies daily schedule settings. The cmdlet will create the discovery schedule with these settings.

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[VBRDailyOptions]`|false   |named   |True (ByPropertyName)|

#### **PeriodicallyOptions**
For periodical schedule.
Specifies periodical schedule settings. The cmdlet will create the discovery schedule with these settings.

|Type                      |Required|Position|PipelineInput        |
|--------------------------|--------|--------|---------------------|
|`[VBRPeriodicallyOptions]`|false   |named   |True (ByPropertyName)|

#### **PolicyType**
Specifies the type of the discovery schedule:
* Daily
* Periodically
The cmdlet will create the discovery schedule of this type.
Valid Values:

* Daily
* Periodically

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRProtectionGroupPolicyType]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRProtectionGroupPolicyType

Veeam.Backup.PowerShell.Infos.VBRDailyOptions

Veeam.Backup.PowerShell.Infos.VBRPeriodicallyOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRProtectionGroupScheduleOptions [-DailyOptions <VBRDailyOptions>] [-PeriodicallyOptions <VBRPeriodicallyOptions>] [-PolicyType {Daily | Periodically}] [<CommonParameters>]
```
