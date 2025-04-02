Set-VBRSQLProcessingOptions
---------------------------

### Synopsis
Modifies settings for processing Microsoft SQL database transaction logs.

---

### Description

This cmdlet modifies Microsoft SQL database transaction logs settings for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRSQLProcessingOptions](New-VBRSQLProcessingOptions)

---

### Examples
> Modifying SQL Processing Settings for Veeam Agent Backup Job (Windows)

$sql = New-VBRSQLProcessingOptions -TransactionAction BackupPeriodically -LogBackupPeriod 25 -LogRetainAction KeepOnlyLastDays -LogRetainPeriod 7
Set-VBRSQLProcessingOptions -Options $sql -TransactionAction BackupPeriodically -LogBackupPeriod 30 -LogRetainAction WaitForBackupDeletion
This example shows how to modify the existing SQL processing settings for a Veeam Agent job that backs up Windows computers. The job will run with the following options:
- Veeam Backup & Replication will back up the transaction logs every 30 minutes.
- Veeam Backup & Replication will keep the transaction logs backups until the image-level backup is deleted.
Perform the following steps:
1. Run the New-VBRSQLProcessingOptions cmdlet. Specify the TransactionAction, LogBackupPeriod, LogRetainAction and LogRetainPeriod parameter values. Save the result to the $sql variable.
2. Run the Set-VBRSQLProcessingOptions cmdlet. Specify the following settings:
- Set the $sql variable as the Options parameter value.
- Set the BackupPeriodically option for the TransactionAction parameter.
- Specify the LogBackupPeriod parameter value.
- Set the WaitForBackupDeletion option for the LogRetainAction parameter.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LogRetainAction**
For the BackupPeriodically action.
Specifies retention policy for transaction logs stored in the backup location.
* WaitForBackupDeletion: use this option to keep transaction logs backups the same period as image-level backups.
* KeepOnlyLastDays: use this option to keep transaction log backups for a specific number of days.
Valid Values:

* WaitForBackupDeletion
* KeepOnlyLastDays

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRLogRetainAction]`|false   |named   |False        |

#### **LogRetainPeriod**
For the BackupPeriodically action.
Specifies the number of days to keep the transaction logs.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Options**
Specifies SQL transaction logs processing settings that you want to modify.

|Type                       |Required|Position|PipelineInput |
|---------------------------|--------|--------|--------------|
|`[VBRSQLProcessingOptions]`|true    |named   |True (ByValue)|

#### **TransactionAction**
Specifies transaction logs processing.
* Truncate: use this option to truncate transaction logs after the successful backup job.
* NotTruncate: use this option to preserve transaction logs after the backup job completes.
* BackupPeriodically: use this option to back up transaction logs periodically.
Valid Values:

* Truncate
* NotTruncate
* BackupPeriodically

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRSQLTransactionLogAction]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSQLProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSQLProcessingOptions [-Credentials <CCredentials>] [-LogBackupPeriod <Int32>] [-LogRetainAction {WaitForBackupDeletion | KeepOnlyLastDays}] [-LogRetainPeriod <Int32>] -Options <VBRSQLProcessingOptions> 
```
```PowerShell
[-TransactionAction {Truncate | NotTruncate | BackupPeriodically}] [<CommonParameters>]
```
