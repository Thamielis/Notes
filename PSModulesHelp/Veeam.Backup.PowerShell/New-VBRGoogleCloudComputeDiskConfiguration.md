New-VBRGoogleCloudComputeDiskConfiguration
------------------------------------------

### Synopsis
Creates storage volume settings for Google Cloud instances.

---

### Description

This cmdlet creates the VBRGoogleCloudComputeDiskConfiguration object.
This object contains disk types of Google Cloud instances.
Veeam Backup & Replication will use the specified type when restoring machines to Google Cloud.

---

### Examples
> Defining Standard Persistent Disks

```PowerShell
$diskconfig = New-VBRGoogleCloudComputeDiskConfiguration -DiskName "srv20.vhdx" -DiskType StandardPersistent
This command defines that the srv20.vhdx disk will be restored to Google Cloud VM instance as a standard persistent disk.
```

---

### Parameters
#### **DiskName**
Specifies the disk of the source machine.
Veeam Backup & Replication will restore this disk to Google Cloud.
Note: You must specify the disk name in the "VMNAME.vhdx" format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **DiskType**
Specifies the storage volume type.
Veeam Backup & Replication will save disks of the restored machine as Google Cloud Engine (GCE) disks.
You can select the following types of GCE disks:
* BalancedPersistent - use this option to create balanced persistent disks.
* SSDPersistent - use this option to create SSD persistent disks.
* StandardPersistent - use this option to create standard persistent disks.
Valid Values:

* BalancedPersistent
* SSDPersistent
* StandardPersistent

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeDiskType]`|true    |named   |False        |

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
New-VBRGoogleCloudComputeDiskConfiguration -DiskName <String> -DiskType {BalancedPersistent | SSDPersistent | StandardPersistent} [<CommonParameters>]
```
