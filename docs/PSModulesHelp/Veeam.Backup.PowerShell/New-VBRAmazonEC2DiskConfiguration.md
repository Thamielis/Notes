New-VBRAmazonEC2DiskConfiguration
---------------------------------

### Synopsis
Creates storage volume settings for Amazon EC2 instances.

---

### Description

This cmdlet creates the VBRAmazonEC2DiskConfiguration object.
This object contains storage volume settings for Amazon EC2 instances.

---

### Examples
> Example 1

```PowerShell
$volumesettings = New-VBRAmazonEC2DiskConfiguration -DiskName "srv20.vhdx" -Include -DiskType ColdHDD
This command defines settings for Cold HDD storage volume of Amazon EC2 instances. Save the result to the variable to be used with the other cmdlets.
```

---

### Parameters
#### **DiskName**
Specifies the disk of the source machine.
Veeam Backup & Replication will restore this disk to Amazon EC2.
Note: You must specify the disk name in the "VMNAME.vhdx" format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **DiskType**
Specifies the storage volume type.
Veeam Backup & Replication will saves disks of the restored machine as Amazon Elastic Block Store (EBS) volumes.
You can select the following types of EBS volumes:
* GeneralPurposeSSD - use this option to create General Purpose SSD volumes.
* ProvisionedIOPSSSD - use this option to create Provisioned IOPS SSD volumes.
* ColdHDD - use this option to create Cold HDD volumes.
* ThroughtputOptimizedHDD - use this option to create Throughput Optimized HDD volumes.
* Magnetic - use this option to create Magnetic volumes.
Valid Values:

* GeneralPurposeSSD
* ProvisionedIOPSSSD
* ColdHDD
* ThroughtputOptimizedHDD
* Magnetic
* GeneralPurposeSSD3
* ProvisionedIOPSSSD2

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRAmazonEC2DiskType]`|false   |named   |False        |

#### **Include**
Defines that Veeam Backup & Replication will restore selected disks to Amazon EC2.
Default: True
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ProvisionedIOPSNumber**
For the ProvisionedIOPSSSD option.
Specifies the number of input/output operations per second for the volume.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
New-VBRAmazonEC2DiskConfiguration -DiskName <String> [-DiskType {GeneralPurposeSSD | ProvisionedIOPSSSD | ColdHDD | ThroughtputOptimizedHDD | Magnetic | GeneralPurposeSSD3 | ProvisionedIOPSSSD2}] [-Include] 
```
```PowerShell
[-ProvisionedIOPSNumber <Int32>] [<CommonParameters>]
```
