New-VBROracleRMANStorageOptions
-------------------------------

### Synopsis
Creates the Oracle RMAN storage settings for application backup policies.

---

### Description

This cmdlet creates Oracle RMAN storage settings. You can set up the following options:
- Data compression mode.
- Data compression level.

---

### Examples
> Example - Creating Oracle RMAN Storage Settings for Application Backup Policies for Veeam Plug-in for Oracle RMAN

```PowerShell
New-VBROracleRMANStorageOptions -CompressionEnabled -CompressionMode RMAN -RMANCompressionLevel Low
This command creates an Oracle RMAN storage settings for application backup policies for Veeam Plug-in for Oracle RMAN. The policy will apply low compression to backups using Oracle tools.
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

#### **RMANCompressionLevel**
This parameter applies only with CompressionMode specified as RMAN. Specifies the compression level of backups:
* Basic: use this option to set a basic compression level.
* Low: use this option to set a low compression level.
* Medium: use this option to set a medium compression level.
* High: use this option to set a high compression level.
Valid Values:

* Basic
* Low
* Medium
* High

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRRMANCompressionLevel]`|false   |named   |False        |

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
New-VBROracleRMANStorageOptions [-CompressionEnabled] [-CompressionMode {Veeam | RMAN}] [-RMANCompressionLevel {Basic | Low | Medium | High}] [<CommonParameters>]
```
