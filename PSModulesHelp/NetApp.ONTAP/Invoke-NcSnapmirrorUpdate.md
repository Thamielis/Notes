Invoke-NcSnapmirrorUpdate
-------------------------

### Synopsis
Updates the destination endpoint of the SnapMirror relationship.

---

### Description

Updates the destination endpoint of the SnapMirror relationship.  The cmdlet makes the destination volume an up-to-date mirror of the source volume.  The update is asynchronously handled, and there is no guarantee that it will succeed.  A job is spawned to operate on the SnapMirror relationship and the job id is returned. The progress of the job can be tracked using the job cmdlets.

The cmdlet must be used from the destination cluster.  If the destination volume is empty, the cmdlet performs a baseline transfer, that is, it transfers all of the snapshot copies on the source volume to the destination volume.  During a baseline transfer, the first snapshot copy transferred becomes the temporary exported snapshot copy on the destination volume.  The exported snapshot copy is the view to which clients are redirected on the destination volume while succeeding snapshot copies are transferred.  If the destination volume is not empty, the cmdlet performs an incremental transfer.  During an incremental transfer, Data ONTAP takes a snapshot copy on the source volume to capture the current image of the source volume, finds the most recent common snapshot copy between the source and destination volumes, and incrementally transfers snapshot copies that are newer than the common snapshot copy to the destination volume.  After the cmdlet successfully completes, the last snapshot copy transferred is made the new exported snapshot copy on the destination volume.  If the operation does not finish successfully, due to a network failure or because Invoke-NcSnapmirrorAbort was issued for example, a restart checkpoint might be recorded on the destination volume.  If a restart checkpoint is recorded, the next update restarts and continues the transfer from the restart checkpoint.

You can use the cmdlet to update a specific load-sharing mirror that lags behind up-to-date destination volumes in the set of load-sharing mirrors.  An update to the lagging load-sharing mirror should bring it up to date with the other up-to-date destination volumes in the set of load-sharing mirrors.  Note: You might have to run the cmdlet more than once if the command does not finish before the next scheduled update of the set of load-sharing mirrors.

You must specify the destination endpoint when using Invoke-NcSnapmirrorUpdate.

The cmdlet must be used from the destination cluster.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

---

### Examples
> Example 1

Invoke-NcSnapmirrorUpdate //costea02/unitTestLunsSM
Update the SnapMirror with destination '//costea02/unitTestLunsSM'.

SourceLocation                    DestinationLocation                 Status       MirrorState
--------------                    -------------------                 ------       -----------
VxeRubble://costea01/unitTestLuns VxeRubble://costea02/unitTestLunsSM transferring snapmirrored

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

#### **SourceSnapshot**
The Snapshot copy on the source to use as the basis for the update.
For data protection mirror relationships, Data ONTAP does not create a new Snapshot copy. It will use the specified Snapshot copy as if it were the most recent one; that is, all copies between the most recent common one and the specified one are transferred, but no copies newer than the specified one are transferred.
For vault relationships, Data ONTAP transfers the specified Snapshot copy instead of the ones that match its policy's rules.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TransferPriority**
Specifies the priority at which the transfer runs.  Possible values are: "normal", and "low".

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **MaxTransferRate**
Specifies the upper bound, in bytes per second, at which data is transferred between clusters.  The default is unlimited (0) which permits the SnapMirror relationship to fully utilize the available network bandwidth.  This option does not affect load-sharing mirrors and other SnapMirror relationships confined to a single cluster.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **EnableStorageEfficiency**
If specified, enables storage efficiency on a vault relationship which is not currently storage efficient. Storage efficient in this context refers to both over-the-wire efficiency and how the data is written to the destination volume.
The transfer fails if it cannot be done storage efficiently. If the transfer succeeds, storage efficiency will be enabled on this vault relationship and all future transfers will continue to be storage efficient for as long as possible, but will not fail should those transfers not be storage efficient.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: snapmirror-update
Family: cluster,vserver

---

### Syntax
```PowerShell
Invoke-NcSnapmirrorUpdate [-DestinationCluster <String>] -DestinationVserver <String> -DestinationVolume <String> [-SourceCluster <String>] [-SourceVserver <String>] [-SourceVolume <String>] 
```
```PowerShell
[-SourceSnapshot <String>] [-TransferPriority <String>] [-MaxTransferRate <Int64>] [-EnableStorageEfficiency] [-Passthru] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSnapmirrorUpdate [-Destination] <String> [[-Source] <String>] [-SourceSnapshot <String>] [-TransferPriority <String>] [-MaxTransferRate <Int64>] [-EnableStorageEfficiency] 
```
```PowerShell
[-Passthru] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
