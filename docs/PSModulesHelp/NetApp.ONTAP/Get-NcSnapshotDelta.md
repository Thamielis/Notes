Get-NcSnapshotDelta
-------------------

### Synopsis
Returns the amount of space consumed between two snapshots or a snapshot and active filesystem.

---

### Description

Returns the amount of space consumed between two snapshots or a snapshot and active filesystem.

---

### Related Links
* [Get-NcSnapshot](Get-NcSnapshot)

---

### Examples
> Example 1

Get-NcSnapshotDelta vol2 clone_vol2clone.0
Get the delta in volume 'vol2' between snapshot 'clone_vol2clone.0' and the active file system.

ConsumedSize  ElapsedTimeTS
------------  -------------
      2.1 MB    88.23:56:41

---

### Parameters
#### **Volume**
Name of the volume on which the snapshot delta is to be calculated.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|TargetName|

#### **Snapshot1**
Name of snapshot to be compared with Snapshot2 for space consumption calculations.

|Type      |Required|Position|PipelineInput        |Aliases           |
|----------|--------|--------|---------------------|------------------|
|`[String]`|true    |2       |true (ByPropertyName)|Name<br/>SnapName1|

#### **Snapshot2**
Name of snapshot to be compared with Snapshot1 for space consumption calculations.  If the snapshot is not specified, it is assumed to be Active File System.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[String]`|false   |3       |true (ByPropertyName)|SnapName2|

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
* DataONTAP.C.Types.Snapshot.DeltaInfo

---

### Notes
Category: snapshot
API: snapshot-delta-info
Family: vserver

---

### Syntax
```PowerShell
Get-NcSnapshotDelta [-Volume] <String> [-Snapshot1] <String> [[-Snapshot2] <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
