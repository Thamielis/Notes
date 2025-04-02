Get-NaVssSnapshot
-----------------

### Synopsis
Get a list of completed shadow copies in the system that reside in the given context.

---

### Description

Get a list of completed shadow copies in the system that reside in the given context.

---

### Related Links
* [Get-NaVssProvider](Get-NaVssProvider)

* [Get-NaVssWriter](Get-NaVssWriter)

---

### Examples
> Example 1

```PowerShell
Get-NaVssSnapshot APP_ROLLBACK
Get all of the completed VSS shadow copies in the APP_ROLLBACK snapshot context.

SnapshotId           : ce7bb1f0-a849-4f08-a319-f65d153303d7
SnapshotSetId        : f4eebe60-7ba4-4cde-9392-d9068aae30b5
SnapshotsCount       : 1
SnapshotDeviceObject : \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy30
OriginalVolumeName   : \\?\Volume{692eb055-7495-4360-b64c-5d3eee11a15a}\
OriginatingMachine   : WIN2K8DEVRRE0.rtprre.testdomain
ServiceMachine       : WIN2K8DEVRRE0.rtprre.testdomain
ExposedName          :
ExposedPath          :
ProviderId           : b5946137-7b9f-4925-af80-51abd60b20d5
SnapshotAttributes   : 131081
CreationTimestamp    : 129985997207704906
Status               : CREATED

```

---

### Parameters
#### **Context**
The VSS_SNAPSHOT_CONTEXT to query snapshots.  Only snapshots with this context will be returned.  Default value is BACKUP. Possible values: ALL, BACKUP, FILE_SHARE_BACKUP, NAS_ROLLBACK, APP_ROLLBACK, CLIENT_ACCESSIBLE, CLIENT_ACCESSIBLE_WRITERS.
Valid Values:

* BACKUP
* APP_ROLLBACK
* CLIENT_ACCESSIBLE_WRITERS
* FILE_SHARE_BACKUP
* NAS_ROLLBACK
* CLIENT_ACCESSIBLE
* ALL

|Type                    |Required|Position|PipelineInput        |
|------------------------|--------|--------|---------------------|
|`[VSS_SNAPSHOT_CONTEXT]`|false   |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.HostUtilities.Vss.VssSnapshotProperties

---

### Notes
Category: vss

---

### Syntax
```PowerShell
Get-NaVssSnapshot [[-Context] <VSS_SNAPSHOT_CONTEXT>] [<CommonParameters>]
```
