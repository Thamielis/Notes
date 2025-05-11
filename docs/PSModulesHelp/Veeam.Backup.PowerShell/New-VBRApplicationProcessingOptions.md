New-VBRApplicationProcessingOptions
-----------------------------------

### Synopsis
Creates application-aware processing settings for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRApplicationProcessingOptions object. This object contains application-aware processing settings for Veeam Agent backup jobs.
For more information about job application-aware settings, see the Application-Aware Processing section of the Veeam Agent Management Guide.
Note: You cannot set up application-aware processing for Veeam Agent jobs that back up workstations.

---

### Related Links
* [New-VBRScriptProcessingOptions](New-VBRScriptProcessingOptions)

* [New-VBROracleProcessingOptions](New-VBROracleProcessingOptions)

* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [New-VBRSQLProcessingOptions](New-VBRSQLProcessingOptions)

---

### Examples
> Example 1. Specifying Application-Aware Processing Settings for Veeam Agent Backup Job (Linux)

$script = New-VBRScriptProcessingOptions -ProcessingAction RequireSuccess -ScriptPrefreezeCommand "C:\scripts\pre-scipt.bat" -ScriptPostthawCommand "C:\scripts\post-script.bat"
$creds = Get-Credential
$oracle = New-VBROracleProcessingOptions -Credentials $creds
$group = Get-VBRProtectionGroup -Name "LinuxGroup"
New-VBRApplicationProcessingOptions -BackupObject $group -OSPlatform Linux -Enable -IgnoreErrors -OracleProcessingOptions $oracle -ScriptProcessingOptions $script
This example shows how to specify application-aware processing settings for a Veeam Agent job that backs up Linux computers. The job will run with the following options:
- Veeam Backup & Replication will run pre-freeze and post-thaw scripts to create a transactionally consistent backup.
- Veeam Backup & Replication will use a user account that has SYSDBA rights on the database to connect to an Oracle database.
- In case an error occurs during application-aware processing, Veeam Backup & Replication will proceed with the backup job and will create a crash-consistent backup.
Perform the following steps:
1. Run the New-VBRScriptProcessingOptions cmdlet. Specify the ProcessingAction, ScriptPrefreezeCommand and ScriptPostthawCommand parameter values. Save the result to the $script variable.
2. Run the Get-Credential cmdlet to specify credentials for the Oracle database. Save the result to the $creds variable.
3. Run the New-VBROracleProcessingOptions cmdlet. Set the $creds variable as the Credentials parameter value. Save the result to the $oracle variable.
4. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
5. Run New-VBRApplicationProcessingOptions cmdlet. Specify the following settings:
- Set the $group variable as the BackupObject parameter value.
- Set the Linux value as the OSPlatform parameter value.
- Provide the Enable parameter.
- Provide the IgnoreErrors parameter.
- Set the $oracle variable as the OracleProcessingOptions parameter value.
- Set the $script variable as the ScriptProcessingOptions parameter value.
> Example 2. Specifying Application-Aware Processing Settings for Veeam Agent Backup Job (Windows)

$creds = Get-Credential
$group = Get-VBRProtectionGroup -Name "WindowsGroup"
$sql = New-VBRSQLProcessingOptions -TransactionAction BackupPeriodically -LogBackupPeriod 25 -LogRetainAction KeepOnlyLastDays -LogRetainPeriod 7
New-VBRApplicationProcessingOptions -BackupObject $group -OSPlatform Windows -Enable -GeneralTransactionLogAction ProcessLogsWithJob -SQLProcessingOptions $sql -SharePointCredentials $creds
This example shows how to create application-aware processing settings for a Veeam Agent job that backs up Windows computers. The job will create a consistent backup and will run with the following options:
- Veeam Backup & Replication will apply SQL processing settings.
- Veeam Backup & Replication will use SharePoint admin credentials.
Perform the following steps:
1. Run the Get-Credential cmdlet. Save the result to the $creds variable.
2. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
3. Run the New-VBRSQLProcessingOptions cmdlet. Specify the TransactionAction, LogBackupPeriod, LogRetainAction and LogRetainPeriod parameter values. Save the result to the $sql variable.
4. Run the New-VBRApplicationProcessingOptions cmdlet. Specify the following settings:
- Set the $group variable as the BackupObject parameter value.
- Set the Windows option for the OSPlatform parameter.
- Provide the Enable parameter.
- Set the ProcessLogsWithJob option for the GeneralTransactionLogAction parameter.
- Set the $sql variable as the SQLProcessingOptions parameter value.
- Set the $creds variable as the SharePointCredentials parameter value.

