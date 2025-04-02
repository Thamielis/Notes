New-VBROracleProcessingOptions
------------------------------

### Synopsis
Creates settings for processing Oracle database archived logs.

---

### Description

This cmdlet creates a VBROracleProcessingOptions object. This object contains settings for processing Oracle archived logs in Veeam Agent backup jobs.
You can set Veeam Backup & Replication to apply the following settings:
- Preserve the archived logs
- Delete them after a certain retention period
- Delete the archived logs that are larger than the specified GB
Note: Processing of the Oracle database logs is not available for failover clusters.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Creating Oracle Processing Settings for Veeam Agent Backup Job (Linux)

$creds = Get-VBRCredentials
New-VBROracleProcessingOptions -Credentials $creds
This example shows how to create Oracle processing settings for a Veeam Agent job that backs up Linux computers.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $creds variable.
2. Run the New-VBROracleProcessingOptions cmdlet. Set the $creds variable as the Credentials parameter value.
> Example 2. Creating Oracle Processing Settings for Veeam Agent Backup Job (Windows)

New-VBROracleProcessingOptions -ArchivedLogAction DeleteBySize -ArchiveLogDeletionSize 17 -ArchiveLogBackupPeriod 25 -ArchiveLogRetainAction -EnableArchiveLogBackup
This command creates Oracle processing settings for a Veeam Agent job that backs up Windows computers. The job will run with the following options:
- Veeam Backup & Replication will trigger the truncation of the logs if they exceed 17 GB.
- Veeam Backup & Replication will back up the archived logs every 25 minutes

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
|`[VBROracleArchivedLogAction]`|true    |named   |False        |

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
Default: 24.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **ArchiveLogDeletionSize**
For the DeleteBySize action.
Specifies the size limits in GB for the logs to keep them on the server.
Default: 10.

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
Default: 15.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Credentials**
Specifies the credentials of the account with SYSDBA privileges. Veeam Backup & Replication will use these credentials to connect to the Oracle database.
Note: this parameter is required for the backup policy that Veeam Agent job applies to Linux computers.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **EnableArchiveLogBackup**
Enables the option to backup Oracle archived logs.
Note: This parameter does not work for backup policies that Veeam Agent job applies to Linux computers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBROracleProcessingOptions -ArchivedLogAction {NotDelete | DeleteByTime | DeleteBySize} [-ArchiveLogBackupPeriod <Int32>] [-ArchiveLogDeletionPeriod <Int32>] [-ArchiveLogDeletionSize <Int32>] 
```
```PowerShell
[-ArchiveLogRetainAction {WaitForBackupDeletion | KeepOnlyLastDays}] [-ArchiveLogRetainPeriod <Int32>] [-Credentials <CCredentials>] [-EnableArchiveLogBackup] [<CommonParameters>]
```
```PowerShell
New-VBROracleProcessingOptions -Credentials <CCredentials> [<CommonParameters>]
```
