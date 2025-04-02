New-VBRNASBackupVersionRetentionOptions
---------------------------------------

### Synopsis
Defines version-based retention policy settings that will be applied for the file share backup job.

---

### Description

This cmdlet defines version-based retention policy settings that will be applied for the file share backup job. For NAS backup, Veeam Backup & Replication allows allows specifying not only for how long to keep copies of all recent file versions, but also how many file versions to keep in the backup repository. Important If you use retention options configured with the New-VBRNASBackupArchivalOptions cmdlet, the settings configured with New-VBRNASBackupVersionRetentionOptions scripts may not work correctly.

---

### Examples
> Example 1. Defining Retention Policy for File Versions of Active Files Both in Backup and Archive Repositories

```PowerShell
New-VBRNASBackupVersionRetentionOptions -VersionRetentionType BackupAndArchive -ActiveFileVersionRetention 14
This command shows how to define retention policy for file versions of active files. The backup and archive repositories together will keep file versions of active files for 14 days.
```
> Example 2. Defining Retention Policy for File Versions of Deleted Files in Archive Repository

```PowerShell
New-VBRNASBackupVersionRetentionOptions -VersionRetentionType Archive -DeletedFileVersionRetention 7
This command shows how to define retention policy for file versions of deleted files. The version-based retention settings applies to the archive repository only and it will keep file versions of deleted files for 7 days.
```

---

### Parameters
#### **ActiveFileVersionRetention**
Specifies the number of active file versions. Veeam Backup & Replication will keep the specified number of file versions for active (not deleted) files. Once the number of file versions exceeds, Veeam Backup & Replication will remove the oldest file version from the repository. Note: If you do not specify this parameter, the number of file versions for active files is set to unlimited. Veeam Backup & Replication will delete file versions for active files from the backup repository after the specified retention period passes. Default: 10.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **DeletedFileVersionRetention**
Specifies the number of file versions for deleted files. Veeam Backup & Replication will keep the specified number of file versions for deleted files. Once the number of file versions exceeds, Veeam Backup & Replication will remove the oldest version from the repository. Note: If you do not specify this parameter, the number of file versions for deleted files is set to unlimited. Veeam Backup & Replication will remove files versions for deleted files from the backup repository after the specified retention period passes. Default: 3.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **VersionRetentionType**
Specifies to what repositories the version-based retention policy will be applied. You can specify one of the following filter settings:
* None: use this option if you do not want to apply the version-based retention policy either to the backup or archive repository.
* Archive: use this option if you want to apply the version-based retention policy to the archive repository only.
* BackupAndArchive: use this option if you want to apply the version-based retention policy both to the backup and archive repositories.
Note: If you do not specify this parameter, version-based retention policy settings are applied by default both to backup and archive repositories.
Valid Values:

* None
* Archive
* BackupAndArchive

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRNASBackupVersionRetentionType]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRNASBackupVersionRetentionOptions [-ActiveFileVersionRetention <Int32>] [-DeletedFileVersionRetention <Int32>] [-VersionRetentionType {None | Archive | BackupAndArchive}] [<CommonParameters>]
```
