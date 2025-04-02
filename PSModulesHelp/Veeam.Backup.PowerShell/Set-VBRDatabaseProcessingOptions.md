Set-VBRDatabaseProcessingOptions
--------------------------------

### Synopsis
Modifies the database processing settings for application backup policies.

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

* [New-VBRDatabaseProcessingOptions](New-VBRDatabaseProcessingOptions)

* [New-VBROracleRMANProcessingOptions](New-VBROracleRMANProcessingOptions)

* [New-VBRSAPHANAProcessingOptions](New-VBRSAPHANAProcessingOptions)

---

### Examples
> Example

$group = Get-VBRProtectionGroup -Name "Database Servers"
$db_administrator = Get-VBRCredentials
$processing_settings = New-VBRSAPOnOracleProcessingOptions -Credentials $db_administrator -DeleteSourceLogs Keep -ArchiveLogBackupPeriod 15
$options = New-VBRDatabaseProcessingOptions -BackupObject $group -SAPOnOracleProcessingOptions $processing_settings
$updated_group = Get-VBRProtectionGroup -Name "SAP on Oracle Servers"
Set-VBRDatabaseProcessingOptions -Options $options -BackupObject $updated_group
This example shows how to create a SAP on Oracle database processing settings for application backup policies for Veeam Plug-in for SAP on Oracle and modify the backup object.

Perform the following steps:
1. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $group variable.
2. Run the Get-VBRCredentials cmdlet. Save the result to the $db_administrator variable.
3. Run the New-VBRSAPOnOracleProcessingOptions cmdlet. Set the $db_administrator variable as the Credentials parameter value. Specify the DeleteSourceLogs and ArchiveLogBackupPeriod parameter values. Save the result to the $processing_settings variable.
4. Run the New-VBRDatabaseProcessingOptions cmdlet. Set the $group as the BackupObject parameter value. Set the $processing_settings variable as the SAPOnOracleProcessingOptions parameter value. Save the result to the $options variable.
5. Run the Get-VBRProtectionGroup cmdlet. Specify the Name parameter value. Save the result to the $updated_group variable.
6. Run the Set-VBRDatabaseProcessingOptions cmdlet. Set the $options variable as the Options parameter value. Set the $updated_group variable as the BackupObject parameter value.

---

### Parameters
#### **BackupObject**
Specifies an array of protection groups and discovered computers that you want to add to the application backup policy. Accepts the Object object.  To get this object, run the Get-VBRProtectionGroup cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Options**
Specifies the database processing options that you plan to modify. Accepts the VBRSAPOnOracleProcessingOptions object.  To get this object, run the New-VBRDatabaseProcessingOptions cmdlet.

|Type                            |Required|Position|PipelineInput |
|--------------------------------|--------|--------|--------------|
|`[VBRDatabaseProcessingOptions]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRDatabaseProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRDatabaseProcessingOptions [-BackupObject <Object>] -Options <VBRDatabaseProcessingOptions> [-OracleRMANProcessingOptions <VBROracleRMANProcessingOptions>] [-PluggableDatabasesOptions 
```
```PowerShell
<VBRPluggableDatabasesOptions>] [-SAPHANAProcessingOptions <VBRSAPHANAProcessingOptions>] [-SAPOnOracleProcessingOptions <VBRSAPOnOracleProcessingOptions>] [<CommonParameters>]
```
