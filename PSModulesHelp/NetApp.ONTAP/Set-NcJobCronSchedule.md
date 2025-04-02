Set-NcJobCronSchedule
---------------------

### Synopsis
Modify an existing cron job schedule entry.

---

### Description

Modify an existing cron job schedule entry.

---

### Related Links
* [Get-NcJobCronSchedule](Get-NcJobCronSchedule)

* [Add-NcJobCronSchedule](Add-NcJobCronSchedule)

* [Remove-NcJobCronSchedule](Remove-NcJobCronSchedule)

---

### Examples
> Example 1

Set-NcJobCronSchedule 15min -DayOfWeek 1,3,5
Modify the cron schedule entry to only run three days per week.

JobScheduleName           JobScheduleDescription
---------------           ----------------------
15min                     Mon,Wed,Fri@:00,:15,:30,:45

---

### Parameters
#### **Name**
The name of the cron job schedule to modify.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|JobScheduleName|

#### **Month**
The month(s) when the job should be run.

|Type       |Required|Position|PipelineInput        |Aliases             |
|-----------|--------|--------|---------------------|--------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronMonth|

#### **Day**
The day(s) of the month when the job should be run.

|Type       |Required|Position|PipelineInput        |Aliases           |
|-----------|--------|--------|---------------------|------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronDay|

#### **DayOfWeek**
The day(s) in the week when the job should be run.

|Type       |Required|Position|PipelineInput        |Aliases                 |
|-----------|--------|--------|---------------------|------------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronDayOfWeek|

#### **Hour**
The hour(s) of the day when the job should be run.

|Type       |Required|Position|PipelineInput        |Aliases            |
|-----------|--------|--------|---------------------|-------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronHour|

#### **Minute**
The minute(s) of each hour when the job should be run.

|Type       |Required|Position|PipelineInput        |Aliases              |
|-----------|--------|--------|---------------------|---------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronMinute|

#### **JobScheduleCluster**
The cluster owner of the job schedule. Defaults to the local cluster. In a Metrocluster configuration, the partner cluster can be specified.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Job.JobScheduleCronInfo

---

### Notes
Category: job
API: job-schedule-cron-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcJobCronSchedule [-Name] <String> [-Month <Int64[]>] [-Day <Int64[]>] [-DayOfWeek <Int64[]>] [-Hour <Int64[]>] [-Minute <Int64[]>] [-JobScheduleCluster <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
