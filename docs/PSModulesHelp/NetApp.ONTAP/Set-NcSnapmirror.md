Set-NcSnapmirror
----------------

### Synopsis
Changes one or more parameters of a SnapMirror relationship.

---

### Description

Changes one or more parameters of a SnapMirror relationship.  For load-sharing mirrors, a change to a parameter affects all of the SnapMirror relationships in the set of load-sharing mirrors.  Destination volumes in a set of load-sharing mirrors do not have individual parameter settings.  Changes made by the cmdlet do not take effect until the next manual or scheduled update of the SnapMirror relationship.  Changes do not affect updates that have started and have not finished yet.

The cmdlet must be used from the destination cluster.

The key parameter that identifies any SnapMirror relationship is the destination volume.  You must specify the destination endpoint when using Set-NcSnapmirror.

---

### Related Links
* [New-NcSnapmirror](New-NcSnapmirror)

* [Get-NcSnapmirror](Get-NcSnapmirror)

* [Remove-NcSnapmirror](Remove-NcSnapmirror)

---

### Examples
> Example 1

Get-NcSnapmirror -DestinationVserver costea02 | Set-NcSnapmirror -Schedule 8hour
Set the schedule for all SnapMirror relationships with their destination on vserver 'costea02'.

SourceLocation                    DestinationLocation                 Status MirrorState
--------------                    -------------------                 ------ -----------
VxeRubble://costea01/unitTestLuns VxeRubble://costea02/unitTestLunsSM idle   snapmirrored

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

#### **Schedule**
Name of the schedule on which the relationship operates.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Tries**
Specifies the maximum number of times to attempt each manual or scheduled transfer for a SnapMirror relationship.  Note: You can set the tries option to zero (0) to disable manual and scheduled updates for the SnapMirror relationship.

|Type     |Required|Position|PipelineInput        |Aliases             |
|---------|--------|--------|---------------------|--------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Retry<br/>RetryCount|

#### **MaxTransferRate**
Specifies the upper bound, in bytes per second, at which data is transferred between clusters.  The default is unlimited (0) which permits the SnapMirror relationship to fully utilize the available network bandwidth.  This option does not affect load-sharing mirrors and other SnapMirror relationships confined to a single cluster.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **Policy**
Name of the SnapMirror policy that applies to this relationship.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Snapmirror.SnapmirrorInfo

---

### Notes
Category: snapmirror
API: snapmirror-modify
Family: cluster,vserver

---

### Syntax
```PowerShell
Set-NcSnapmirror [-DestinationCluster <String>] -DestinationVserver <String> -DestinationVolume <String> [-SourceCluster <String>] [-SourceVserver <String>] [-SourceVolume <String>] 
```
```PowerShell
[-Schedule <String>] [-Tries <Int32>] [-MaxTransferRate <Int64>] [-Policy <String>] [-IsAutoExpandEnabled <Boolean>] [-IsCatalogEnabled <Boolean>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcSnapmirror [-Destination] <String> [[-Source] <String>] [-Schedule <String>] [-Tries <Int32>] [-MaxTransferRate <Int64>] [-Policy <String>] [-IsAutoExpandEnabled <Boolean>] 
```
```PowerShell
[-IsCatalogEnabled <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
