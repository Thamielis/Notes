New-VBRSQLProcessingOptions
---------------------------

### Synopsis
Defines settings for processing Microsoft SQL database transaction logs.

---

### Description

This cmdlet creates the VBRSQLProcessingOptions object. This object contains Microsoft SQL database transaction logs settings for Veeam Agent backup jobs. You can set up the following options:
- The way <%VBR%> will process transaction logs.
- Specify schedule settings for processing transaction logs.
For more information about custom scripts, see the Transaction Log Settings: Microsoft SQL Server section of the <%AM%> Guide.
Note: This cmdlet works for the Veeam Agent jobs that back up Windows computers only.

---

### Examples
> Creating SQL Processing Settings for Veeam Agent Job (Windows)

New-VBRSQLProcessingOptions -TransactionAction BackupPeriodically -LogBackupPeriod 25 -LogRetainAction KeepOnlyLastDays -LogRetainPeriod 7
This command creates SQL processing settings for a Veeam Agent job that backs up Windows computers. The job will run with the following options:
- Veeam Backup & Replication will backup SQL transaction logs every 25 minutes.
- Veeam Backup & Replication will keep the transaction logs for last 7 days.

---

### Parameters
#### **Credentials**
Specifies the credentials that Veeam Agent for Microsoft Windows will use to connect to the Microsoft SQL Server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **LogBackupPeriod**
For the BackupPeriodically action.
Specifies the number of minutes for transaction logs backups.
Default: 15.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LogRetainAction**
For the BackupPeriodically action.
Specifies retention policy for transaction logs stored in the backup repository.
* WaitForBackupDeletion: use this option to keep transaction logs backups the same period as image-level backups.
* KeepOnlyLastDays: use this option to keep transaction log backups for a specific number of days. Use the LogRetainPeriod to specify the number of days.
Valid Values:

* WaitForBackupDeletion
* KeepOnlyLastDays

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRLogRetainAction]`|false   |named   |False        |

#### **LogRetainPeriod**
For the BackupPeriodically action.
Specifies the number of days to keep the transaction logs.
Default: 15.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **TransactionAction**
Specifies transaction logs processing actions.
* Truncate: use this option to truncate transaction logs after successful backups.
* NotTruncate: use this option to preserve transaction logs after the backup job completes.
* BackupPeriodically: use this option to back up transaction logs periodically.
Valid Values:

* Truncate
* NotTruncate
* BackupPeriodically

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRSQLTransactionLogAction]`|true    |named   |False        |

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
New-VBRSQLProcessingOptions [-Credentials <CCredentials>] [-LogBackupPeriod <Int32>] [-LogRetainAction {WaitForBackupDeletion | KeepOnlyLastDays}] [-LogRetainPeriod <Int32>] -TransactionAction {Truncate | 
```
```PowerShell
NotTruncate | BackupPeriodically} [<CommonParameters>]
```
