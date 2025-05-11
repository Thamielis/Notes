Remove-NcSnapmirror
-------------------

### Synopsis
Removes the SnapMirror relationship of a source volume and a destination volume.

---

### Description

Removes the SnapMirror relationship of a source volume and a destination volume.  The volumes are not destroyed and snapshot copies on the volumes are not removed.  The cmdlet fails if a SnapMirror transfer for the SnapMirror relationship is in progress.

A set of load-sharing mirrors might contain multiple destination volumes, each destination volume having a separate SnapMirror relationship with the common source volume.  When used on one of the SnapMirror relationships from the set of load-sharing mirrors, the cmdlet deletes the specified SnapMirror relationship from the set of load-sharing mirrors.  The cmdlet preserves the read-write or read-only attributes of the volumes of a SnapMirror relationship after the relationship is deleted.  Therefore, a read-write volume that was the source of a SnapMirror relationship retains its read-write attributes, and a data protection volume or a load-sharing volume that was a destination of a SnapMirror relationship retains its read-only attributes.

Note: When a SnapMirror relationship from a set of load-sharing mirrors is deleted, the destination volume becomes a data protection volume and retains the read-only attributes of a data protection volume.

You can use this cmdlet from the source or from the destination cluster.  When used from the destination cluster, the SnapMirror relationship information on the source and destination clusters is deleted.  When used from the source cluster, only the SnapMirror relationship information on the source cluster is deleted.

You must specify the destination endpoint when using Remove-NcSnapmirror.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [New-NcSnapmirror](New-NcSnapmirror)

* [Get-NcSnapmirror](Get-NcSnapmirror)

* [Set-NcSnapmirror](Set-NcSnapmirror)

---

### Examples
> Example 1

```PowerShell
Remove-NcSnapmirror VxeRubble://costea02/unitTestLunsSM
Destroy the SnapMirror relationship with destination 'VxeRubble://costea02/unitTestLunsSM'.
```

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

#### **DestinationOnly**
Deletes a relationship on the source only. This parameter is supported with REST only

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |named   |true (ByPropertyName)|

#### **SourceOnly**
Deletes a relationship on the source only. This parameter is supported with REST only

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |named   |true (ByPropertyName)|

#### **DestinationOnly**
Deletes a relationship on the destination only. This parameter is supported with REST only

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |named   |true (ByPropertyName)|

#### **SourceInfoOnly**
Deletes relationship information on the source only. This parameter is supported with REST only

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |named   |true (ByPropertyName)|

#### **DeletelLunMapsInDestination**
Deletes LUN mapping for the volumes of the CG in destination. This parameter is supported with REST only

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[bool?]`|false   |named   |true (ByPropertyName)|

#### **InfiniteVolume**
Specify the InfiniteVolume parameter to indicate the SnapMirror relationship is between Infinite Volumes.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|IsInfiniteVolume|

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
* 

---

### Notes
Category: snapmirror
API: snapmirror-destroy, snapmirror-destroy-async
Family: cluster,vserver

---

### Syntax
```PowerShell
Remove-NcSnapmirror [-DestinationCluster <String>] -DestinationVserver <String> -DestinationVolume <String> [-SourceCluster <String>] [-SourceVserver <String>] [-SourceVolume <String>] 
```
```PowerShell
[-InfiniteVolume] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Remove-NcSnapmirror [-Destination] <String> [[-Source] <String>] [-InfiniteVolume] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
