Get-NcJob
---------

### Synopsis
Get multiple job records.

---

### Description

Get multiple job records.

---

### Related Links
* [Stop-NcJob](Stop-NcJob)

* [Update-NcJob](Update-NcJob)

---

### Examples
> Example 1

```PowerShell
Get-NcJob
List all jobs

NcController             : cerebus
IsRestarted              : False
JobAffinity              : cluster
JobCategory              : Certificate Expiry
JobCompletion            : DONE
JobDescription           : Certificate Expiry Check
JobDropdeadTime          :
JobDropdeadTimeDT        :
JobEndTime               : 1312959600
JobEndTimeDT             : 8/10/2011 7:00:00 AM
JobId                    : 1
JobName                  : Certificate Expiry Check
JobNode                  :
JobPriority              : low
JobProcess               : mgwd
JobProgress              : Unclaimed
JobQueueTime             : 1312959600
JobQueueTimeDT           : 8/10/2011 7:00:00 AM
JobSchedule              : @0:00
JobStartTime             : 1312959600
JobStartTimeDT           : 8/10/2011 7:00:00 AM
JobState                 : queued
JobStatusCode            : 0
JobType                  : Security Certificate
JobUsername              :
JobUuid                  : fed623aa-7cb6-11e0-a998-123478563412
JobVserver               : Cerebus
IsRestartedSpecified     : True
JobDropdeadTimeSpecified : False
JobEndTimeSpecified      : True
JobIdSpecified           : True
JobQueueTimeSpecified    : True
JobStartTimeSpecified    : True
JobStatusCodeSpecified   : True

NcController             : cerebus
IsRestarted              : False
JobAffinity              : cluster
JobCategory              : License
JobCompletion            : Succeeded
JobDescription           : License Checking
JobDropdeadTime          :
JobDropdeadTimeDT        :
JobEndTime               : 1312959600
JobEndTimeDT             : 8/10/2011 7:00:00 AM
JobId                    : 2
JobName                  : Licensing
JobNode                  :
JobPriority              : low
JobProcess               : mgwd
JobProgress              : Unclaimed
JobQueueTime             : 1312959600
JobQueueTimeDT           : 8/10/2011 7:00:00 AM
JobSchedule              : @0:00
JobStartTime             : 1312959600
JobStartTimeDT           : 8/10/2011 7:00:00 AM
JobState                 : queued
JobStatusCode            : 0
JobType                  : Cluster Licenses
JobUsername              :
JobUuid                  : ff3bd8a0-7cb6-11e0-a998-123478563412
JobVserver               : Cerebus
IsRestartedSpecified     : True
JobDropdeadTimeSpecified : False
JobEndTimeSpecified      : True
JobIdSpecified           : True
JobQueueTimeSpecified    : True
JobStartTimeSpecified    : True
JobStatusCodeSpecified   : True

```
> Example 2

```PowerShell
Get-NcJob -Completed
List completed jobs.

NcController             : cerebus
IsRestarted              : False
JobAffinity              : cluster
JobCategory              : VOPL
JobCompletion            :
JobDescription           : Vol Reaper Job
JobDropdeadTime          :
JobDropdeadTimeDT        :
JobEndTime               : 1312981177
JobEndTimeDT             : 8/10/2011 12:59:37 PM
JobId                    : 6
JobName                  : Vol Reaper
JobNode                  :
JobPriority              : high
JobProcess               : mgwd
JobProgress              :
JobQueueTime             : 1312981177
JobQueueTimeDT           : 8/10/2011 12:59:37 PM
JobSchedule              : Every 5m
JobStartTime             : 1312981177
JobStartTimeDT           : 8/10/2011 12:59:37 PM
JobState                 : queued
JobStatusCode            : 0
JobType                  : Vol Reaper
JobUsername              :
JobUuid                  : b0557e8c-7cb7-11e0-a998-123478563412
JobVserver               : Cerebus
IsRestartedSpecified     : True
JobDropdeadTimeSpecified : False
JobEndTimeSpecified      : True
JobIdSpecified           : True
JobQueueTimeSpecified    : True
JobStartTimeSpecified    : True
JobStatusCodeSpecified   : True

```
> Example 3

```PowerShell
$j = Get-NcJob -Template
$j.JobPriority = "high"
Get-NcJob -Completed -Query $j
List completed jobs that ran at high priority.

NcController             : cerebus
IsRestarted              : False
JobAffinity              : cluster
JobCategory              : VOPL
JobCompletion            :
JobDescription           : Vol Reaper Job
JobDropdeadTime          :
JobDropdeadTimeDT        :
JobEndTime               : 1312981478
JobEndTimeDT             : 8/10/2011 1:04:38 PM
JobId                    : 6
JobName                  : Vol Reaper
JobNode                  :
JobPriority              : high
JobProcess               : mgwd
JobProgress              :
JobQueueTime             : 1312981478
JobQueueTimeDT           : 8/10/2011 1:04:38 PM
JobSchedule              : Every 5m
JobStartTime             : 1312981478
JobStartTimeDT           : 8/10/2011 1:04:38 PM
JobState                 : queued
JobStatusCode            : 0
JobType                  : Vol Reaper
JobUsername              :
JobUuid                  : b0557e8c-7cb7-11e0-a998-123478563412
JobVserver               : Cerebus
IsRestartedSpecified     : True
JobDropdeadTimeSpecified : False
JobEndTimeSpecified      : True
JobIdSpecified           : True
JobQueueTimeSpecified    : True
JobStartTimeSpecified    : True
JobStatusCodeSpecified   : True

```

---

### Parameters
#### **Id**
The ID of one or more jobs to get.  Omit to get all jobs. This parameter is supported with Ontapi only.

|Type          |Required|Position|PipelineInput        |Aliases|
|--------------|--------|--------|---------------------|-------|
|`[Decimal][]]`|false   |1       |true (ByPropertyName)|JobId  |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a JobInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcJob -Template" to get the initially empty JobInfo object.  If not specified, all data is returned for each object.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[JobInfo]`|false   |named   |false        |

#### **Completed**
Limit results to completed jobs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Uuid**
Uuid. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |true         |

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
Specify to get an empty JobInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a JobInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcJob -Template" to get the initially empty JobInfo object.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[JobInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Job.JobInfo

---

### Notes
Category: job
API: job-get-iter, job-completed-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcJob [[-Id] <Decimal][]>] [-VserverContext <String>] [-Attributes <JobInfo>] [-Completed] [-Uuid <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJob [-VserverContext <String>] -Template [-Fill] [-Uuid <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJob [-VserverContext <String>] [-Uuid <String>] -Query <JobInfo> [-Attributes <JobInfo>] [-Completed] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
