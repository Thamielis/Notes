Invoke-NaVssBackup
------------------

### Synopsis
Create a VSS shadow copy snapshot set for the given volumes.

---

### Description

Create a VSS shadow copy snapshot set for the given volumes.

---

### Related Links
* [Get-NaVssWriter](Get-NaVssWriter)

* [Get-NaVssProvider](Get-NaVssProvider)

* [Get-NaVssSnapshot](Get-NaVssSnapshot)

---

### Examples
> Example 1

```PowerShell
Invoke-NaVssBackup -Volume E:\
Create a shadow copy snapshot set containing the volume E:\ involving all of the available writers.
```

---

### Parameters
#### **Volume**
One or more volumes to include in the shadow copy snapshot set.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

#### **IncludeWriter**
A list of writers to explicitly include in the operation.  If not specified, all writers will be implicitly included.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |true (ByPropertyName)|

#### **ExcludeWriter**
A list of writers to explicitly exclude from the operation.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |true (ByPropertyName)|

#### **Provider**
Provider to use when performing the snapshot operation.  If not specified, the default provider will be used.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[Guid]`|false   |named   |true (ByPropertyName)|

#### **BackupType**
The type of backup to perform.  Default is FULL.  Possible values: FULL, INCREMENTAL, DIFFERENTIAL, LOG, COPY.
Valid Values:

* UNDEFINED
* FULL
* INCREMENTAL
* DIFFERENTIAL
* LOG
* COPY
* OTHER

|Type               |Required|Position|PipelineInput        |
|-------------------|--------|--------|---------------------|
|`[VSS_BACKUP_TYPE]`|false   |named   |true (ByPropertyName)|

#### **SnapshotContext**
Snapshot context to perform the backup.  If not specified, APP_ROLLBACK will be used.  Possible values: ALL, BACKUP, FILE_SHARE_BACKUP, NAS_ROLLBACK, APP_ROLLBACK, CLIENT_ACCESSIBLE, CLIENT_ACCESSIBLE_WRITERS.

|Type                    |Required|Position|PipelineInput        |
|------------------------|--------|--------|---------------------|
|`[VSS_SNAPSHOT_CONTEXT]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
category: vss

---

### Syntax
```PowerShell
Invoke-NaVssBackup [-Volume] <String[]> [-IncludeWriter <Guid[]>] [-ExcludeWriter <Guid[]>] [-Provider <Guid>] [-BackupType <VSS_BACKUP_TYPE>] [-SnapshotContext <VSS_SNAPSHOT_CONTEXT>] 
```
```PowerShell
[<CommonParameters>]
```
