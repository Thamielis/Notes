Start-NcVolFlexgroupDeploy
--------------------------

### Synopsis
Deploys a FlexGroup on the cluster.

---

### Description

Deploys a FlexGroup on the cluster.  If no non-root aggregates exist on the cluster, two aggregates are created on each node. The type of disk which has the maximum size available is used to create the aggregates. In the case of an AFF cluster, only one aggregate is created on each node.

---

### Parameters
#### **Size**
The initial size of the new FlexGroup, in bytes. The maximum size of the FlexGroup is limited by the platform maximum FlexVol size multiplied by 8 and multiplied by the number of nodes in the cluster. The size of the FlexGroup is also limited by the available space in the hosting aggregates.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **VolumeName**
This specifies the name of the FlexGroup

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VolumeType**
The type of the volume to be created.
Possible values: 'rw'   - read-write volume (default), 'dp'   - data-protection volume,

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vserver**
This specifies the existing Vserver on which the FlexGroup will be located. If not specified, a new Vserver is created. The name of the created Vserver will be the name of the FlexGroup that will be created, with '_vs' appended. For example, if the FlexGroup will be named 'fg' the Vserver will be named 'fg_vs'. If specified, the FlexGroup is created in the specified Vserver.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SpaceReserve**
Specifies the type of volume guarantee the new volume will use.  Possible values: none, volume.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Reserve|

#### **Aggregate**
Aggregate hosting the volume. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Style**
The style of the volume. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: volume
API: volume-flexgroup-deploy-async
Family: vserver

---

### Syntax
```PowerShell
Start-NcVolFlexgroupDeploy [-Size] <String> [-VolumeName <String>] [-VolumeType <String>] [-Vserver <String>] [-SpaceReserve <String>] [-Aggregate <String>] [-Style <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
