Restore-NcSnapshotFile
----------------------

### Synopsis
Reverts a single file to a revision from a specified snapshot.

---

### Description

Reverts a single file to a revision from a specified snapshot.  The volume used for restoring the file must be online and must not be a mirror.  Files other than normal files and LUNs are not restored.  This includes directories (and their contents), and files with NT streams.  Compressed files will not be restored, though compression may be enabled on the volume.

If there is not enough space in the volume, the single file snap restore will not start.  If the file already exists (in the active filesystem), it will be overwritten with the version in the snapshot.  It could take up to several minutes for before the API invocation returns.  During this time client exclusive oplocks are revoked and hard exclusive locks like the DOS compatibility lock are invalidated.  Once the invocation returns, the file restore will proceed in the background.

For normal files while the restore is proceeding, any operation which tries to change the file will be suspended until the restore is done.  The restore may take a long time to complete depending on the size of the file being restored.  The file is unavailable for use during this time.

For LUNs that are restored over top of their existing LUN, a LUN clone can be created that is backed by the snapshot being restored from and then the clone is split.  Snapshots are disabled during restore due to space efficient LUN clone split. In order to disable space efficient split during restore set the optional parameter space-efficient-split-disabled.  While the restore is proceeding the LUN is available and I/O (both reads and writes) is permitted.  Data that is modified in the LUN while the restore is proceeding will not be overwritten by the restore process.  The restore may take a long time to complete depending on the size of the LUN being restored.

Other single file snap restores can be executed concurrently.  Also it is possible for the single file snap restore to be aborted if we run out of disk space during the operation.  When this happens the timestamp of the file being restored will be updated.  Thus it will not be the same as the timestamp of the file in the snapshot.

For normal files, an in-progress restore can be aborted by removing the file.  For NFS users, the last link to the file must be removed.

For all restored files, the snapshot used for the restore cannot be deleted.  New snapshots cannot be created while a single-file snaprestore is in progress. Scheduled snapshots on the volume will be suspended for the duration of the restore.  Tree, user and group quota limits are not enforced for the owner, group and tree in which the file is being restored.  Thus if the user, group or tree quotas are exceeded, /etc/quotas will need to be altered after the single file snap restore operation has completed.  Then quota resize will need to be run.  When the restore completes, the file's attributes (size, permissions, ownership, etc.) should be identical as those in the snapshot.

If the system is halted or crashes while a single file snap restore is in progress then the operation will be restarted on reboot.  A volume cannot have both a volume snaprestore and a single-file snaprestore executing simultaneously.  Multiple single-file snaprestores can be in progress simultaneously.

---

### Related Links
* [Restore-NcSnapshotVolume](Restore-NcSnapshotVolume)

---

### Examples
> Example 1

```PowerShell
Restore-NcSnapshotFile /vol/vol1/testfile.txt snap1
Restore a single file from snapshot 'snap1'
```

---

### Parameters
#### **Path**
Path of the file to restore.  Path syntax has two forms: /vol/<volumename>/<rest of path> -or- /<rest of path>.  In the latter case (relative path), if volume was not specified, the root volume will be used. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|File   |

#### **SnapName**
Name of snapshot to restore from.  Snapshot must be from same volume as the file to restore.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |2       |true (ByPropertyName)|Snap<br/>Snapshot|

#### **RestorePath**
Path to restore to.  The path must be a full path to a filename, and must be in the same volume as the volume used for the restore.  If not specified, RestorePath is defaulted to the original path. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Uuid**
The 128 bit unique snapshot identifier expressed in the form of UUID.  This field is optional and can uniquely identify a snapshot to restore.  An example of an actual UUID is: 84a010ec-3d28-11df-84e8-123478653412

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|false   |named   |true (ByPropertyName)|SnapshotInstanceUUID|

#### **Volume**
Volume to restore to/from.  If this is specified, the path argument should be relative to the volume.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |Name   |

#### **SpaceEfficientSplitDisabled**
By default, space-efficient LUN clone split is allowed during restore.  This parameter, if specified, disables space-efficient splitting for this specific operation. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Force**
If specified, the restore operation will proceed even if LUN being restored is read-only.
This parameter is not supported in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IgnoreStreams**
Specify to control the behavior while restoring file with streams. If false, streams are restored along with the file. If true, the file is restored without its streams. The default value is false. 
This parameter is available in ONTAP 8.4 and later. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **StartByte**
Starting byte offset of the source file, in multiples of 4096. This parameter is supported with Rest only.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|false   |named   |false        |

#### **ByteCount**
Number of bytes to restore from the source file, in multiples of 4096. This parameter is supported with Rest only.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[long]`|false   |named   |false        |

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
* 

---

### Notes
Category: snapshot
API: snapshot-restore-file
Family: vserver

---

### Syntax
```PowerShell
Restore-NcSnapshotFile [-Path] <String> [-SnapName] <String> [[-RestorePath] <String>] [-Uuid <String>] [-Volume <String>] [-SpaceEfficientSplitDisabled] [-Force] [-IgnoreStreams] 
```
```PowerShell
[-VserverContext <String>] [-StartByte <long>] [-ByteCount <long>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
