Invoke-NcSnapmirrorLsUpdate
---------------------------

### Synopsis
Updates destination volumes of a set of load-sharing mirrors.

---

### Description

Updates destination volumes of a set of load-sharing mirrors.  The cmdlet makes destination volumes in the group of load-sharing mirrors up-to-date mirrors of the source volume.  Separate SnapMirror transfers are performed from the source volume to each of the up-to-date destination volumes in the set of load-sharing mirrors.  Load-sharing mirrors that lag behind the up-to-date destination volumes might not be updated by the cmdlet.  Use Invoke-NcSnapmirrorUpdate to update a lagging load-sharing mirror.  A job will be spawned to operate on the snapmirror and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

You must specify the source endpoint when using Invoke-NcSnapmirrorLsInitialize.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

---

### Examples
> Example 1

Invoke-NcSnapmirrorLsUpdate VxeRubble://costea01/vol1 | Get-NcJob
Update the set of load-sharing mirrors with source '//costea01/vol1' and display the job.

JobId JobName                     JobPriority JobState JobVserver JobCompletion
----- -------                     ----------- -------- ---------- -------------
1593  SnapMirror Loadshare update exclusive   running  VxeRubble

---

### Parameters
#### **SourceCluster**
Specifies the source cluster of the SnapMirror relationship.  The source vserver and source volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SourceVserver**
Specifies the source vserver of the SnapMirror relationship.  The source cluster and source volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **SourceVolume**
Specifies the source volume of the SnapMirror relationship.  The source cluster and source vserver must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Passthru**
Specify to output the SnapMirror object rather than the job ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Source**
Specifies the source endpoint of the SnapMirror relationship in the format: [cluster:]//vserver/volume.  This format may change in the future.  When specifying a source endpoint, you must use either the source location, or the source cluster, source vserver, and source volume.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|true    |1       |true (ByPropertyName)|SourceLocation|

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: snapmirror
API: snapmirror-update-ls-set
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcSnapmirrorLsUpdate [-SourceCluster <String>] -SourceVserver <String> -SourceVolume <String> [-Passthru] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSnapmirrorLsUpdate [-Source] <String> [-Passthru] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
