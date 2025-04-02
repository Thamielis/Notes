New-NcSnapshot
--------------

### Synopsis
Create a new snapshot on a specified volume.

---

### Description

Create a new snapshot on a specified volume.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcSnapshot](Get-NcSnapshot)

* [Remove-NcSnapshot](Remove-NcSnapshot)

---

### Examples
> Example 1

New-NcSnapshot vol2 snap1
Create a new snapshot 'snap1' of volume 'vol2'.

Name  Volume Vserver    Created   Total Cumulative Dependency
----  ------ -------    -------   ----- ---------- ----------
snap1 vol2   vserver1 9/12/2011 68.0 KB    68.0 KB

---

### Parameters
#### **Volume**
Name of the volume on which the snapshot is to be created.  The volume name can contain letters, numbers, and the underscore character (_), but the first character must be a letter or an underscore.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|TargetName<br/>Name|

#### **Snapshot**
Name of the snapshot to be created.  The maximum string length is 256 characters.

|Type      |Required|Position|PipelineInput        |Aliases                  |
|----------|--------|--------|---------------------|-------------------------|
|`[String]`|false   |2       |true (ByPropertyName)|SnapName<br/>SnapshotName|

#### **Async**
If specified, the snapshot is to be created asynchronously.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Comment**
A human readable comment attached with the snapshot.  The size of the comment can be at most 255 characters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SnapmirrorLabel**
A human readable SnapMirror Label attached with the snapshot. Size of the label can be at most 31 characters. This label will be applied as an attribute to the snapshot that is created and will be used by the vaulting system to identify a vaulting scheme.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **ExpiryTime**
Snapshot copies with an expiry time set are not allowed to be deleted until the retention time is reached. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

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

#### **InfiniteVolume**
Specify the InfiniteVolume parameter to indicate the volume is an Infinite Volume.  If a VolumeAttributes object is piped to this cmdlet, the InfiniteVolume switch will be automatically set. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|IsInfiniteVolume|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapshot.SnapshotInfo

---

### Notes
Category: snapshot
API: snapshot-create
Family: vserver

---

### Syntax
```PowerShell
New-NcSnapshot [-Volume] <String> [[-Snapshot] <String>] [-Async] [-Comment <String>] [-SnapmirrorLabel <String>] [-VserverContext <String>] [-ExpiryTime <DateTime>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
New-NcSnapshot [-Volume] <String> [[-Snapshot] <String>] [-Comment <String>] -InfiniteVolume [-VserverContext <String>] [-ExpiryTime <DateTime>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
