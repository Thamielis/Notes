New-VBRSAPOnOracleStorageOptions
--------------------------------

### Synopsis
Creates the SAP on Oracle storage settings for application backup policies.

---

### Description

This cmdlet applies to application backup policies for Veeam Plug-in for SAP on Oracle. This cmdlet creates SAP on Oracle storage settings. You can set up the data compression mode.

---

### Examples
> Example - Creating SAP on Oracle Storage Settings for Application Backup Policies for Veeam Plug-in for SAP on Oracle

```PowerShell
New-VBRSAPOnOracleStorageOptions -CompressionEnabled -CompressionMode RMAN
This command creates SAP on Oracle storage settings for application backup policies for Veeam Plug-in for SAP on Oracle. The policy will apply compression to backups using Oracle tools.
```

---

### Parameters
#### **CompressionEnabled**
Defines that the application backup policy will apply compression to backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **CompressionMode**
Specifies the compression level of backups:
* Veeam: use this option if you want to perform default data compression with Data Mover by Veeam Software.
* RMAN: use this option if you want to perform data compression with Oracle RMAN.
Valid Values:

* Veeam
* RMAN

|Type                                    |Required|Position|PipelineInput|
|----------------------------------------|--------|--------|-------------|
|`[VBRApplicationStorageCompressionMode]`|false   |named   |False        |

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
New-VBRSAPOnOracleStorageOptions [-CompressionEnabled] [-CompressionMode {Veeam | RMAN}] [<CommonParameters>]
```
