Set-VBRBackupCacheOptions
-------------------------

### Synopsis
Modifies backup cache settings.

---

### Description

This cmdlet modifies backup cache settings.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [New-VBRBackupCacheOptions](New-VBRBackupCacheOptions)

---

### Examples
> Example 1. Modifying Location Option

$options = New-VBRBackupCacheOptions -Enable -Type Manual -LocalPath "C:\Backup" -SizeLimit 10 -SizeUnit TB
Set-VBRBackupCacheOptions -Options $options -Type Automatic
This example shows how to modify the location to keep cached data. The cmdlet will change location option from the manual selection to the automatic selection.
Perform the following steps:
1. Run the New-VBRBackupCacheOptions cmdlet. Provide the Enable parameter. Specify the Type, LocalPath, SizeLimit and SizeUnit parameter values. Save the result to the $options variable.
2. Run the Set-VBRBackupCacheOptions cmdlet. Set the $options variable as the Options parameter value. Set the Automatic option for the Type parameter.
> Example 2. Modifying Size Limit of Backup Cache

$options = New-VBRBackupCacheOptions -Enable -Type Manual -LocalPath "C:\Backup" -SizeLimit 10 -SizeUnit TB
Set-VBRBackupCacheOptions -Options $options -SizeLimit 15
This example shows how to modify size limits of backup cache. The cmdlet will change size limits from 10 TB to 15 TB.
Perform the following steps:
1. Run the New-VBRBackupCacheOptions cmdlet. Provide the Enable parameter. Specify the Type, LocalPath, SizeLimit and SizeUnit parameter values. Save the result to the $options variable.
2. Run the Set-VBRBackupCacheOptions cmdlet. Set the $options variable as the Options parameter value. Specify the SizeLimit parameter value.

---

### Parameters
#### **Enable**
Defines that the backup cache option is enabled.
If you provide this parameter, backup files will remain in the cache of the protected computers until these computers are able to connect to Veeam Backup & Replication.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LocalPath**
For the Manual option of the Type parameter.
Specifies a path to the folder on a protected computer. The cmdlet will keep the cached data in the specified folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Options**
Specifies backup cache settings that you want to modify.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRBackupCacheOptions]`|true    |named   |True (ByValue)|

#### **SizeLimit**
Specifies a size limit of a backup cache file in numbers. Veeam Backup & Replication will remove backup cache data from the folder when this limit is exceeded.
Provide the SizeUnit parameter to specify the unit of measure.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SizeUnit**
For the SizeLimit option.
Specifies the unit of measure to keep backup cache files. You can specify either of the following units:
* GB
* TB
Valid Values:

* GB
* TB

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupCacheSizeUnit]`|false   |named   |False        |

#### **Type**
Specifies how to choose the location to keep cached data. You can specify one of the following options:
* Automatic: use this option if you want Veeam Backup & Replication to define the cached data location automatically on every computer.
* Manual: use this option if you want explicitly define the location to keep cached data on every computer. Provide the LocalPath parameter to specify a path to the folder where the cached data must be stored.
Valid Values:

* Automatic
* Manual

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRBackupCacheSelectionType]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRBackupCacheOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRBackupCacheOptions [-Enable] [-LocalPath <String>] -Options <VBRBackupCacheOptions> [-SizeLimit <Int32>] [-SizeUnit {GB | TB}] [-Type {Automatic | Manual}] [<CommonParameters>]
```
