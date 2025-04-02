Start-VBRViInstantVMDiskRecovery
--------------------------------

### Synopsis
Starts restore of VM virtual disks from backups.

---

### Description

This cmdlet starts restore of VM virtual disks from backups.
You can publish these to the production environment immediately after performing the restore.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Restoring VM Virtual Disks From Backups

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint
$server = Get-VBRServer -Name "ESXiHost"
$vm = Find-VBRViEntity -Server $server -Name "Winsrv4515"
$device = Get-VBRViVirtualDevice -RestorePoint $restorepoint
Start-VBRViInstantVMDiskRecovery -RestorePoint $restorepoint[3] -TargetVM $vm -TargetVirtualDevice $device
This example shows how to restore VM virtual disks from the Winsrv4515 backup.
The cmdlet will restore virtual disks of the Winsrv4515 VM.
Perform the following steps:
1. Get the restore point:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the fourth restore point will be used.
2. Get the VM.
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Find-VBRViEntity cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save the result to the $vm variable.
3. Run the Get-VBRViVirtualDevice cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
4. Run the Start-VBRViInstantVMDiskRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $vm variable as the TargetVM parameter value.
- Set the $device variable as the TargetVirtualDevice parameter value.

---

### Parameters
#### **EnableAntivirusScan**
Defines that the cmdlet will perform secure restore.
Veeam Backup & Replication will trigger the antivirus software to scan selected VM virtual disks before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Defines that the antivirus will continue scan of VM virtual disks after the first virus threat is found.
Use this option if you want to get the report on all virus threats.

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
Defines that the cmdlet will perform restore of VM virtual disks even if the geographical location of the repository where backups of VM virtual disks reside and the target host location does not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies a reason for performing instant recovery of Veeam Agent computers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point of VMs.
The cmdlet will restore virtual disks of these VMs. Accepts the COib object.
To get this object, run the Get-VBRRestorePoint cmdlet.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShareCredentials**
For restore to different VM.
Specifies credentials that you want to use to authenticate with the VM to which you attach restored virtual disks.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **TargetVirtualDevice**
Specifies an array of target VM device nodes.
The cmdlet will map the virtual disks from backup to the specified node.
Accepts the VBRViVirtualDevice[] object.
To get this object, run the Get-VBRViVirtualDevice cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRViVirtualDevice[]]`|true    |named   |False        |

#### **TargetVM**
Specifies a target VM.
The cmdlet will restore virtual disks to the specified VM.
Accepts the CViVmItem object.
To get this object, run the Find-VBRViEntity cmdlet.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|true    |named   |False        |

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
* Veeam.Backup.PowerShell.Infos.InstantRecovery

---

### Notes

---

### Syntax
```PowerShell
Start-VBRViInstantVMDiskRecovery [-RestorePoint] <COib> [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Force] [-Reason <String>] [-RunAsync] [-ShareCredentials <CCredentials>] 
```
```PowerShell
-TargetVirtualDevice <VBRViVirtualDevice[]> -TargetVM <CViVmItem> [-YARAScanRule <String>] [<CommonParameters>]
```
