Start-VBRScanBackup
-------------------

### Synopsis
Starts a scan of backups with antivirus or YARA scan.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet starts a scan of backups with antivirus or YARA scan. You can scan the following types of backups:
- Backups of VMware vSphere virtual machines created by Veeam Backup & Replication.
- Backups of Microsoft Hyper-V virtual machines created by Veeam Backup & Replication.
- Backups created by backup copy jobs.
- Backups of Nutanix AHV virtual machines created by Veeam Backup for Nutanix AHV.
- Backups of RHV VMs created by Veeam Backup for Oracle Linux Virtualization Manager and Red Hat Virtualization.
- Backups of Windows machines created by Veeam Agent For Microsoft Windows.
- Backup of VMware Cloud Director VMs.

---

### Related Links
* [Get-VBRYARARule](Get-VBRYARARule)

* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRBackupObject](Get-VBRBackupObject)

---

### Examples
> Scanning Backups with YARA Scan

$yararule = Get-VBRYARARule
$backup = Get-VBRBackup
$vmbackup = Get-VBRBackupObject -Backup $backup[0]
Start-VBRScanBackup -Object $vmbackup[0] -ScanMode FirstInInterval -EnableYARAScan -YARARule $yararule[0]
This example shows how scan backups with YARA scan.
Perform the following steps:
1. Run the Get-VBRYARARule cmdlet. Save the result to the $yararule variable.
2. Run the Get-VBRBackup cmdlet. Save the result to the $backup variable.
3. Run the Get-VBRBackupObject cmdlet. Specify the Backup parameter value. Save the result to the $vmbackup variable.
The Get-VBRBackupObject cmdlet will return an array of VM backups. Mind the ordinal number of the necessary VM backup (in our example, it is the first VM backup in the array).
4. Run the Start-VBRScanBackup cmdlet. Specify the following settings:
- Set the $vmbackup[0] variable as the Object parameter value.
- Set the FirstInInterval option for the ScanMode parameter.
- Provide the EnableYARAScan parameter.
- Set the $yararule[0] variable as the YARARule parameter value.

---

### Parameters
#### **EnableAntivirusScan**
Enables secure restore.
If you provide this parameter, Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireImageScan**
Defines that the cmdlet will scan all restore points in backup even after it finds the first affected restore point.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Defines that Veeam Backup & Replication will scan VMs with the specified YARA rule.
If you do not provide this parameter, Veeam Backup & Replication will not scan VMs with the YARA rule.
Use the YARARule parameter to specify the YARA rule.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromPointInTime**
Specifies the date and time. The cmdlet will scan backups that were created starting from this date and time.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **Object**
Specifies an array of backups that you want to scan.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRBackupObject[]]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ScanMode**
Specifies one of the following a scan modes:
* AllInInterval - Use this mode to scan backup content with neccessary YARA rules. The cmdlet will scan all restore points sequentially and will initiate a malware event.
Note: If you use this mode, you must provide the EnableYARAScan and YARARule parameters.
* FirstInInterval - Use this mode if you are not sure when the attack started. The cmdlet will scan restore points in optimal order until it finds the malware-free restore point.
* MostRecent - Use this mode if you consider that a cyber-attack started recently. The cmdlet will scan the restore points sequentially, starting from the most resent restore point, until it finds the latest malware-free restore point.
Valid Values:

* MostRecent
* AllInInterval
* FirstInInterval

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRRestorePointScanMode]`|true    |named   |False        |

#### **ToPointInTime**
Specifies the date and time. The cmdlet will scan backups that were created by this date and time.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **YARARule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Note: Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the YARA rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Start-VBRScanBackup [-EnableAntivirusScan] [-EnableEntireImageScan] [-EnableYARAScan] [-FromPointInTime <DateTime>] -Object <VBRBackupObject[]> [-RunAsync] -ScanMode {MostRecent | AllInInterval | 
```
```PowerShell
FirstInInterval} [-ToPointInTime <DateTime>] [-YARARule <String>] [<CommonParameters>]
```
