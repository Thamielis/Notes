Get-NcJobIntervalSchedule
-------------------------

### Synopsis
Get multiple interval job schedule entries.

---

### Description

Get multiple interval job schedule entries.

---

### Related Links
* [Get-NcJobSchedule](Get-NcJobSchedule)

* [Add-NcJobIntervalSchedule](Add-NcJobIntervalSchedule)

---

### Examples
> Example 1

```PowerShell
Get-NcJobIntervalSchedule
List all interval job schedules.

Days                                : 0
Hours                               : 1
Minutes                             : 30
Seconds                             : 0
NcController                        : cerebus
JobScheduleDescription              : Every 1h30m
JobScheduleIntervalDays             : 0
JobScheduleIntervalHours            : 1
JobScheduleIntervalMinutes          : 30
JobScheduleIntervalSeconds          : 0
JobScheduleName                     : 90minutes
JobScheduleIntervalDaysSpecified    : True
JobScheduleIntervalHoursSpecified   : True
JobScheduleIntervalMinutesSpecified : True
JobScheduleIntervalSecondsSpecified : True

```

---

### Parameters
#### **Name**
The name of one or more interval job schedules to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|JobScheduleName|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a JobScheduleIntervalInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcJobIntervalSchedule -Template" to get the initially empty JobScheduleIntervalInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[JobScheduleIntervalInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty JobScheduleIntervalInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a JobScheduleIntervalInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcJobIntervalSchedule -Template" to get the initially empty JobScheduleIntervalInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[JobScheduleIntervalInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Job.JobScheduleIntervalInfo

---

### Notes
Category: job
API: job-schedule-interval-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcJobIntervalSchedule [[-Name] <String[]>] [-VserverContext <String>] [-Attributes <JobScheduleIntervalInfo>] [-JobScheduleCluster <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJobIntervalSchedule [-VserverContext <String>] -Template [-Fill] [-JobScheduleCluster <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJobIntervalSchedule [-VserverContext <String>] -Query <JobScheduleIntervalInfo> [-Attributes <JobScheduleIntervalInfo>] [-JobScheduleCluster <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
