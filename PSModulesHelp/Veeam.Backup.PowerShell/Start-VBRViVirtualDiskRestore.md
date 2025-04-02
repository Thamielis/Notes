Start-VBRViVirtualDiskRestore
-----------------------------

### Synopsis
Starts VMware VM virtual disk restore.

---

### Description

This cmdlet starts a VMware VM virtual disk restore.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRViVirtualDevice](Get-VBRViVirtualDevice)

* [New-VBRViVirtualDeviceMappingRule](New-VBRViVirtualDeviceMappingRule)

---

### Examples
> Starting Restore of Backed Up Virtual Disks

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
$rule1 = New-VBRViVirtualDeviceMappingRule -SourceVirtualDevice $disks[0]
$rule2 = New-VBRViVirtualDeviceMappingRule -SourceVirtualDevice $disks[1]
$mappingrules = $rule1, $rule2
Start-VBRViVirtualDiskRestore -RestorePoint $restorepoint -VirtualDeviceMapping $mappingrules
This example shows how to start restore virtual disks of the VM that is backed up by the Winsrv4515 job. The cmdlet will attach virtual disks to the original VM.

Perform the following steps:

1. Get the backed-up VM virtual disks:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Specify the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point.
c. Run the Get-VBRViVirtualDevice cmdlet. Specify the RestorePoint parameter value. Save the result to the $disks variable.
The Get-VBRViVirtualDevice cmdlet will return an array of disks. Mind the ordinal number of the necessary disk.
2. Create a list of mapping rules:
a. Run the New-VBRViVirtualDeviceMappingRule cmdlet. Specify the SourceVirtualDevice parameter value. Save the result to the $rule1 variable.
b. Run the New-VBRViVirtualDeviceMappingRule cmdlet. Specify the SourceVirtualDevice parameter value. Save the result to the $rule2 variable.
c. Save the $rule1 and $rule2 variables as a list into the $mappingrules variable.
3. Run the Start-VBRViVirtualDiskRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $mappingrules variable as the VirtualDeviceMapping parameter value.

---

### Parameters
#### **AbortRecovery**
Defines that the cmdlet will cancel the restore session when the infection is detected.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DiskType**
Specifies the virtual disk type settings.
The cmdlet will set the virtual disks types to the specified type during the restore.
You can specify one of the following disk types:
* AsSource
* Thin
* LazyZeroed
* EagerZeroed
Default: AsSource
Valid Values:

* AsSource
* Thin
* LazyZeroed
* EagerZeroed

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRViDiskType]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables the secure restore option.
Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Defines that the antivirus will continue VMs scan after the first virus threat is found. Use this option if you want to get the report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
Defines that the cmdlet will start VMs immediately after the restore process is complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Proxy**
Specifies the backup proxy that the cmdlet will use to transport the restored data to the to the target datastore.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **QuickRollback**
Defines that the cmdlet will apply the quick rollback option.
Use this option if you want to restore virtual disks to the original location and with original format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies a reason for performing a restore of virtual disks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point of VMs.
The cmdlet will restore virtual disks of these VMs.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the cmdlet will perform restore of VM virtual disks even if the geographical location of the repository where backups of VM virtual disks reside and the target host location does not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShareCredentials**
For restore to different VM.
Specifies credentials that you want to use to authenticate with the VM to which you attach restored virtual disks.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **TargetVM**
Specifies a target VM.
The cmdlet will attach restored virtual disks to this VM.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|false   |named   |False        |

#### **VirtualDeviceMapping**
Specifies an array of mapping settings for backed-up virtual disks.
The cmdlet will attach virtual disks to the datastore according to these settings.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRViVirtualDeviceMappingRule[]]`|true    |named   |False        |

#### **YARAScanRule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the Yara rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRSession

---

### Notes

---

### Syntax
```PowerShell
Start-VBRViVirtualDiskRestore [-AbortRecovery] [-DiskType {AsSource | Thin | LazyZeroed | EagerZeroed}] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Force] [-PowerOn] [-Proxy 
```
```PowerShell
<CViProxy[]>] [-QuickRollback] [-Reason <String>] -RestorePoint <COib> [-RunAsync] [-ShareCredentials <CCredentials>] [-TargetVM <CViVmItem>] -VirtualDeviceMapping <VBRViVirtualDeviceMappingRule[]> 
```
```PowerShell
[-YARAScanRule <String>] [<CommonParameters>]
```
