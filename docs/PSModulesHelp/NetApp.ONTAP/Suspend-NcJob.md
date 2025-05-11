Suspend-NcJob
-------------

### Synopsis
Pause a job.

---

### Description

Pause a job.  A job must be of a type that has job-type-is-pausible set to true before it may be paused.  Once notified of a pause request, a job should stop performing work until it is subsequently resumed.

If -Soft is specified:

Soft pause a job.  Indicates to the job that a soft pause has been initiated.  It is up to the job to do what it needs to do for a soft pause.  As a result of this command the job may request to be moved into the runnnable queue to perform further processing of the soft pause.

---

### Related Links
* [Resume-NcJob](Resume-NcJob)

* [Stop-NcJob](Stop-NcJob)

* [Update-NcJob](Update-NcJob)

---

### Parameters
#### **Id**
The ID of the job to pause. This parameter is supported with Ontapi only.

|Type       |Required|Position|PipelineInput        |Aliases|
|-----------|--------|--------|---------------------|-------|
|`[Decimal]`|true    |1       |true (ByPropertyName)|JobId  |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |named   |true (ByPropertyName)|VS<br/>JobVserver|

#### **Soft**
Specify to effect a "soft" pause.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Uuid**
The Uuid of the job to resume. This parameter is supported with Rest only.

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Job.JobInfo

---

### Notes
Category: job
API: job-resume
Family: vserver

---

### Syntax
```PowerShell
Suspend-NcJob [-Id] <Decimal> [-VserverContext <String>] [-Soft] [-Uuid <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
