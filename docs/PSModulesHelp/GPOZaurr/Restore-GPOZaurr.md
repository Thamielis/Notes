Restore-GPOZaurr
----------------

### Synopsis
Restores Group Policy Objects (GPOs) from a specified backup folder.

---

### Description

Restores Group Policy Objects (GPOs) from a specified backup folder. This function allows restoring GPOs with the option to provide a new display name for the GPO.

---

### Examples
> EXAMPLE 1

```PowerShell
Restore-GPOZaurr -BackupFolder 'C:\GPOBackups' -DisplayName 'TestGPO'
```
> EXAMPLE 2

```PowerShell
Restore-GPOZaurr -BackupFolder 'C:\GPOBackups' -DisplayName 'TestGPO' -NewDisplayName 'NewTestGPO' -Domain 'example.com'
```

---

### Parameters
#### **BackupFolder**
The path to the folder containing the GPO backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **DisplayName**
The display name of the GPO to be restored.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |false        |Name   |

#### **NewDisplayName**
(Optional) The new display name for the restored GPO.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Domain**
(Optional) The domain name where the GPO should be restored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **SkipBackupSummary**
(Switch) Skip displaying the backup summary information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Restore-GPOZaurr [-BackupFolder] <String> [[-DisplayName] <String>] [[-NewDisplayName] <String>] [[-Domain] <String>] [-SkipBackupSummary] [<CommonParameters>]
```
