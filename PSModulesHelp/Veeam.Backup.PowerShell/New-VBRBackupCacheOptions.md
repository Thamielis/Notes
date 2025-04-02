New-VBRBackupCacheOptions
-------------------------

### Synopsis
Defines backup cache settings of Veeam Agent backup job for Microsoft Windows.

---

### Description

This cmdlet creates the VBRBackupCacheOptions object. This object defines backup cache settings of Veeam Agent backup job for Microsoft Windows.
IMPORTANT!
You can apply backup cache settings for Veeam Agent backup jobs that are targeted at the following types of backup location:
- Veeam backup repository.
- Veeam Cloud Connect repository.

---

### Examples
> Example 1. Defining Backup Cache Settings with Automatic Location Option

New-VBRBackupCacheOptions -Enable -Type Automatic -SizeLimit 5 -SizeUnit GB
This command defines the following backup cache settings:
- Veeam Backup & Replication will select the location to keep the backup cache automatically.
- Veeam Agent Backup jobs will not create backup cache files when the backup cache exceeds 5 GB.
> Example 2. Defining Backup Cache Settings with Manual Location Option

New-VBRBackupCacheOptions -Enable -Type Manual -LocalPath "C:\Backup" -SizeLimit 10 -SizeUnit TB
This command defines the following backup cache settings:
- The location to keep backup cache is specified explicitly.
- Veeam Backup & Replication will keep cache in the C:\Backup folder on the protected computer.
- Veeam Agent Backup jobs will not create backup cache files when the backup cache exceeds 10 TB.

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

#### **SizeLimit**
Specifies a size limit of a backup cache file in numbers. Veeam Agent Backup jobs will not add new backup cache files when this limit is exceeded.
Provide the SizeUnit parameter to specify the unit of measure.
Default: 10.
Note: To run the script, you must provide this parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **SizeUnit**
For the SizeLimit option.
Specifies the measure unit of a backup cache size limit. You can specify one of the following units:
* GB
* TB
Default: GB.
Note: To run the script, you must provide this parameter.
Valid Values:

* GB
* TB

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRBackupCacheSizeUnit]`|false   |named   |False        |

#### **Type**
Specifies how to choose the location to keep cached data. You can specify one of the following options:
* Automatic: use this option if you want Veeam Agent automatically define location for the backup cache on on each computer added to the backup policy.
* Manual: use this option if you want explicitly define the location to keep cached data on every computer. Provide the LocalPath parameter to specify a path to the folder where the cached data must be stored.
Default: Automatic.
Valid Values:

* Automatic
* Manual

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRBackupCacheSelectionType]`|false   |named   |False        |

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
New-VBRBackupCacheOptions [-Enable] [-LocalPath <String>] [-SizeLimit <Int32>] [-SizeUnit {GB | TB}] [-Type {Automatic | Manual}] [<CommonParameters>]
```
