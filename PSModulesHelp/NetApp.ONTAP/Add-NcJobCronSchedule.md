Add-NcJobCronSchedule
---------------------

### Synopsis
Create a new cron job schedule entry.

---

### Description

Create a new cron job schedule entry.

---

### Related Links
* [Get-NcJobCronSchedule](Get-NcJobCronSchedule)

* [Remove-NcJobCronSchedule](Remove-NcJobCronSchedule)

* [Set-NcJobCronSchedule](Set-NcJobCronSchedule)

---

### Examples
> Example 1

Add-NcJobCronSchedule 15min -Minute 0,15,30,45
Define a cron schedule entry for jobs that should run every 15 minutes.

JobScheduleName           JobScheduleDescription
---------------           ----------------------
15min                     @:00,:15,:30,:45

---

### Parameters
#### **Name**
The name of the cron job schedule to create.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|JobScheduleName|

#### **Month**
The month(s) when the job should be run.  -1 represents all months.  Zero represents January.  Range: [-1..11].

|Type       |Required|Position|PipelineInput        |Aliases             |
|-----------|--------|--------|---------------------|--------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronMonth|

#### **Day**
The day(s) of the month when the job should be run.  -1 represents all days of a month from 1 to 31.  Range: [-1..31].

|Type       |Required|Position|PipelineInput        |Aliases           |
|-----------|--------|--------|---------------------|------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronDay|

#### **DayOfWeek**
The day(s) in the week when the job should be run.  -1 represents all days of a week.  Zero represents Sunday.  Range: [-1..6].

|Type       |Required|Position|PipelineInput        |Aliases                 |
|-----------|--------|--------|---------------------|------------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronDayOfWeek|

#### **Hour**
The hour(s) of the day when the job should be run.  -1 represents all hours.  Range: [-1..23].

|Type       |Required|Position|PipelineInput        |Aliases            |
|-----------|--------|--------|---------------------|-------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronHour|

#### **Minute**
The minute(s) of each hour when the job should be run.  -1 represents all minutes.  Range: [-1..59].

|Type       |Required|Position|PipelineInput        |Aliases              |
|-----------|--------|--------|---------------------|---------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|JobScheduleCronMinute|

#### **JobScheduleCluster**
The cluster owner of the job schedule. Defaults to the local cluster. In a Metrocluster configuration, the partner cluster can be specified.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Svm**
Specifies Svm. To create object use New-Object DataONTAP.C.Types.Job.Svm. This parameter is supported with Rest only.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Job.Svm]`|false   |named   |false        |

#### **VserverContext**
Specifies Vserver. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Cluster**
Specifies Cluster. To create object use New-Object DataONTAP.C.Types.Job.Cluster. This parameter is supported with Rest only.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[DataONTAP.C.Types.Job.Cluster]`|false   |named   |false        |

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
API: job-schedule-cron-create
Family: cluster

---

### Syntax
```PowerShell
Add-NcJobCronSchedule [-Name] <String> [-Month <Int64[]>] [-Day <Int64[]>] [-DayOfWeek <Int64[]>] [-Hour <Int64[]>] [-Minute <Int64[]>] [-JobScheduleCluster <String>] [-Svm 
```
```PowerShell
<DataONTAP.C.Types.Job.Svm>] [-VserverContext <String>] [-Cluster <DataONTAP.C.Types.Job.Cluster>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
