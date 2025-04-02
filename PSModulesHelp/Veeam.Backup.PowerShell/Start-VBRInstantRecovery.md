Start-VBRInstantRecovery
------------------------

### Synopsis
Starts VMware Instant Recovery.

---

### Description

This cmdlet starts VM instant recovery.  With this cmdlet, you can perform the following recover scenarios:
· Restore to original location
· Restore to original location with different settings
· Restore to another location
· Secure restore

---

### Examples
> Example 1

$backup = Get-VBRBackup -Name "Support Backup"  
$restorepoint = Get-VBRRestorePoint -Backup $backup | Sort-Object -Property CreationTime -Descending | Select -First 1  
$server = Get-VBRServer -Type ESXi -Name esx02.support.local  
Start-VBRInstantRecovery -RestorePoint $restorepoint -Server $server
This example shows how to restore a VM to its original location and to the latest restore point.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Get the most recent VM restore point:
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value.
- Pipe the cmdlet output to the Sort-Object method to filter restore points by the CreationTime property.
- Save the result to the $restorepoint variable.
3. Run the Get-VBRServer cmdlet. Set the ESXi option for the Type parameter. Specify the Name parameter value. Save the result to the $server variable.
If you do not know the name of the source ESXi host, you can get it from the properties of the VM restore point. To do that, run the $restorepoint.AuxData.EsxName command. PowerShell will return the name of the source ESXi host.
4. Run the Start-VBRInstantRecovery cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the Server parameter value.
> Example 2

$restorepoint = Get-VBRRestorePoint
$server = Get-VBRServer -Name support.north.local
$pool = Find-VBRViResourcePool -Name "ResourcePool_9"
$store = Find-VBRViDatastore -Name "Datastore_5"
$folder = Find-VBRViFolder -Name "VM_recovery"
Start-VBRInstantRecovery -RestorePoint $restorepoint -VMName "MSExchange_Restored" -Server $server -ResourcePool $pool -Datastore $store -Folder $folder -PowerUp:$true -NICsEnabled:$true -Reason "Data recovery" -RunAsync
This example shows how to restore the VM to another location with different settings. The job will run with the following settings:

- The name of the restored VM is MSExchange_Restored.
- The PowerUp parameter is used to enable the auto power up of the restored VM.
- The NICsEnabled parameter is used to connect the restored VM to the host network.
- The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Find-VBRViResourcePool cmdlet. Specify the Name parameter value. Save the result to the $pool variable.
4. Run the Find-VBRViDatastore cmdlet. Specify the Name parameter value. Save the result to the $store variable.
5. Run the Find-VBRViFolder cmdlet. Specify the Name parameter value. Save the result to the $folder variable.
6. Run the Start-VBRInstantRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Specify the VMName parameter value.
- Set the $server variable as the Server parameter value.
- Set the $pool variable as the ResourcePool parameter value.
- Set the $store variable as the Datastore parameter value.
- Set the $folder variable as the Folder parameter value.
- Provide the PowerUp and NICsEnabled parameters.
- Specify the Reason parameter value.
- Provide the RunAsync parameter.
> Example 3

$restorepoint = Get-VBRRestorePoint
Start-VBRInstantRecovery -RestorePoint $restorepoint[1] -RunAsync -EnableAntivirusScan -EnableEntireVolumeScan -VirusDetectionAction AbortRecovery
The example shows how to perform secure restore of the selected VM.
The restore session will run with the following settings:
· The antivirus will continue VM scan after the first virus threat is found.
· In case the threat is detected, Veeam Backup & Replication will cancel the restore session.
· The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRInstantRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the second restore point is used.
- Provide the RunAsync parameter.
- Provide the EnableAntivirusScan parameter.
- Provide the EnableEntireVolumeScan parameter.
- Set the AbortRecovery option for the VirusDetectionAction parameter.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the VM.
Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Datastore**
For restore to another location.
Specifies the datastore to which you want to store the changes made to the VM during the Instant Recovery. Veeam Backup & REplication will redirect the redo logs to the selected datastore.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables the secure restore option. Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Defines that the antivirus will continue VMs scan after the first virus threat is found. Use this option if you want to get the report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableTagRestore**
Enables the option to restore VMware tags.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Folder**
For restore to another location.
Specifies the folder where you want to locate the restored VM.
Accepts the CViFolderItem object. To get this object, run the Find-VBRViEntity cmdlet.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform VM restore even if the geographic location of the repository where VM backups reside and the target host location does not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GenerateNewSystemUUID**
Defines that the cmdlet will generate a new system UUID for the restored machine.
Note: Currently this parameter supports only the $false value: GenerateNewSystemUUID:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NICsEnabled**
If set to True, the restored VM will be connected to the network.
Otherwise the VM will have no network connections.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerUp**
If set to True, the restored VM will be powered up immediately after the restore.
Otherwise, you will have to power up the VM manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected VM. The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ResourcePool**
For restore to another location.
Specifies the resource pool where you want to locate the restored VM.
Accepts the CViResourcePoolItem object. To get this object, run the Find-VBRViResourcePool cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |2       |False        |

#### **RestorePoint**
Specifies the restore point to which you want to recover the VM.
Accepts the COib object. To create this object, run the Get-VBRRestorePoint cmdlet.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Indicates that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
For restore to another location.
Specifies the target ESXi host where you want to locate the restored VM.
Note: You must not specify a vCenter Server in this parameter.
Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |1       |False        |

#### **SourceNetwork**
For restore to another location.
Specifies the source site network.
Veeam Backup & Replication will map it to the target network.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile that must be applied to the restored virtual disks.
Accepts the VBRViStoragePolicy object. To get this object, run the Find-VBRViStoragePolicy cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **TargetNetwork**
For restore to another location.
Specifies the target site network. Veeam Backup & Replication will map it with the source network.
Accepts the VBRViNetworkInfo[] object. To get this object, run the Get-VBRViServerNetworkInfo cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies the secure restore action when the infection is detected.
· DisableNetwork - use this option if you want to restore VMs with disabled network adapters (NICs).
· AbortRecovery - use this option if you want to cancel the restore session.
Valid Values:

* DisableNetwork
* AbortRecovery

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRVirusDetectionAction]`|false   |named   |False        |

#### **VMName**
Specifies the name you want to apply to the restored VM.
By default, the original VM name is applied.

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
Start-VBRInstantRecovery [-RestorePoint] <COib> [-Server] <CHost> [[-ResourcePool] <CViResourcePoolItem>] [-Credentials <CCredentials>] [-Datastore <CViDatastoreItem>] [-EnableAntivirusScan] 
```
```PowerShell
[-EnableEntireVolumeScan] [-EnableTagRestore] [-EnableYARAScan] [-Folder <CViFolderItem>] [-Force] [-GenerateNewSystemUUID] [-NICsEnabled] [-PowerUp] [-Reason <String>] [-RunAsync] [-SourceNetwork 
```
```PowerShell
<VBRViNetworkInfo[]>] [-StoragePolicy <VBRViStoragePolicy>] [-TargetNetwork <VBRViNetworkInfo[]>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VMName <String>] [-YARAScanRule <String>] 
```
```PowerShell
[<CommonParameters>]
```
