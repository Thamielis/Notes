Set-VBRSAPHANAProcessingOptions
-------------------------------

### Synopsis
Modifies the SAP HANA database processing settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP HANA.

This cmdlet modifies SAP HANA database processing settings. You can modify the following options:
- The way Veeam Backup & Replication will process archived logs.
- Schedule settings for archived logs processing.

---

### Related Links
* [New-VBRSAPHANAProcessingOptions](New-VBRSAPHANAProcessingOptions)

---

### Examples
> Example - Creating and Modifying SAP HANA Database Processing Settings for Application Backup Policies for Veeam Plug-in for SAP HANA

$processoptions = New-VBRSAPHANAProcessingOptions -ArchiveLogBackupPeriod 15 -ArchivedLogAction SAPHANAManaged
Set-VBRSAPHANAProcessingOptions -Options $processoptions -ArchiveLogBackupPeriod 30
This example shows how to create an SAP HANA database processing settings for application backup policies for Veeam Plug-in for SAP HANA. The modified policy will back up archived logs every 30 minutes.

You must perform the following steps:
1. Run the New-VBRSAPHANAProcessingOptions cmdlet. Specify the ArchiveLogBackupPeriod and ArchivedLogAction parameter values. Save the result to the $processoptions variable.
2. Run the Set-VBRSAPHANAProcessingOptions cmdlet. Set the $processoptions variable as the Options parameter value. Specify the ArchiveLogBackupPeriod parameter value.

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

#### **Options**
Specifies the database processing options that you plan to modify. Accepts the VBRSAPHANAProcessingOptions object.  To get this object, run the New-VBRSAPHANAProcessingOptions cmdlet.

|Type                           |Required|Position|PipelineInput |
|-------------------------------|--------|--------|--------------|
|`[VBRSAPHANAProcessingOptions]`|true    |named   |True (ByValue)|

#### **RedoLogsBackupPeriod**
Specifies the integer defining the frequency for archived logs backup in minutes. Permitted values: 5 to 480.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSAPHANAProcessingOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSAPHANAProcessingOptions [-LogBackupMode {VeeamManaged | SAPHANAManaged}] -Options <VBRSAPHANAProcessingOptions> [-RedoLogsBackupPeriod <Int32>] [<CommonParameters>]
```
