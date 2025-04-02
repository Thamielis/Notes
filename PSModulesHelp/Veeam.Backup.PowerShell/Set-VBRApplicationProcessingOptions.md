Set-VBRApplicationProcessingOptions
-----------------------------------

### Synopsis
Modifies application-aware processing settings for Veeam Agent backup jobs.

---

### Description

This cmdlet modifies application-aware processing settings for Veeam Agent backup jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [New-VBRApplicationProcessingOptions](New-VBRApplicationProcessingOptions)

---

### Examples
> Example 1. Disabling Oracle and SQL Processing Settings for Veeam Agent Backup Job (Windows)

$group = Get-VBRProtectionGroup -Name "Windows Group"
$processoptions = New-VBRApplicationProcessingOptions -BackupObject $group -OSPlatform Windows -Enable -GeneralTransactionLogAction ProcessLogsWithJob -SQLProcessingOptions $sql -SharePointCredentials $creds
Set-VBRApplicationProcessingOptions -Options $processoptions -Enable -GeneralTransactionLogAction PerformCopyOnly -SharePointCredentials $creds -ScriptProcessingOptions $script
This example shows how to disable Oracle and SQL processing settings for a Veeam Agent job that backs up Windows computers.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the New-VBRApplicationProcessingOptions cmdlet. Set the $group variable as the BackupObject parameter value. Specify the OSPlatform, GeneralTransactionLogAction, SQLProcessingOptions and SharePointCredentials parameter values. Provide the Enable parameter. Save the result to the $processoptions variable.
3. Run the Set-VBRApplicationProcessingOptions cmdlet. Specify the following settings:
- Set the $processoptions variable as the Options parameter value.
- Provide the Enable parameter.
- Set the PerformCopyOnly option for the GeneralTransactionLogAction parameter.
- Set the $creds variable as the SharePointCredentials parameter value.
- Set the $script variable as the ScriptProcessingOptions parameter value.
> Example 2. Modifying Application-Aware Processing Settings for Veeam Agent Backup Job (Linux)

$group = Get-VBRProtectionGroup -Name "Linux Group"
$processoptions = New-VBRApplicationProcessingOptions -BackupObject $group -OSPlatform Linux -IgnoreErrors -OracleProcessingOptions $oracle -ScriptProcessingOptions $script
Set-VBRApplicationProcessingOptions -Options $processoptions -OracleProcessingOptions $oracle -ScriptProcessingOptions $script -Enable
This example shows how to modify application-aware processing settings for a Veeam Agent backup job that backs up Linux computers. The job will run with the following options:
- Veeam Backup & Replication will run pre-freeze and post-thaw scripts to create a transactionally consistent backup.
- Veeam Backup & Replication will use a user account that has SYSDBA rights on the database to connect to the Oracle database.
- In case an error occurs, Veeam Backup & Replication will stop the backup job.
Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the New-VBRApplicationProcessingOptions cmdlet. Set the $group variable as the BackupObject parameter value. Specify the OSPlatform, OracleProcessingOptions and ScriptProcessingOptions parameter values. Provide the IgnoreErrors parameter. Save the result to the $processoptions variable.
3. Run the Set-VBRApplicationProcessingOptions cmdlet. Specify the following settings:
- Set the $processoptions variable as the Options parameter value.
- Set the $oracle variable as the OracleProcessingOptions parameter value.
- Set the $script variable as the ScriptProcessingOptions parameter value.
- Provide the Enable parameter.

---

### Parameters
#### **Enable**
Enables application-aware processing. Veeam Backup & Replication will turn on the application-aware processing option for the selected protection group or a discovered computer.
Note: For Veeam Agent jobs that back up Linux computers, this parameter will also stop the backup process if any error occurs during application-aware processing.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GeneralTransactionLogAction**
Specifies transaction logs action:
* ProcessLogsWithJob: use this option to allow Veeam Backup & Replication to process transaction logs.
Note: For Veeam Agent job that backs up Windows computers this option enables SQL and Oracle logs processing options.
* PerformCopyOnly: use this option if you use another tool to maintain consistency of the database state. Veeam Agent for Microsoft Windows will create a copy-only backup.
Note:
* This parameter is required for Veeam Agent backup jobs that back up Windows computers.
* This parameter does not work for Veeam Agent backup jobs that back up Linux computers.
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

#### **Options**
Specifies application processing settings that you want to modify.

|Type                               |Required|Position|PipelineInput |
|-----------------------------------|--------|--------|--------------|
|`[VBRApplicationProcessingOptions]`|true    |named   |True (ByValue)|

#### **OracleProcessingOptions**
Specifies Oracle processing settings.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBROracleProcessingOptions]`|false   |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRApplicationProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRApplicationProcessingOptions [-Enable] [-GeneralTransactionLogAction {ProcessLogsWithJob | PerformCopyOnly}] [-IgnoreErrors] [-MySQLProcessingOptions <VBRMySQLProcessingOptions>] -Options 
```
```PowerShell
<VBRApplicationProcessingOptions> [-OracleProcessingOptions <VBROracleProcessingOptions>] [-PostgreSQLProcessingOptions <VBRPostgreSQLProcessingOptions>] [-ScriptProcessingOptions <VBRScriptProcessingOptions>] 
```
```PowerShell
[-SharePointCredentials <CCredentials>] [-SQLProcessingOptions <VBRSQLProcessingOptions>] [<CommonParameters>]
```
