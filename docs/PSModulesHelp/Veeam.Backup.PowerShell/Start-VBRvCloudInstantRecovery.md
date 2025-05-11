Start-VBRvCloudInstantRecovery
------------------------------

### Synopsis
Starts an instant recovery of Cloud Director VMs

---

### Description

This cmdlet performs instant recovery of the selected Cloud Director VM. With this cmdlet, you can perform the following recover scenarios:
- Restore to the original location
- Restore to another vApp
- Secure restore of the selected restore point
To restore the VM to another vApp specify the required vApp object for the vApp parameter. To perform restore to the original location, omit this parameter.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

* [Find-VBRViDatastore](Find-VBRViDatastore)

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint
Start-VBRvCloudInstantRecovery -RestorePoint $restorepoint[1]
The example shows how to start instant recovery of the Cloud Director VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCloudInstantRecovery cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore point in the array).
> Example 2

$restorepoint = Get-VBRRestorePoint
$vApp = Find-VBRvCloudEntity -vApp -Name "RestoreVapp"
$datastore = Find-VBRViDatastore -Name "Datastore05"
Start-VBRvCloudInstantRecovery -RestorePoint $restorepoint[1] -vApp $vapp -Datastore $datastore -PowerOn -Reason "Configuration test" -RunAsync
The example shows how to start instant recovery of the Cloud Director VM. The job will run with the following settings:
- The VmName parameter is omitted to restore the VM with its original name.
- The PowerOn parameter is set to power up the VM automatically right after it is restored.
- The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Find-VBRvCloudEntity cmdlet. Provide the vApp parameter. Specify the Name parameter value. Save the result to the $vapp variable.
3. Run the Find-VBRViDatastore cmdlet. Specify the Name parameter value. Save the result to the $datastore variable.
4. Run the Start-VBRvCloudInstantRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore point in the array).
- Set the $vapp variable as the vApp parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Provide the PowerOn parameter.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.

---

### Parameters
#### **Datastore**
Specifies the datastore you want to connect the restored VM to. If ommited, the VM will be connected to the original datastore.
Note: If you restore the VM to another vApp, make sure that the datastore is available in the Organization Cloud Director hosting the vApp to which the VM is restored.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdDatastoreRestoreInfo]`|false   |named   |False        |

#### **EnableAntivirusScan**
Defines that the cmdlet will perform secure restore.
Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Enables the antivirus scan for all volumes of the infected restore point. Use this option if you want to perform secure restore with the following options:
* Continue machine scan after the first virus threat is found.
* Get the report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableTagRestore**
Defines that Veeam Backup & Replication will restore VMware tags.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOn**
Defines that the VM will be powered up right after it is restored. Otherwise you will need to power up the VM manually.

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
Specifies the restore point of the VM.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **vApp**
Specifies the vApp that you want to restore the VM to.
If omitted, the VM will be restored to the original vApp.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|false   |named   |False        |

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

#### **VmName**
Specifies the name under which the VM should be restored and registered.
By default, the original name of the VM is used.
If you are restoring the VM to the same vApp where the original VM is registered and the original VM still resides there, it is recommended that you change the VM name to avoid conflicts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRvCloudInstantRecovery [-RestorePoint] <COib> [-Datastore <CVcdDatastoreRestoreInfo>] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableTagRestore] [-EnableYARAScan] [-PowerOn] [-Reason <String>] 
```
```PowerShell
[-RunAsync] [-vApp <CVcdVappItem>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VmName <String>] [-YARAScanRule <String>] [<CommonParameters>]
```
