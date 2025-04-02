Initialize-NaHostDisk
---------------------

### Synopsis
Initialize a Windows disk with basic partition layout information.

---

### Description

Initialize a Windows disk with basic partition layout information.

This cmdlet must be run with administrative privileges.

---

### Related Links
* [Get-NaHostDisk](Get-NaHostDisk)

* [Set-NaHostDisk](Set-NaHostDisk)

* [New-NaHostVolume](New-NaHostVolume)

---

### Examples
> Example 1

```PowerShell
Initialize-NaHostDisk 4 -PartitionStyle Gpt
Initialize a host disk by disk number.
```
> Example 2

```PowerShell
Get-NaHostDisk -Uninitialized | Initialize-NaHostDisk
Initialize all uninitialized host disks.
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
|`[PartitionStyle]`|false   |2       |false        |

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
Initialize-NaHostDisk [-DiskIndex] <UInt32> [[-PartitionStyle] <PartitionStyle>] [<CommonParameters>]
```