---

### Parameters
#### **BackupObject**
Specifies a protection group or a discovered computer, for which you want to set up application-aware processing settings.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |named   |True (ByValue)|

#### **Enable**
Enables application-aware processing. Veeam Backup & Replication will turn on application-aware processing option for the selected protection group or a discovered computer.
Note: For Veeam Agent jobs that back up Linux computers, this parameter will also stop the backup process if any error occurs during application-aware processing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GeneralTransactionLogAction**
Specifies transaction logs action:
* ProcessLogsWithJob: use this option to allow Veeam Backup & Replication to process transaction logs.
Note: For Veeam Agent jobs that back up Windows computers, this option enables SQL and Oracle logs processing options.
* PerformCopyOnly: use this option if you have another tool to maintain consistency of the database state. Veeam Agent for Microsoft Windows will create a copy-only backup.
Note:
* This parameter is required for Veeam Agent jobs that back up Windows computers.
* This parameter does not work for Veeam Agent jobs that back up Linux computers.
Valid Values:

* ProcessLogsWithJob
* PerformCopyOnly

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRGeneralTransactionLogAction]`|false   |named   |False        |

#### **IgnoreErrors**
Defines that Veeam Backup & Replication will ignore application processing errors. In case an error occurs during application-aware processing, Veeam Backup & Replication will continue to run the backup job. The resulting backup will be crash-consistent.
Note: This parameter works for Veeam Agent jobs that back up Linux computers only. You must use the Enable parameter to set up processing options with the IgnoreErrors option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MySQLProcessingOptions**
Specifies MySQL processing settings. Veeam Agent will apply these settings to a Veeam Agent backup job.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRMySQLProcessingOptions]`|false   |named   |False        |

#### **OracleProcessingOptions**
Specifies Oracle processing settings.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBROracleProcessingOptions]`|false   |named   |False        |

#### **OSPlatform**
Specifies the OS of the protected computers:
* Windows: for Windows computers.
* Linux: for Linux computers.
* Mac: for macOS computers.
Note: Application-aware processing for macOS computers is not supported in current version of Veeam PowerShell.
Valid Values:

* Windows
* Linux
* Mac
* Unix

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRAgentType]`|true    |named   |False        |

#### **PostgreSQLProcessingOptions**
Specifies PostgreSQL processing settings. Veeam Agent will apply these settings to a Veeam Agent backup job.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRPostgreSQLProcessingOptions]`|false   |named   |False        |

#### **ScriptProcessingOptions**
Specifies custom script settings. Veeam Agent will run pre-freeze and post-thaw scripts per these settings.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRScriptProcessingOptions]`|false   |named   |False        |

#### **SharePointCredentials**
Specifies the credentials for the SharePoint user account that has enough permissions on the application. Veeam Agent for Microsoft Windows will use these credentials to connect to SharePoint and to back up the application.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **SQLProcessingOptions**
Specifies SQL processing settings.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRSQLProcessingOptions]`|false   |named   |False        |

---

### Inputs
System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRApplicationProcessingOptions -BackupObject <Object> [-Enable] [-GeneralTransactionLogAction {ProcessLogsWithJob | PerformCopyOnly}] [-IgnoreErrors] [-MySQLProcessingOptions <VBRMySQLProcessingOptions>] 
```
```PowerShell
[-OracleProcessingOptions <VBROracleProcessingOptions>] -OSPlatform {Windows | Linux | Mac | Unix} [-PostgreSQLProcessingOptions <VBRPostgreSQLProcessingOptions>] [-ScriptProcessingOptions 
```
```PowerShell
<VBRScriptProcessingOptions>] [-SharePointCredentials <CCredentials>] [-SQLProcessingOptions <VBRSQLProcessingOptions>] [<CommonParameters>]
```
