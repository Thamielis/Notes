Invoke-NcVolMoveCutover
-----------------------

### Synopsis
Trigger cutover of a volume move job.

---

### Description

Trigger cutover of a volume move job.

---

### Related Links
* [Start-NcVolMove](Start-NcVolMove)

---

### Examples
> Example 1

Invoke-NcVolMoveCutover bigvol -Vserver vserver1
Trigger a cutover of the volume move operation for volume 'bigvol'.

Name   State  TotalSize Used Available Dedupe Aggregate Vserver
----   -----  --------- ---- --------- ------ --------- -------
bigvol online  100.0 GB   5%   95.0 GB False  aggr2     vserver1

---

### Parameters
#### **Name**
The name of the volume being moved.

|Type      |Required|Position|PipelineInput        |Aliases                                     |
|----------|--------|--------|---------------------|--------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Volume<br/>SourceVolume<br/>SourceVolumeName|

#### **Vserver**
The name of the vserver that contains the volume being moved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
Force cutover.

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-move-trigger-cutover
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcVolMoveCutover [-Name] <String> [-Vserver <String>] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
