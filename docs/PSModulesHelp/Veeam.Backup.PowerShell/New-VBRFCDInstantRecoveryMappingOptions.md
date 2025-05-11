New-VBRFCDInstantRecoveryMappingOptions
---------------------------------------

### Synopsis
Defines mapping settings of virtual disks that you want to restore using the Instant FCD Recovery.

---

### Description

This cmdlet creates the VBRFCDInstantRecoveryMappingOptions object.
This object defines mapping settings of virtual disks that you want to restore using the Instant FCD Recovery.
Run the Start-VBRFCDInstantRecovery cmdlet to start the FCD instant recovery session.

---

### Examples
> Example 1. Defining Mapping Settings of all Virtual Disks to Restore Using Instant FCD Recovery

```PowerShell
New-VBRFCDInstantRecoveryMappingOptions -All
This command defines mapping settings of all backed-up virtual disks that you want to restore using the Instant FCD Recovery.
```
> Example 2. Defining Mapping Settings of Specific Virtual Disks to Restore Using Instant FCD Recovery

```PowerShell
New-VBRFCDInstantRecoveryMappingOptions -NameInBackup "Disk1" -MountedDiskName "RestoredDisk1" -RegisteredFCDName "FCD-Disk1"
This command defines mapping settings of specific virtual disks that you want to restore using the Instant FCD Recovery.
```

---

### Parameters
#### **All**
Defines mapping settings for all backed-up virtual disks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **MountedDiskName**
Specifies an array of names for virtual disks that that are mounted to the datastore.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **NameInBackup**
Specifies an array of names for backed-up virtual disks.
The cmdlet will define mapping settings for these disks.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **RegisteredFCDName**
Specifies an array of names for FCDs that are registered on the cluster.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRFCDInstantRecoveryMappingOptions

---

### Notes

---

### Syntax
```PowerShell
New-VBRFCDInstantRecoveryMappingOptions -All [<CommonParameters>]
```
```PowerShell
New-VBRFCDInstantRecoveryMappingOptions -MountedDiskName <String[]> -NameInBackup <String[]> -RegisteredFCDName <String[]> [<CommonParameters>]
```
