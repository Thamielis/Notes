Set-VBRSAPOnOracleProcessingOptions
-----------------------------------

### Synopsis
Modifies the SAP on Oracle database processing settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP on Oracle.

This cmdlet modifies SAP on Oracle database processing settings. You can set up the following options:
- The way Veeam Backup & Replication will process archived logs.
- Schedule settings for archived logs processing.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

* [New-VBRSAPOnOracleProcessingOptions](New-VBRSAPOnOracleProcessingOptions)

---

### Examples
> Example - Creating and Modifying SAP on Oracle Database Processing Settings for Application Backup Policies for Veeam Plug-in for SAP on Oracle

$db_administrator = Get-VBRCredentials
$processoptions = New-VBRSAPOnOracleProcessingOptions -Credentials $db_administrator -DeleteSourceLogs -ArchiveLogBackupPeriod 15 -ParallelChannelsCount 1
Set-VBRSAPOnOracleProcessingOptions -Options $processoptions -Credentials $db_administrator -DeleteSourceLogs -ArchiveLogBackupPeriod 30
This example shows how to create and modify a SAP on Oracle backup settings for application backup policies for Veeam Plug-in for SAP on Oracle. The modified policy will back up archived logs every 30 minutes.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $db_administrator variable.
2. Run the New-VBRSAPOnOracleProcessingOptions cmdlet. Specify the Credentials, DeleteSourceLogs, ArchiveLogBackupPeriod and ParallelChannelsCount parameter values. Save the result to the $processoptions variable.
3. Run the Set-VBRSAPOnOracleProcessingOptions cmdlet. Specify the following settings:
- Set the $processoptions variable as the Options parameter value.
- Set the $db_administrator variable as the Credentials parameter value.
- Provide the DeleteSourceLogs parameter.
- Specify the ArchiveLogBackupPeriod parameter value.

---

### Parameters
#### **ArchiveLogBackupPeriod**
Specifies the integer defining the frequency for archived logs backup in minutes. Permitted values: 5 to 480.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Credentials**
Specifies the credentials for SAP on Oracle database processing. Accepts the CCredentials object.  To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DeleteArchiveRedoLogs**
Defines that Veeam Plug-in should delete archived logs that were backed up.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Options**
Specifies the database processing options that you plan to modify. Accepts the VBRSAPOnOracleProcessingOptions object.  To get this object, run the New-VBRSAPOnOracleProcessingOptions cmdlet.

|Type                               |Required|Position|PipelineInput |
|-----------------------------------|--------|--------|--------------|
|`[VBRSAPOnOracleProcessingOptions]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSAPOnOracleProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSAPOnOracleProcessingOptions [-ArchiveLogBackupPeriod <Int32>] [-Credentials <CCredentials>] [-DeleteArchiveRedoLogs] -Options <VBRSAPOnOracleProcessingOptions> [<CommonParameters>]
```
