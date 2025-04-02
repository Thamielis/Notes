New-NcSnapmirror
----------------

### Synopsis
Creates a SnapMirror relationship between a source and destination volume.

---

### Description

Creates a SnapMirror relationship between a source and destination volume.  You can create either a load-sharing relationship or a data protection relationship using this cmdlet.  You must specify the source endpoint and destination endpoint.  Before you can use this command you should have created a source and destination volume.  The source volume should be in the online state and a read-write (RW) type.  The destination volume should be in the online state and a data protection (DP) type.  Note: The source volume might contain data and snapshot copies prior to creating the SnapMirror relationship.  If the destination volume is not empty, it must have a snapshot copy in common with the source volume, that is, it must have once been a copy of the source volume.  You must also take the volume style into consideration when creating SnapMirror relationships.  Source and destination volumes might be required to be either both regular volumes or both striped volumes.  Striped volumes might have the further restriction of requiring the same striping geometry on both the source and destination volume, and restriping volumes might be disallowed.  Load-sharing mirrors have the following restrictions: They only use regular style volumes, no striped volumes.  They are confined to a single vserver; they are not allowed to span vservers.  A set of load-sharing mirrors can have one or more destination volumes.  You create separate SnapMirror relationships between the common source volume and each destination volume to create the set of load-sharing mirrors.  If the optional schedule is specified, the destination volume is initialized on the first scheduled update.  The destination volume can also be initialized using Invoke-NcSnapmirrorInitialize and the destination volumes in a set of load-sharing mirrors are initialized using Invoke-NcSnapmirrorLsInitialize.  This cmdlet must be used from the destination cluster.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

* [Remove-NcSnapmirror](Remove-NcSnapmirror)

---

### Examples
> Example 1

New-NcSnapmirror //costea02/unitTestLunsSM //costea01/unitTestLuns -Type dp
Create an intracluster data-protection SnapMirror relationship from source volume 'unitTestLuns' on vserver 'costea01' to destination volume 'unitTestLunsSM' on vserver 'costea02'.

SourceLocation                    DestinationLocation                 Status MirrorState
--------------                    -------------------                 ------ -----------
VxeRubble://costea01/unitTestLuns VxeRubble://costea02/unitTestLunsSM idle   uninitialized

> Example 2

New-NcVol vol1_LS1 aggr2 10g -Type dp -JunctionPath $null
New-NcVol vol1_LS2 aggr2 10g -Type dp -JunctionPath $null
New-NcSnapmirror //costea01/vol1_LS1 //costea01/vol1 -Type ls
New-NcSnapmirror //costea01/vol1_LS2 //costea01/vol1 -Type ls
Create two load-sharing SnapMirrors from source volume 'vol1' to destination volumes 'vol1_LS1' and 'vol1_LS2'.

Name     State  TotalSize Used Available Dedupe Aggregate Vserver
----     -----  --------- ---- --------- ------ --------- -------
vol1_LS1 online   10.0 GB   5%    9.5 GB False  aggr2     costea01
vol1_LS2 online   10.0 GB   5%    9.5 GB False  aggr2     costea01

SourceLocation            DestinationLocation           Status MirrorState
--------------            -------------------           ------ -----------
VxeRubble://costea01/vol1 VxeRubble://costea01/vol1_LS1 idle   uninitialized
VxeRubble://costea01/vol1 VxeRubble://costea01/vol1_LS2 idle   uninitialized

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
|`[String]`|true    |named   |true (ByPropertyName)|

#### **SourceVolume**
Specifies the source volume of the SnapMirror relationship.  The source cluster and source vserver must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Schedule**
Specifies the name of the schedule which is used to update the SnapMirror relationship.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Tries**
Specifies the maximum number of times to attempt each manual or scheduled transfer for a SnapMirror relationship.  The default is eight times.  Note: You can set the tries option to zero (0) to disable manual and scheduled updates for the SnapMirror relationship.

|Type     |Required|Position|PipelineInput        |Aliases             |
|---------|--------|--------|---------------------|--------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Retry<br/>RetryCount|

#### **MaxTransferRate**
Specifies the upper bound, in bytes per second, at which data is transferred between clusters.  The default is unlimited (0) which permits the SnapMirror relationship to fully utilize the available network bandwidth.  This option does not affect load-sharing mirrors and other SnapMirror relationships confined to a single cluster.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Type**
Specifies the type of SnapMirror relationship.  Possible values: dp, ls, vault, restore, transition_data_protection.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |named   |true (ByPropertyName)|RelationshipType|

#### **Policy**
Specifies the name of the snapmirror policy for the relationship. For SnapMirror relationships of type 'vault', the policy will also have rules to select snapshot copies that must be transferred. If no policy is specified, a default policy will be applied depending on the type of the SnapMirror relationship. This parameter is available in ONTAP 8.2 or later if the relationship control plane is 'v2'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ConsistencyGroupVolumes**
Specifies the list of FlexVol volumes for a Consistency Group. This parameter is supported with REST only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SvmDrVolumes**
Specifies the list of constituent FlexVol volumes and FlexGroup volumes for an SVM DR SnapMirror relationship. This parameter is supported with REST only

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **IdentityPreservation**
Specifies which configuration of the source SVM is replicated to the destination SVM. This Parameter is supported with REST Only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **PreserveIdentity**
Specify to replicate the identity of the source Vserver to the destination Vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **IsAutoExpandEnabled**
Specifies if the FlexGroup SnapMirror relationship and its destination FlexGroup should be auto-expanded if the source FlexGroup is expanded. This parameter is supported only for FlexGroup SnapMirror relationships. If the initialize is creating a new SnapMirror relationship, the default value is true. If it is not creating a new relationship, if a value is specified, it must match the current value for the existing relationship. If the parameter is not specified, the existing value will be retained.
This parameter is only supported in ONTAP 9.3. or later.

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
|`[String]`|true    |2       |true (ByPropertyName)|SourceLocation|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorInfo

---

### Notes
Category: snapmirror
API: snapmirror-create
Family: cluster, vserver

---

### Syntax
```PowerShell
New-NcSnapmirror [-DestinationCluster <String>] -DestinationVserver <String> -DestinationVolume <String> [-SourceCluster <String>] -SourceVserver <String> -SourceVolume <String> [-Schedule 
```
```PowerShell
<String>] [-Tries <Int32>] [-MaxTransferRate <Int64>] [-Type <String>] [-Policy <String>] [-PreserveIdentity] [-IsAutoExpandEnabled <Boolean>] [-IsCatalogEnabled <Boolean>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcSnapmirror [-Destination] <String> [-Source] <String> [-Schedule <String>] [-Tries <Int32>] [-MaxTransferRate <Int64>] [-Type <String>] [-Policy <String>] [-PreserveIdentity] 
```
```PowerShell
[-IsAutoExpandEnabled <Boolean>] [-IsCatalogEnabled <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
