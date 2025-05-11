Set-NcJobIntervalSchedule
-------------------------

### Synopsis
Modify an existing interval job schedule entry.

---

### Description

Modify an existing interval job schedule entry.

---

### Related Links
* [Get-NcJobIntervalSchedule](Get-NcJobIntervalSchedule)

* [Add-NcJobIntervalSchedule](Add-NcJobIntervalSchedule)

* [Remove-NcJobIntervalSchedule](Remove-NcJobIntervalSchedule)

---

### Examples
> Example 1

```PowerShell
Set-NcJobIntervalSchedule interval1 -Days 0 -Hours 6 -Minutes 0 -Seconds 0
Set interval schedule 'interval1' to run every 6 hours.

NcController                        : cerebus
JobScheduleDescription              : Every 6h
JobScheduleIntervalDays             : 0
JobScheduleIntervalHours            : 6
JobScheduleIntervalMinutes          : 0
JobScheduleIntervalSeconds          : 0
JobScheduleName                     : interval1
JobScheduleIntervalDaysSpecified    : True
JobScheduleIntervalHoursSpecified   : True
JobScheduleIntervalMinutesSpecified : True
JobScheduleIntervalSecondsSpecified : True
Days                                : 0
Hours                               : 6
Minutes                             : 0
Seconds                             : 0

```

---

### Parameters
#### **Name**
The name of the interval job schedule to modify.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|JobScheduleName|

#### **Days**
The number of days between jobs.

|Type     |Required|Position|PipelineInput        |Aliases                |
|---------|--------|--------|---------------------|-----------------------|
|`[Int64]`|false   |2       |true (ByPropertyName)|JobScheduleIntervalDays|

#### **Hours**
The number of hours between jobs.

|Type     |Required|Position|PipelineInput        |Aliases                 |
|---------|--------|--------|---------------------|------------------------|
|`[Int64]`|false   |3       |true (ByPropertyName)|JobScheduleIntervalHours|

#### **Minutes**
The number of minutes between jobs.

|Type     |Required|Position|PipelineInput        |Aliases                   |
|---------|--------|--------|---------------------|--------------------------|
|`[Int64]`|false   |4       |true (ByPropertyName)|JobScheduleIntervalMinutes|

#### **Seconds**
The number of seconds between jobs.

|Type     |Required|Position|PipelineInput        |Aliases                   |
|---------|--------|--------|---------------------|--------------------------|
|`[Int64]`|false   |5       |true (ByPropertyName)|JobScheduleIntervalSeconds|

#### **JobScheduleCluster**
The cluster owner of the job schedule. Defaults to the local cluster. In a Metrocluster configuration, the partner cluster can be specified.
This parameter is available in ONTAP 9.3 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Interval**
Specifies Interval. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **VserverContext**
Specifies Vserver. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
* DataONTAP.C.Types.Job.JobScheduleIntervalInfo

---

### Notes
Category: job
API: job-schedule-interval-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcJobIntervalSchedule [-Name] <String> [[-Days] <Int64>] [[-Hours] <Int64>] [[-Minutes] <Int64>] [[-Seconds] <Int64>] [-JobScheduleCluster <String>] [-Interval <String>] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
