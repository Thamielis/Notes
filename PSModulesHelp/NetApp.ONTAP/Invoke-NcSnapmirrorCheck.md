Invoke-NcSnapmirrorCheck
------------------------

### Synopsis
Starts an operation to compare the contents of a snapshot between the source volume and destination volume.

---

### Description

Starts an operation to compare the contents of a snapshot between the source volume and destination volume.  You must specify the destination endpoint. A job will be spawned to operate on the SnapMirror and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

---

### Examples
> Example 1

Invoke-NcSnapmirrorCheck //costea02/unitTestLunsSM | Get-NcJob
Start a check operation on the SnapMirror with destination '//costea02/unitTestLunsSM' and display the job.

JobId JobName          JobPriority JobState JobVserver JobCompletion
----- -------          ----------- -------- ---------- -------------
1632  SnapMirror check exclusive   running  VxeRubble

---

### Parameters
#### **DestinationCluster**
Specifies the destination cluster of the SnapMirror relationship.  The destination vserver and destination volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DestinationVserver**
Specifies the destination vserver of the SnapMirror relationship.  The destination cluster and destination volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **DestinationVolume**
Specifies the destination volume of the SnapMirror relationship.  The destination cluster and destination vserver must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **SourceCluster**
Specifies the source cluster of the SnapMirror relationship.  The source vserver and source volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SourceVserver**
Specifies the source vserver of the SnapMirror relationship.  The source cluster and source volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SourceVolume**
Specifies the source volume of the SnapMirror relationship.  The source cluster and source vserver must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TargetSnapshot**
Specifies the snapshot copy on the destination endpoint to check.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Passthru**
Specify to output the SnapMirror object rather than the job ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SourceSnapshot**
The source Snapshot copy to be used for a file-level check.
If specified, TargetSnapshot and CheckFileListSource must also be specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CheckFileListSource**
The files or LUNs to be compared. The list can contain specifications for up to 8 files or LUNs.
Source path is required and is the path of the file from the root of the source Snapshot copy, e.g. /dira/file1 or /lun1. The source path does not include the Snapshot name nor the source volume name.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **CheckFileListDestination**
The path to each file to be compared in the target snapshot on the destination volume is the same as the path specified by CheckFileListSource unless CheckFileListDestination is specified.
Destination path is the path of the file from the root of the source Snapshot copy, e.g. /dira/file1 or /lun1.
The first entry in CheckFileListDestination corresponds to the first entry in CheckFileListSource.  The second entry in CheckFileListDestination corresponds to the second entry in CheckFileListSource, and so on.  If a CheckFileListSource entry does not have a corresponding CheckFileListDestination entry, the CheckFileListSource path is used as the destination.
The number of entries in CheckFileListDestination cannot exceed the length of CheckFileListSource.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **MaxTransferRate**
The upper bound at which data is transferred. The default is unlimited (0) which permits the SnapMirror relationship to fully utilize the available network bandwidth. The max-transfer-rate option does not affect load-sharing transfers and transfers for other relationships with relationship control plane of 'v1' confined to a single cluster.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SkipSeCheck**
Specifies to skip the check of the storage efficiency data on extended data protection relationships and file-level transfers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Destination**
Specifies the destination endpoint of the SnapMirror relationship in the format: [cluster:]//vserver/volume.  This format may change in the future.  When specifying a destination endpoint, you must use either the destination location, or the destination cluster, destination vserver, and destination volume.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|DestinationLocation|

#### **Source**
Specifies the source endpoint of the SnapMirror relationship in the format: [cluster:]//vserver/volume.  This format may change in the future.  When specifying a source endpoint, you must use either the source location, or the source cluster, source vserver, and source volume.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |2       |true (ByPropertyName)|SourceLocation|

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: snapmirror
API: snapmirror-check
Family: cluster,vserver

---

### Syntax
```PowerShell
Invoke-NcSnapmirrorCheck [-DestinationCluster <String>] -DestinationVserver <String> -DestinationVolume <String> [-SourceCluster <String>] [-SourceVserver <String>] [-SourceVolume <String>] 
```
```PowerShell
[-TargetSnapshot <String>] [-Passthru] [-SourceSnapshot <String>] [-CheckFileListSource <String[]>] [-CheckFileListDestination <String[]>] [-MaxTransferRate <String>] [-SkipSeCheck] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSnapmirrorCheck [-Destination] <String> [[-Source] <String>] [-TargetSnapshot <String>] [-Passthru] [-SourceSnapshot <String>] [-CheckFileListSource <String[]>] 
```
```PowerShell
[-CheckFileListDestination <String[]>] [-MaxTransferRate <String>] [-SkipSeCheck] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
