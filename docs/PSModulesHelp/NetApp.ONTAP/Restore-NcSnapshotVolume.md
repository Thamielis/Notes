Restore-NcSnapshotVolume
------------------------

### Synopsis
Reverts a volume to a specified snapshot.

---

### Description

Reverts a volume to a specified snapshot.   The volume must be online and must not be a mirror.  If reverting the root volume, the filer will be rebooted.  Non-root volumes do not require a reboot.  A volume cannot have both a volume snaprestore and a single-file snaprestore executing simultaneously.  Multiple single-file snaprestores can be in progress simultaneously.  After the reversion, the volume is in the same state as it was when the snapshot was taken.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Restore-NcSnapshotFile](Restore-NcSnapshotFile)

---

### Examples
> Example 1

Restore-NcSnapshotVolume vol1 snap1
Restore volume 'vol1' to snapshot 'snap1'.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol1 online   20.0 GB   5%   19.0 GB False  aggr1     vserver1

---

### Parameters
#### **Volume**
The name of the volume to restore.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **SnapName**
The name of the snapshot to restore from.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |2       |true (ByPropertyName)|Snap<br/>Snapshot|

#### **Uuid**
The 128 bit unique snapshot identifier expressed in the form of UUID.  This field is optional and can uniquely identify a snapshot to restore.  An example of an actual UUID is: 84a010ec-3d28-11df-84e8-123478653412

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|false   |named   |true (ByPropertyName)|SnapshotInstanceUUID|

#### **PreserveLunIds**
When specified, LUNs in the volume being restored will remain mapped and their identities preserved such that host connectivity will not be disrupted during the restore operation.  I/O's to the LUN will be fenced during the restore operation by placing the LUNs in an unavailable state.  Once the restore operation has completed, hosts will be able to resume I/O access to the LUNs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If specified, the restore operation will proceed even if the volume being restored has a read-only LUN.  The read-only LUN will be restored.

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

#### **InfiniteVolume**
Specify the InfiniteVolume parameter to indicate the volume is an Infinite Volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: snapshot
API: snapshot-restore-volume
Family: vserver

---

### Syntax
```PowerShell
Restore-NcSnapshotVolume [-Volume] <String> [-SnapName] <String> [-Uuid <String>] [-PreserveLunIds] [-Force] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Restore-NcSnapshotVolume [-Volume] <String> [-SnapName] <String> [-Uuid <String>] -InfiniteVolume [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
