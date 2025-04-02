New-VBRSAPOnOracleProcessingOptions
-----------------------------------

### Synopsis
Creates the SAP on Oracle database processing settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP on Oracle.

This cmdlet creates SAP on Oracle database processing settings. You can set up the following options:
- The way Veeam Backup & Replication will process archived logs.
- Schedule settings for archived logs processing.

---

### Related Links
* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example - Creating SAP on Oracle Database Processing Settings for Application Backup Policies for Veeam Plug-in for SAP on Oracle

$db_administrator = Get-VBRCredentials
New-VBRSAPOnOracleProcessingOptions -Credentials $db_administrator -DeleteSourceLogs Keep -ArchiveLogBackupPeriod 15
This example shows how to create an SAP on Oracle database processing settings for application backup policies for Veeam Plug-in for SAP on Oracle. The policy will back up archived logs every 15 minutes and send application backups to the target storage using 3 parallel data channels.

Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Save the result to the $db_administrator variable.
2. Run the New-VBRSAPOnOracleProcessingOptions cmdlet. Set the $db_administrator variable as the Credentials parameter value. Set the Keep option for the DeleteSourceLogs parameter. Specify the ArchiveLogBackupPeriod parameter value.
s

---

### Parameters
#### **ArchiveLogBackupPeriod**
Specifies the integer defining the frequency for archived logs backup in minutes. Permitted values: 5 to 480.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Credentials**
Specifies credentials for SAP on Oracle database processing. Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **DeleteArchivedRedoLogs**
Defines that Veeam Plug-in will delete archived logs that were backed up.

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
New-VBRSAPOnOracleProcessingOptions [-ArchiveLogBackupPeriod <Int32>] -Credentials <CCredentials> [-DeleteArchivedRedoLogs] [<CommonParameters>]
```
