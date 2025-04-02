Dismount-NcVol
--------------

### Synopsis
Unmount a volume from its parent volume and delete the junction path at which the volume is mounted.

---

### Description

Unmount a volume from its parent volume and delete the junction path at which the volume is mounted.

---

### Related Links
* [Mount-NcVol](Mount-NcVol)

---

### Examples
> Example 1

Dismount-NcVol vol2
Remove junction path from volume 'vol2'.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol2 online   10.0 GB   5%    9.5 GB False  aggr1     vserver1

---

### Parameters
#### **Name**
The name of the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Force**
This specifies whether the volume unmount operation is forced or not.  The default value is false.  Under certain circumstances, such as an unexpected reboot while in the middle of unmounting, the unmount operation might find that after the reboot, it is unable to delete the junction path at which the volume is mounted in the file system.  In this situation, if the force option is set to false, the unmount operation is failed, leaving the junction path information intact in the Volume Management Database. Instead, if the force option is set to true, the unmount operation proceeds to delete the junction path information in the Volume Management Database, irrespective of any failure to delete the junction path in the file system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
API: volume-unmount
Family: vserver

---

### Syntax
```PowerShell
Dismount-NcVol [-Name] <String> [-Force] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
