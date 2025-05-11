Start-VBRComputerVolumeRestore
------------------------------

### Synopsis
Starts restore to original location of computer volumes backed-up with Veeam Agent For Microsoft Windows.
IMPORTANT!
This cmdlet is available starting from Veeam Backup & Replication 11a (build 11.0.1.1261).

---

### Description

This cmdlet starts restore to original location of computer volumes backed-up with Veeam Agent for Microsoft Windows.
IMPORTANT!
Consider the following:
- The cmdlet does not support the disk mapping option. All disks are restored to the original location.
- Restore of system OS volumes to original location is not supported.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRComputerDiskPartition](Get-VBRComputerDiskPartition)

---

### Examples
> Starting Restore to Original Location of Computer Volumes Backed-Up with Veeam Agent for Microsoft Windows

$backup = Get-VBRBackup -Name "WinLaptop2017*"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$volume = Get-VBRComputerDiskPartition -RestorePoint $restorepoint[3]
Start-VBRComputerVolumeRestore -RestorePoint $restorepoint[3] -Volumes $volume[2] -EnableAntivirusScan -EnableEntireVolumeScan -Force
This example shows how to start a volume-level restore of the WinLaptop2017 computer.
Perform the following steps:
1. 1. Get the restore point:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint cmdlet will not return any restore points for the Veeam Agent job.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
2. Run the Get-VBRComputerDiskPartition cmdlet. Set the $restorepoint[3] variable as the RestorePoint parameter value. Save the result to the $volume variable.
The Get-VBRComputerDiskPartition cmdlet will return an array of volumes. Mind the ordinal number of the necessary volumes (in our example, it is the third volume in the array).
3. Run the Start-VBRComputerVolumeRestore cmdlet. Specify the following settings:
- Set the $restorepoint[3] variable as the RestorePoint parameter value.
- Set the $volume[2] variable as the Volumes parameter value.
- Provide the EnableAntivirusScan parameter.
- Provide the EnableEntireVolumeScan parameter.
- Provide the Force parameter.

---

### Parameters
#### **EnableAntivirusScan**
Enables the option to perform secure restore.
If you provide this parameter, Veeam Backup & Replication will trigger the antivirus software to scan selected computer volumes before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Defines that the antivirus will continue computer volumes scan after the first virus threat is found. If you provide this parameter, the cmdlet will generate a report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will start restore without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies a reason of volume-level restore.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point of computers. The cmdlet will restore volumes these computers.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Volumes**
Specifies an array of computer volumes that you want to restore.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRComputerDiskPartition[]]`|false   |named   |False        |

#### **YARAScanRule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the Yara rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRComputerVolumeRestore [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Force] [-Reason <String>] -RestorePoint <COib> [-RunAsync] [-Volumes <VBRComputerDiskPartition[]>] 
```
```PowerShell
[-YARAScanRule <String>] [<CommonParameters>]
```
