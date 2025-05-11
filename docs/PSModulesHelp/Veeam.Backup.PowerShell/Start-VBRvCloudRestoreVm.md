Start-VBRvCloudRestoreVm
------------------------

### Synopsis
Starts a Cloud Director VM restore.

---

### Description

This cmdlet starts a restore session of a selected Cloud Director VM.
With this cmdlet, you can perform the following recover scenarios:
- Restore to the original location
- Restore to another location
- Restore with different settings
- Secure restore of the selected restore point
To restore a VM to the original location you only need to select the required restore point. Be careful to specify the restore point of the VM, not the vApp which is not a valid value for this cmdlet. Veeam Backup & Replication gets all the information needed for restore from the restore point data.
You cannot restore multiple VM with one command, to restore several VMs you need to start a restore session for each one.

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint
Start-VBRvCloudRestoreVm -RestorePoint $restorepoint[1]
The example shows how to start a Cloud Director VM restore to the original location.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCloudRestoreVm cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore point in the array).
> Example 2

$restorepoint = Get-VBRRestorePoint
$vapp = Find-VBRvCloudEntity -VApp
$profile = Find-VBRvCloudEntity -StorageProfile
Start-VBRvCloudRestoreVm -RestorePoint $restorepoint -vApp $vapp -StorageProfile $profile
The example shows how to restore a VM to another vApp with another storage profile.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Find-VBRvCloudEntity cmdlet. Provide the VApp parameter value. Save the result to the $vapp variable.
3. Run the Find-VBRvCloudEntity cmdlet. Provide the StorageProfile parameter value. Save the result to the $profile variable.
4. Run the Start-VBRvCloudRestoreVm cmdlet. Set the $restorepoint as the RestorePoint parameter value. Set the $vapp as the vApp parameter value. Set the $profile as the StorageProfile parameter value.
> Example 3

$restorepoint = Get-VBRRestorePoint
Start-VBRvCloudRestoreVm -RestorePoint $restorepoint[1] -RunAsync -EnableAntivirusScan -EnableEntireVolumeScan -VirusDetectionAction DisableNetwork
The example shows how to run secure restore of the selected VM. The job will run with the following settings:
- Veeam Backup & Replication will scan all volumes of the infected restore points.
- In case the infection is detected, Veeam Backup & Replication will restore the VM with disabled NIC.
- The RunAsync parameter is set to bring the process to the background.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCloudRestoreVm cmdlet.  Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Provide the RunAsync parameter.
- Provide the EnableAntivirusScan parameter.
- Provide the EnableEntireVolumeScan parameter.
- Set the DisableNetwork option for the VirusDetectionAction parameter.

---

### Parameters
#### **EnableAntivirusScan**
Defines that the cmdlet will perform secure restore. Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Enables the antivirus scan for all volumes of the infected restore point.
Use this option if you want to perform secure restore with the following options:
* Continue machine scan after the first virus threat is found
* Get the report on all virus threats

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVmTagsRestore**
Defines that the cmdlet will restore VM tags.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerUp**
If set, the VM will be powered up right after it is restored.
Otherwise you will need to power up the VM manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected VM.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the VM. If you specify no other parameters of the VM, it will be restored with its initial settings, i.e. the datastore or VM template.
This parameter does not accept VM arrays.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StorageProfile**
Specifies the storage profile you want to apply to the restored VM.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|false   |named   |False        |

#### **vApp**
Specifies the vApp where to you want to restore the VM.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|true    |named   |False        |

#### **vCloudDatastore**
Specifies the datastore you want to use with the restored VM.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdDatastoreRestoreInfo]`|false   |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies secure restore action when the virus threat is detected.
* DisableNetwork - use this option if you want to restore VMs in safe state with disabled network adapters (NICs).
* AbortRecovery - use this option if you want to cancel the restore session.
Valid Values:

* DisableNetwork
* AbortRecovery

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRVirusDetectionAction]`|false   |named   |False        |

#### **VMName**
Specifies the VM name you want to apply to the restored VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VmTemplate**
Specifies the template you want to apply to the restored VM.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[IVcdItem]`|false   |named   |False        |

#### **YARAScanRule**
Specifies the YARA rule. Veeam Backup & Replication will scan VMs with this rule.
Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules. To use the Yara rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

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
Start-VBRvCloudRestoreVm [-RestorePoint] <COib> [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableVmTagsRestore] [-EnableYARAScan] [-PowerUp] [-Reason <String>] [-RunAsync] [-StorageProfile 
```
```PowerShell
<CVcdOrgVdcStorageProfile>] -vApp <CVcdVappItem> [-vCloudDatastore <CVcdDatastoreRestoreInfo>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VMName <String>] [-VmTemplate <IVcdItem>] [-YARAScanRule 
```
```PowerShell
<String>] [<CommonParameters>]
```
