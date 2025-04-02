New-VBRSAPHANAProcessingOptions
-------------------------------

### Synopsis
Creates the SAP HANA database processing settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP HANA.

This cmdlet creates SAP HANA database processing settings. You can set up the following options:
- The way Veeam Backup & Replication will process archived logs.
- Schedule settings for archived logs processing.

---

### Examples
> Example - Creating SAP HANA Database Processing Settings for Application Backup Policies for Veeam Plug-in for SAP HANA

```PowerShell
New-VBRSAPHANAProcessingOptions -ArchiveLogBackupPeriod 15 -ArchivedLogAction SAPHANAManaged
This  command creates SAP HANA database processing settings for application backup policies for Veeam Plug-in for SAP HANA. The policy will back up archived logs every 15 minutes using SAP HANA tools.
```

---

### Parameters
#### **LogBackupMode**
Specifies the way of database processing:
* VeeamManaged: use this option if you want to perform database processing with Data Mover by Veeam Software.
* SAPHANAManaged: use this option if you want to perform database processing with SAP HANA.
Valid Values:

* VeeamManaged
* SAPHANAManaged

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRSAPHANALogBackupMode]`|false   |named   |False        |

#### **RedoLogsBackupPeriod**
Specifies the integer defining the frequency for archived logs backup in minutes. Permitted values: 5 to 480.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
New-VBRSAPHANAProcessingOptions [-LogBackupMode {VeeamManaged | SAPHANAManaged}] [-RedoLogsBackupPeriod <Int32>] [<CommonParameters>]
```
