Get-NcJobHistory
----------------

### Synopsis
Get multiple job history records.

---

### Description

Get multiple job history records.

---

### Related Links
* [Get-NcJob](Get-NcJob)

---

### Examples
> Example 1

Get-NcJobHistory -Count 10
Get the last 10 jobs.

JobId JobName    JobVserver JobEventType JobEndTimeDT
----- -------    ---------- ------------ ------------
6     Vol Reaper Cerebus    succeeded    8/10/2011 2:04:59 PM
6     Vol Reaper Cerebus    running      8/10/2011 1:59:58 PM
6     Vol Reaper Cerebus    succeeded    8/10/2011 1:59:58 PM
6     Vol Reaper Cerebus    running      8/10/2011 1:54:57 PM
6     Vol Reaper Cerebus    succeeded    8/10/2011 1:54:57 PM
6     Vol Reaper Cerebus    running      8/10/2011 1:49:56 PM
6     Vol Reaper Cerebus    succeeded    8/10/2011 1:49:56 PM
6     Vol Reaper Cerebus    running      8/10/2011 1:44:55 PM
6     Vol Reaper Cerebus    succeeded    8/10/2011 1:44:55 PM
6     Vol Reaper Cerebus    running      8/10/2011 1:39:54 PM

---

### Parameters
#### **Id**
The ID of one or more jobs to get.  Omit to get all jobs.

|Type          |Required|Position|PipelineInput        |Aliases|
|--------------|--------|--------|---------------------|-------|
|`[Decimal][]]`|false   |1       |true (ByPropertyName)|JobId  |

#### **Count**
The maximum number of records to get.  The default is 100.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a JobHistoryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcJobHistory -Template" to get the initially empty JobHistoryInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[JobHistoryInfo]`|false   |named   |false        |

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
Specify to get an empty JobHistoryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide a JobHistoryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcJobHistory -Template" to get the initially empty JobHistoryInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[JobHistoryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Job.JobHistoryInfo

---

### Notes
Category: job
API: job-history-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcJobHistory [[-Id] <Decimal][]>] [-Count <Int64>] [-VserverContext <String>] [-Attributes <JobHistoryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJobHistory [-Count <Int64>] [-VserverContext <String>] -Template [-Fill] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcJobHistory [-Count <Int64>] [-VserverContext <String>] -Query <JobHistoryInfo> [-Attributes <JobHistoryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
