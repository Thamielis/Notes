New-VBRDatabaseProcessingOptions
--------------------------------

### Synopsis
Creates the database processing settings for application backup policies.

---

### Description

This cmdlet creates the VBRDatabaseProcessingOptions object that contains database processing settings for application backup policies.

You can use this cmdlet to create a schedule for application backup policies for the following Veeam Plug-ins managed by Veeam Backup & Replication:
- Veeam Plug-in for Oracle RMAN
- Veeam Plug-in for SAP HANA
- Veeam Plug-in for SAP on Oracle

---

### Related Links
* [Get-VBRProtectionGroup](Get-VBRProtectionGroup)

* [Get-VBRCredentials](Get-VBRCredentials)

* [New-VBRSAPOnOracleProcessingOptions](New-VBRSAPOnOracleProcessingOptions)

* [New-VBROracleRMANProcessingOptions](New-VBROracleRMANProcessingOptions)

* [New-VBRSAPHANAProcessingOptions](New-VBRSAPHANAProcessingOptions)

* [New-VBRPluggableDatabasesOptions](New-VBRPluggableDatabasesOptions)

---

### Examples
> Example - Creating SAP on Oracle Database Processing Settings for Application Backup Policies for Veeam Plug-in for SAP on Oracle

$group = Get-VBRProtectionGroup -Name "Database Servers"
$db_administrator = Get-VBRCredentials
$processing_settings = New-VBRSAPOnOracleProcessingOptions -Credentials $db_administrator -DeleteSourceLogs Keep -ArchiveLogBackupPeriod 15
New-VBRDatabaseProcessingOptions -BackupObject $group -SAPOnOracleProcessingOptions $processing_settings
This example shows how to create a SAP on Oracle database processing settings for application backup policies for Veeam Plug-in for SAP on Oracle. The policy will back up archived logs every 15 minutes and send application backups to the target storage using 3 parallel data channels.

Perform the following steps:
1. Run Get-VBRProtectionGroup to get the protection group with computers where Veeam Plug-in for SAP on Oracle is installed. Save the result to the $group variable.
2. Run Get-VBRCredentials to get the credentials for the Oracle database system. Save the result to the $db_administrator variable.
3. Run New-VBRSAPOnOracleProcessingOptions with the $db_administrator variable. Use the DeleteSourceLogs parameter to delete archived logs that were backed up and the ArchiveLogBackupPeriod parameter to specify log backup frequency.  Save the result to the $processing_settings variable.
4. Run New-VBRDatabaseProcessingOptions with the $group, $db_administrator and $processing_settings variables.

---

### Parameters
#### **BackupObject**
Specifies an array of protection groups and discovered computers that you want to add to the application backup policy. Accepts the Object object.  To get this object, run the Get-VBRProtectionGroup cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |named   |False        |

#### **OracleRMANProcessingOptions**
For Veeam Plug-in for Oracle RMAN. Specifies the Oracle RMAN database processing settings. Accepts the VBROracleRMANProcessingOptions type.  To get this object, run the New-VBROracleRMANProcessingOptions cmdlet.

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBROracleRMANProcessingOptions]`|false   |named   |False        |

#### **PluggableDatabasesOptions**
For Veeam Plug-in for Oracle RMAN. Specifies the settings for pluggable databases. Accepts the VBRPluggableDatabasesOptions object.  To get this object, run the New-VBRPluggableDatabasesOptions cmdlet.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRPluggableDatabasesOptions]`|false   |named   |False        |

#### **SAPHANAProcessingOptions**
For Veeam Plug-in for SAP HANA. Specifies the SAP HANA database processing settings. Accepts the VBRSAPHANAProcessingOptions object.  To get this object, run the New-VBRSAPHANAProcessingOptions cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRSAPHANAProcessingOptions]`|false   |named   |False        |

#### **SAPOnOracleProcessingOptions**
For Veeam Plug-in for SAP on Oracle. Specifies the SAP on Oracle database processing settings. Accepts the VBRSAPOnOracleProcessingOptions type.  To get this object, run the New-VBRSAPOnOracleProcessingOptions cmdlet.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRSAPOnOracleProcessingOptions]`|false   |named   |False        |

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
New-VBRDatabaseProcessingOptions -BackupObject <Object> [-OracleRMANProcessingOptions <VBROracleRMANProcessingOptions>] [-PluggableDatabasesOptions <VBRPluggableDatabasesOptions>] [-SAPHANAProcessingOptions 
```
```PowerShell
<VBRSAPHANAProcessingOptions>] [-SAPOnOracleProcessingOptions <VBRSAPOnOracleProcessingOptions>] [<CommonParameters>]
```
