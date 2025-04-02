Set-NaHostDisk
--------------

### Synopsis
Set basic Windows disk options (offline, online, partition style).

---

### Description

Set basic Windows disk options (offline, online, partition style).

This cmdlet must be run with administrative privileges and is only supported on Windows Vista sp1, Server 2008 or later.

---

### Related Links
* [Get-NaHostDisk](Get-NaHostDisk)

* [Initialize-NaHostDisk](Initialize-NaHostDisk)

---

### Examples
> Example 1

```PowerShell
Set-NaHostDisk 4 -Offline
Set disk 4 offline
```

---

### Parameters
#### **DiskIndex**
A windows disk index/number

|Type      |Required|Position|PipelineInput                 |Aliases       |
|----------|--------|--------|------------------------------|--------------|
|`[UInt32]`|true    |1       |true (ByValue, ByPropertyName)|Disk<br/>Index|

#### **PartitionStyle**
Partition style (Gpt or Mbr)
Valid Values:

* Unknown
* Mbr
* Gpt

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PartitionStyle]`|true    |2       |false        |

#### **Online**
Bring the disk online

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |2       |false        |

#### **ReadOnly**
Bring the disk online in a read-only state

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Offline**
Bring the disk offline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |2       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.HostUtilities.DiskDiscovery.DiskResource

---

### Notes
Category: host

---

### Syntax
```PowerShell
Set-NaHostDisk [-DiskIndex] <UInt32> [-PartitionStyle] <PartitionStyle> [<CommonParameters>]
```
```PowerShell
Set-NaHostDisk [-DiskIndex] <UInt32> [-Online] [-ReadOnly] [<CommonParameters>]
```
```PowerShell
Set-NaHostDisk [-DiskIndex] <UInt32> [-Offline] [<CommonParameters>]
```
