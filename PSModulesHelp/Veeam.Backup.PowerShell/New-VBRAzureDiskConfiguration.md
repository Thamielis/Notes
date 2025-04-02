New-VBRAzureDiskConfiguration
-----------------------------

### Synopsis
Defines Azure VM disk types.

---

### Description

This cmdlet creates the VBRAzureDiskConfiguration object that defines Azure VM disk types. Veeam Backup & Replication will attach disks of these types to the restored workloads.

For more information on disk types, see Microsoft Docs.

---

### Examples
> Defining Azure VM Disk Types

```PowerShell
New-VBRAzureDiskConfiguration -DiskName "srv20" -DiskType StandardHDD -Include
This command defines the StandardHDD Azure VM disk types named srv20.
```

---

### Parameters
#### **DiskName**
Specifies a new disk name.
The cmdlet will allocate an Azure VM disk with this name to the restored workloads.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **DiskType**
Specifies the type of the disk that Veeam Backup & Replication will attach to the restored workloads. You can specify the following type:
* StandardHDD
* StandardSSD
* PremiumSSD
Valid Values:

* StandardHDD
* StandardSSD
* PremiumSSD

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAzureDiskType]`|true    |named   |False        |

#### **Include**
Defines that the cmdlet will attach an Azure VM disk to the restored workloads.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBRAzureDiskConfiguration -DiskName <String> -DiskType {StandardHDD | StandardSSD | PremiumSSD} [-Include] [<CommonParameters>]
```
