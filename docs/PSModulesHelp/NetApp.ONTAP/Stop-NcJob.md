Stop-NcJob
----------

### Synopsis
Stop a job.

---

### Description

Stop a job.  A job must be of a type that has job-type-is-quittable set to true before it may be stopped.  Stop-NcJob attempts to stop a job that's currently running.  If the job allows itself to stop it completes its current run.  If the job has a recurring schedule it will transition to the Queued state; otherwise it will transition into either the Success or Failure state.

---

### Related Links
* [Get-NcJob](Get-NcJob)

* [Update-NcJob](Update-NcJob)

---

### Examples
> Example 1

```PowerShell
Stop-NcJob -Id 61 -VserverContext tesla
Stop the job.

JobId                    : 61
NcController             : 192.168.182.119
IsRestarted              : False
JobAffinity              : cluster
JobCategory              : VOPL
JobCompletion            :
JobDescription           : Move "luns" in Vserver "joule" to aggregate "aggr1"
JobDropdeadTime          :
JobDropdeadTimeDT        :
JobEndTime               :
JobEndTimeDT             :
JobName                  : Volume Move
JobNode                  : tesla-01
JobPriority              : high
JobProcess               : mgwd
JobProgress              : Transferring data: 26.75MB sent.
JobQueueTime             : 1342190438
JobQueueTimeDT           : 7/13/2012 2:40:38 PM
JobSchedule              : @now
JobStartTime             : 1342190439
JobStartTimeDT           : 7/13/2012 2:40:39 PM
JobState                 : running
JobStatusCode            : 0
JobType                  : MOVE
JobUsername              : admin
JobUuid                  : b6ceddc2-ccf8-11e1-b8ba-123478563412
JobVserver               : tesla
IsRestartedSpecified     : True
JobDropdeadTimeSpecified : False
JobEndTimeSpecified      : False
JobIdSpecified           : True
JobQueueTimeSpecified    : True
JobStartTimeSpecified    : True
JobStatusCodeSpecified   : True

```

---

### Parameters
#### **Id**
The ID of the job to stop.

|Type       |Required|Position|PipelineInput        |Aliases|
|-----------|--------|--------|---------------------|-------|
|`[Decimal]`|true    |1       |true (ByPropertyName)|JobId  |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |named   |true (ByPropertyName)|VS<br/>JobVserver|

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
* DataONTAP.C.Types.Job.JobInfo

---

### Notes
Category: job
API: job-stop
Family: vserver

---

### Syntax
```PowerShell
Stop-NcJob [-Id] <Decimal> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
