Invoke-NcSnapmirrorResync
-------------------------

### Synopsis
Re-establishes a mirroring relationship between a source volume and a destination volume.

---

### Description

Re-establishes a mirroring relationship between a source volume and a destination volume, typically in the following cases:

* The destination mirror is broken (that is, the destination volume is a read-write volume and no longer a data protection mirror). After the cmdlet completes, the destination volume is made a data protection mirror and the mirror can be manually updated or scheduled for updates.

* An update operation failed because the required common Snapshot copy was deleted on the source volume.

Attention: Invoke-NcSnapmirrorResync can cause data loss on the destination volume because the cmdlet can remove the exported snapshot copy on the destination volume.  The cmdlet operates by finding the most recent common snapshot copy between the source and destination volumes, removes snapshot copies on the destination volume that are newer than the common snapshot copy, and makes the common snapshot copy the temporary exported snapshot copy on the destination volume.  The cmdlet next takes a snapshot copy of the source volume to capture the current image and transfers snapshot copies that are newer than the common snapshot copy from the source volume to the destination volume.  The cmdlet finally makes the newest snapshot copy on the destination volume the new exported snapshot copy.  The cmdlet fails if the destination volume does not have a snapshot copy in common with the source volume.  A job is spawned to operate on the SnapMirror relationship and the job id is returned. The progress of the job can be tracked using the job cmdlets.

The cmdlet must be issued on the destination cluster.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

---

### Examples
> Example 1

Invoke-NcSnapmirrorResync VxeRubble://costea02/unitTestLunsSM
Re-sync a broken SnapMirror relationship with destination 'VxeRubble://costea02/unitTestLunsSM.

NcController : VxeRubble
ErrorCode    :
ErrorMessage :
JobId        : 1630
JobVserver   :
Status       : in_progress

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

#### **MaxTransferRate**
Specifies the upper bound, in bytes per second, at which data is transferred between clusters.  The default is unlimited (0) which permits the SnapMirror relationship to fully utilize the available network bandwidth.  This option does not affect load-sharing mirrors and other SnapMirror relationships confined to a single cluster.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **SourceSnapshot**
The snapshot on the source volume to use for the transfer.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Preserve**
By default, all snapshots on the destination that are newer than the latest common snapshot will be deleted.  If specified, newer snapshots are retained.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Passthru**
Specify to output the SnapMirror object rather than the job ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **QuickResync**
If specified, the resync time is reduced because the resync does not incur storage efficiency overhead before the transfer of new data.
Specifying this parameter is recommended if the source of the resync does not have volume efficiency enabled or if reducing resync time is more important than preserving all possible storage efficiency. When this parameter is specified, resync does not preserve the storage efficiency of the new data with existing data over the wire and on the destination.
This parameter is not supported for data protection and load-sharing relationships.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IsAutoExpandEnabled**
Specifies if the FlexGroup SnapMirror relationship and its destination FlexGroup should be auto-expanded if the source FlexGroup is expanded. This parameter is supported only for FlexGroup SnapMirror relationships. If the initialize is creating a new SnapMirror relationship, the default value is true. If it is not creating a new relationship, if a value is specified, it must match the current value for the existing relationship. If the parameter is not specified, the existing value will be retained.
This parameter is only supported in ONTAP 9.3. or later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsAdaptive**
Specifies if the SnapMirror relationship is adaptive. If the SnapMirror relationship is adaptive, updates on the relationship might, and often will be triggered based on source volume changes. This parameter is supported only for FlexVol SnapMirror relationships between Data ONTAP endpoints.
This parameter is available in ONTAP 9.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **IsCatalogEnabled**

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
API: snapmirror-resync
Family: cluster,vserver

---

### Syntax
```PowerShell
Invoke-NcSnapmirrorResync [-DestinationCluster <String>] -DestinationVserver <String> -DestinationVolume <String> [-SourceCluster <String>] [-SourceVserver <String>] [-SourceVolume <String>] 
```
```PowerShell
[-MaxTransferRate <Int64>] [-SourceSnapshot <String>] [-Preserve] [-Passthru] [-QuickResync] [-IsAutoExpandEnabled <Boolean>] [-IsAdaptive <Boolean>] [-IsCatalogEnabled <Boolean>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSnapmirrorResync [-Destination] <String> [[-Source] <String>] [-MaxTransferRate <Int64>] [-SourceSnapshot <String>] [-Preserve] [-Passthru] [-QuickResync] [-IsAutoExpandEnabled 
```
```PowerShell
<Boolean>] [-IsAdaptive <Boolean>] [-IsCatalogEnabled <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
