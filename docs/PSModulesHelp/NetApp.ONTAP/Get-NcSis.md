Get-NcSis
---------

### Synopsis
Get the SIS (dedupe) status for one or more volumes.

---

### Description

Get the SIS (dedupe) status for one or more volumes.

---

### Related Links
* [Set-NcSis](Set-NcSis)

---

### Examples
> Example 1

Get-NcSis *Datastore*
Display dedupe status on all volumes with names matching "*Datastore*".

Path                     State   Status ScheduleOrPolicy Progress
----                     -----   ------ ---------------- --------
/vol/cModeDatastore      enabled idle   sun-sat@0        Idle for 00:47:23
/vol/cmodeDatastore1     enabled idle   sun-sat@0        Idle for 00:47:22
/vol/cModeDatastore2     enabled idle   sun-sat@0        Idle for 00:47:21
/vol/cModeDatastorezz    enabled idle   sun-sat@0        Idle for 00:47:19

> Example 2

Get-NcSis -Enabled $false -Vserver costea01
Get the SIS status of all volumes on vserver 'costea01' having dedupe disabled.

Path                     State    Status ScheduleOrPolicy Progress
----                     -----    ------ ---------------- --------
/vol/cModeDatastore      disabled idle   sun-sat@0        Idle for 00:48:50
/vol/cmodeDatastore1     disabled idle   sun-sat@0        Idle for 00:48:49
/vol/cModeDatastore2     disabled idle   sun-sat@0        Idle for 00:48:48
/vol/cModeDatastorezz    disabled idle   sun-sat@0        Idle for 00:48:46
/vol/pleaseWorkDatastore disabled idle   sun-sat@0        Idle for 00:48:40

> Example 3

$q = Get-NcSis -Template
$q.LastOpState = "!Success"
Get-NcSis -Query $q | Select Path, LastOpState, LastOpError
Using an advanced query, list the volumes where the last dedupe operation did not succeed.

Path          LastOpState LastOpError
----          ----------- -----------
/vol/testvol2 Failure     Operation was stopped

---

### Parameters
#### **Name**
The volume(s) to query for SIS status.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Path<br/>Volume|

#### **Vserver**
Restrict results to the specified vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Enabled**
Restrict results to the specified state.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a SisStatusInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSis -Template" to get the initially empty SisStatusInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[SisStatusInfo]`|false   |named   |false        |

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
Specify to get an empty SisStatusInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SisStatusInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSis -Template" to get the initially empty SisStatusInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[SisStatusInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Sis.SisStatusInfo

---

### Notes
Category: sis
API: sis-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSis [[-Name] <String[]>] [-Vserver <String[]>] [-Enabled <Boolean>] [-VserverContext <String>] [-Attributes <SisStatusInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSis [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSis [-VserverContext <String>] -Query <SisStatusInfo> [-Attributes <SisStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
