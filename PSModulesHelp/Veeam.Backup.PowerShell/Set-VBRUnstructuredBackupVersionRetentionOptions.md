Set-VBRUnstructuredBackupVersionRetentionOptions
------------------------------------------------

### Synopsis
Modifies version-based retention policy settings for file backup jobs and object storage backup jobs.

---

### Description

This cmdlet modifies version-based retention policy settings for file backup jobs and object storage backup jobs. You can specify either a number of restore points to keep or the number of file versions to keep.
To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRUnstructuredBackupVersionRetentionOptions](New-VBRUnstructuredBackupVersionRetentionOptions)

---

### Examples
> Example 1. Modifying Retention Policy for File Versions of Active Files in Archive Repository

$new_version_retention_options = New-VBRUnstructuredBackupVersionRetentionOptions -VersionRetentionType            
Set-VBRUnstructuredBackupVersionRetentionOptions -Options $new_version_retention_options -VersionRetentionType Archive -EnableActiveFileVersionRetention -ActiveFileVersionRetention 14
This command shows how to modify retention policy for file versions of active files. Only the archive repository will keep use version-based retention, and will keep the last 14 versions of active files.
Perform the following steps:
1. Run the New-VBRUnstructuredBackupVersionRetentionOptions cmdlet. Use default settings. Save the result to the $new_version_retention_options variable.
2. Run the Set-VBRUnstructuredBackupVersionRetentionOptions cmdlet. Specify the following settings:
- Set the $new_version_retention_options variable as the Options parameter value.
- Set the VersionRetentionType parameter to Archive.
- Specify the EnableActiveFileVersionRetention parameter value.
- Set the ActiveFileVersionRetention parameter to 14.
> Example 2. Modifying Retention Policy for File Versions of Active and Deleted Files in Backup and Archive Repositories

$new_version_retention_options = New-VBRUnstructuredBackupVersionRetentionOptions -VersionRetentionType          
Set-VBRUnstructuredBackupVersionRetentionOptions -Options $new_version_retention_options -VersionRetentionType BackupAndArchive -EnableActiveFileVersionRetention -ActiveFileVersionRetention 21 -EnableDeletedFileVersionRetention -DeletedFileVersionRetention 7
This command shows how to enable the version-based retention settings for active files and it for deleted files. The version-based retention settings applies to the backup and archive repository and they will keep file versions of active files for 21 days and deleted files for 7 days.

Perform the following steps:
1. Run the New-VBRUnstructuredBackupVersionRetentionOptions cmdlet. Use default settings. Save the result to the $new_version_retention_options variable.
2. Run the Set-VBRUnstructuredBackupVersionRetentionOptions cmdlet. Specify the following settings:
- Set the $new_version_retention_options variable as the Options parameter value.
- Set the VersionRetentionType parameter to BackupAndArchive.
- Specify the EnableActiveFileVersionRetention parameter value.
- Set the ActiveFileVersionRetention parameter to 21.
- Specify the EnableDeletedFileVersionRetention parameter value.
- Set the DeletedFileVersionRetention parameter to 7.

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

#### **EnableActiveFileVersionRetention**
Defines that the cmdlet will enable the version-based retention for active files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableDeletedFileVersionRetention**
Defines that the cmdlet will enable the version-based retention for deleted files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Options**
Specifies the retention policy for file versions. The cmdlet will modify the settings of this policy.
Accepts the VBRUnstructuredBackupVersionRetentionOptions object.  To create this object, run the New-VBRUnstructuredBackupVersionRetentionOptions cmdlet.

|Type                                            |Required|Position|PipelineInput                 |
|------------------------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupVersionRetentionOptions]`|true    |named   |True (ByPropertyName, ByValue)|

#### **VersionRetentionType**
Specifies to what repositories the version-based retention policy will be applied. You can specify either of the following filter settings:
* None: use this option if you do not want to apply the version-based retention policy either to the backup or archive repository.
* Archive: use this option if you want to apply the version-based retention policy to the archive repository only.
* BackupAndArchive: use this option if you want to apply the version-based retention policy both to the backup and archive repositories.
Note: If you do not specify this parameter, version-based retention policy settings are applied by default both to backup and archive repositories.
Valid Values:

* None
* Archive
* BackupAndArchive

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupVersionRetentionType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackupVersionRetentionOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRUnstructuredBackupVersionRetentionOptions [-ActiveFileVersionRetention <Int32>] [-DeletedFileVersionRetention <Int32>] [-EnableActiveFileVersionRetention] [-EnableDeletedFileVersionRetention] -Options 
```
```PowerShell
<VBRUnstructuredBackupVersionRetentionOptions> [-VersionRetentionType {None | Archive | BackupAndArchive}] [<CommonParameters>]
```
