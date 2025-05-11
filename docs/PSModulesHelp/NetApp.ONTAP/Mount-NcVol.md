Mount-NcVol
-----------

### Synopsis
Mount a volume on another volume (parent) with a junction-path.

---

### Description

Mount a volume on another volume (parent) with a junction-path.

---

### Related Links
* [Dismount-NcVol](Dismount-NcVol)

---

### Examples
> Example 1

Mount-NcVol vol1 /vol1
Mount volume 'vol1' at path /vol1.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol1 online   20.0 GB   5%   19.0 GB False  aggr1     vserver1

---

### Parameters
#### **Name**
The name of the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **JunctionPath**
The fully-qualified pathname in the owning vserver's namespace at which this volume is mounted.  The pathname is case insensitive and must be unique within a vserver's context.  Note that this pathname may itself contain junctions, one for each volume (other than the namespace root volume) that provides storage along the pathname's length.  As with all fully-qualified pathnames, this string must begin with '/'.  In addition, it must not end with '/'.  An example of a valid junction path is: '/user/my_volume'.  Only one volume can be mounted at any given junction path.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|Path   |

#### **JunctionActive**
This field optionally specifies whether the mounted volume is accessible.  The default is true.  If the mounted path is not accessible, it does not appear in the owning vserver's namespace.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **ExportPolicyOverride**
This field optionally specifies whether the parent volume's export policy overrides the mounted volume's export policy.  The default is false.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

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
API: volume-mount
Family: vserver

---

### Syntax
```PowerShell
Mount-NcVol [-Name] <String> [-JunctionPath] <String> [-JunctionActive <Boolean>] [-ExportPolicyOverride <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
