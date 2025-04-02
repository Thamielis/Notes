Publish-VBRBackupDisk
---------------------

### Synopsis
Warning!  This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **AllowedIps**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |1       |False        |

#### **DecodeParameters**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DiskNames**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **EnableNamesFilter**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ParentSessionTag**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Reason**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TierUsagePolicy**

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRTierUsagePolicy]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRBackupDiskPublicationSession

---

### Notes

---

### Syntax
```PowerShell
Publish-VBRBackupDisk [-RestorePoint] <COib> [-AllowedIps] <String[]> [-DecodeParameters] [-DiskNames <String[]>] [-EnableNamesFilter] [-ParentSessionTag <String>] [-Reason <String>] [-RunAsync] 
```
```PowerShell
[-TierUsagePolicy {ForcePerformanceTier | ForceCapacityTier | ForceArchiveTier}] [<CommonParameters>]
```
