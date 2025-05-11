Get-ComputerDiskLogical
-----------------------

### Synopsis
Retrieves logical disk information for specified computers.

---

### Description

This function retrieves logical disk information for the specified computers. It provides details such as DeviceID, DriveType, ProviderName, FreeSpace, UsedSpace, TotalSpace, FreePercent, UsedPercent, and VolumeName.

---

### Examples
> EXAMPLE 1

Get-ComputerDiskLogical -ComputerName AD1, AD2, EVOWIN -OnlyLocalDisk | ft -AutoSize
Output:

ComputerName DeviceID DriveType  ProviderName FreeSpace UsedSpace TotalSpace FreePercent UsedPercent VolumeName
------------ -------- ---------  ------------ --------- --------- ---------- ----------- ----------- ----------
AD2          C:       Local Disk                  96,96     29,49     126,45       76,68       23,32
AD1          C:       Local Disk                 103,17     23,28     126,45       81,59       18,41
EVOWIN       C:       Local Disk                 133,31    343,03     476,34       27,99       72,01
EVOWIN       D:       Local Disk                   2433     361,4    2794,39       87,07       12,93 Media
EVOWIN       E:       Local Disk                  66,05     399,7     465,75       14,18       85,82 Testing Environment

---

### Parameters
#### **ComputerName**
Specifies the names of the computers for which to retrieve disk information.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Protocol**
Specifies the protocol to use for retrieving disk information. Valid values are 'Default', 'Dcom', and 'Wsman'.
Valid Values:

* Default
* Dcom
* Wsman

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Size**

Valid Values:

* GB
* TB
* MB

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **RoundingPlace**
Specifies the number of decimal places to round the disk space values to.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **RoundingPlacePercent**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **OnlyLocalDisk**
Indicates that only local disks should be included in the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **All**
Indicates that information for all disks should be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Additional notes about the function.

---

### Syntax
```PowerShell
Get-ComputerDiskLogical [[-ComputerName] <String[]>] [[-Protocol] <String>] [[-Size] <String>] [[-RoundingPlace] <Int32>] [[-RoundingPlacePercent] <Int32>] [-OnlyLocalDisk] [-All] [<CommonParameters>]
```
