Set-VBROracleProcessingOptions
------------------------------

### Synopsis
Modifies settings for processing Oracle database archived logs.

---

### Description

This cmdlet modifies the Oracle database processing settings for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBROracleProcessingOptions](New-VBROracleProcessingOptions)

---

### Examples
> Modifying Oracle Processing Settings for Veeam Agent Backup Job (Windows)

$oracle = New-VBROracleProcessingOptions -ArchivedLogAction DeleteBySize -ArchiveLogDeletionSize 20
Set-VBROracleProcessingOptions -Options $oracle -ArchivedLogAction DeleteByTime -ArchiveLogDeletionPeriod 17 -ArchiveLogBackupPeriod 25 -ArchiveLogRetainAction WaitForBackupDeletion -EnableArchiveLogBackup
This example shows how to modify Oracle processing settings for a Veeam Agent job that backs up Windows computers. The job will run with the following options:
- Veeam Backup & Replication will trigger the truncation of the logs which are older than 17 hours.
- Veeam Backup & Replication will back up the archived logs every 25 minutes.
- Veeam Backup & Replication will keep the backups of the archived logs the same period as the image-level backups.
Perform the following steps:
1. Run the New-VBROracleProcessingOptions cmdlet. Specify the ArchivedLogAction and ArchiveLogDeletionSize parameter values. Save the result to the $oracle variable.
2. Run the Set-VBROracleProcessingOptions cmdlet. Specify the following settings:
- Set the $oracle variable as the Options parameter value.
- Set the DeleteByTime option for the ArchivedLogAction parameter.
- Specify the ArchiveLogDeletionPeriod parameter value.
- Specify the ArchiveLogBackupPeriod parameter value.
- Set the WaitForBackupDeletion option for the ArchiveLogRetainAction parameter.
- Provide the EnableArchiveLogBackup parameter.

---

### Parameters
#### **ArchivedLogAction**
Specifies action for Oracle archived logs.
* NotDelete: use this option to keep archived logs.
* DeleteByTime: use this option if you want to delete archived logs that are older than <N> hours.
* DeleteBySize: use this option if you want to delete archived logs that are larger than <N> GB.
Valid Values:

* NotDelete
* DeleteByTime
* DeleteBySize

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBROracleArchivedLogAction]`|false   |named   |False        |

#### **ArchiveLogBackupPeriod**
For the EnableArchiveLogBackup parameter.
Specifies how often Veeam Backup & Replication will back up archived logs.
Default: every 15 minutes.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ArchiveLogDeletionPeriod**
For the DeleteByTime action.
Specifies the number of hours for keeping archived logs.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ArchiveLogDeletionSize**
For the DeleteBySize action.
Specifies the size limits in GB for the logs to keep them on the server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ArchiveLogRetainAction**
For the EnableArchiveLogBackup parameter.
Specifies retention policy for the archived logs backups. Veeam Backup & Replication will apply the policy for archived logs stored in the backup repository.
* WaitForBackupDeletion: use this option to keep archived log backups the same period as the image-level backups.
* KeepOnlyLastDays: use this option to keep archived log backups for a specific number of days.
Valid Values:

* WaitForBackupDeletion
* KeepOnlyLastDays

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRLogRetainAction]`|false   |named   |False        |

#### **ArchiveLogRetainPeriod**
For the EnableArchiveLogBackup parameter.
Specifies the number of days to keep backups of the archived logs.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Credentials**
Specifies the credentials of the account with SYSDBA privileges. Veeam Backup & Replication will use these credentials to connect to the Oracle database.
NOTE: this parameter is required for the backup policy that Veeam Agent job applies to Linux computers.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **EnableArchiveLogBackup**
Enables the option to backup Oracle archived logs.
Note: This parameter does not work for backup policies that Veeam Agent job applies to Linux computers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Options**
Specifies Oracle processing options that you want to modify.

|Type                          |Required|Position|PipelineInput |
|------------------------------|--------|--------|--------------|
|`[VBROracleProcessingOptions]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBROracleProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBROracleProcessingOptions [-ArchivedLogAction {NotDelete | DeleteByTime | DeleteBySize}] [-ArchiveLogBackupPeriod <Int32>] [-ArchiveLogDeletionPeriod <Int32>] [-ArchiveLogDeletionSize <Int32>] 
```
```PowerShell
[-ArchiveLogRetainAction {WaitForBackupDeletion | KeepOnlyLastDays}] [-ArchiveLogRetainPeriod <Int32>] [-Credentials <CCredentials>] [-EnableArchiveLogBackup] -Options <VBROracleProcessingOptions> 
```
```PowerShell
[<CommonParameters>]
```
