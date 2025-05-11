Get-NcJobSchedule
-----------------

### Synopsis
Get multiple job schedule entries.

---

### Description

Get multiple job schedule entries.

---

### Related Links
* [Get-NcJobCronSchedule](Get-NcJobCronSchedule)

* [Get-NcJobIntervalSchedule](Get-NcJobIntervalSchedule)

---

### Examples
> Example 1

Get-NcJobSchedule
Get all job schedules.

NcController           : cerebus
JobScheduleDescription : @:00,:05,:10,:15,:20,:25,:30,:35,:40,:45,:50,:55
JobScheduleName        : 5min
JobScheduleType        : cron

NcController           : cerebus
JobScheduleDescription : @2:15,10:15,18:15
JobScheduleName        : 8hour
JobScheduleType        : cron

NcController           : cerebus
JobScheduleDescription : @2:00
JobScheduleName        : avUpdateSchedule
JobScheduleType        : cron

NcController           : cerebus
JobScheduleDescription : @0:10
JobScheduleName        : daily
JobScheduleType        : cron

NcController           : cerebus
JobScheduleDescription : @:05
JobScheduleName        : hourly
JobScheduleType        : cron

NcController           : cerebus
JobScheduleDescription : Every 1d2h3m4s
JobScheduleName        : interval1
JobScheduleType        : interval

NcController           : cerebus
JobScheduleDescription : Sun@0:15
JobScheduleName        : weekly
JobScheduleType        : cron

---

### Parameters
#### **Name**
The name of one or more job schedules to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|JobScheduleName|

#### **Type**
The type of one or more job schedules to get.  Possible values: cron, interval, builtin, unknown.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|JobScheduleType|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a JobScheduleInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcJobSchedule -Template" to get the initially empty JobScheduleInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[JobScheduleInfo]`|false   |named   |false        |

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
Specify to get an empty JobScheduleInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a JobScheduleInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcJobSchedule -Template" to get the initially empty JobScheduleInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[JobScheduleInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Job.JobScheduleInfo

---

### Notes
Category: job
API: job-schedule-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcJobSchedule [[-Name] <String[]>] [-Type <String[]>] [-VserverContext <String>] [-Attributes <JobScheduleInfo>] [-JobScheduleCluster <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJobSchedule [-VserverContext <String>] -Template [-Fill] [-JobScheduleCluster <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJobSchedule [-VserverContext <String>] -Query <JobScheduleInfo> [-Attributes <JobScheduleInfo>] [-JobScheduleCluster <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
