Start-VBRViComputerInstantRecovery
----------------------------------

### Synopsis
Starts instant recovery of machines to the VMware infrastructure.

---

### Description

This cmdlet starts an instant recovery of machines to the VMware infrastructure. You can restore the following types of machines:
- Microsoft Windows computers backed up by the Veeam Agent.
- Linux computers backed up by the Veeam Agent.
- Hyper-V workloads to restore them to VMware vSphere VMs.
Run the Start-VBRHvInstantRecovery cmdlet to restore Hyper-V workloads to Hyper-V VMs.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Performing Instant Recovery of Veeam Agent Computer using Specific Restore Point

$backup = Get-VBRBackup -Name "Windows Agent Backup*"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$srv = Get-VBRServer -Name "esx07.tech.local"
Start-VBRViComputerInstantRecovery -RestorePoint $restorepoint[3] -Server $srv -RestoredVMName "WindowsAB_Restored"
This example shows how to perform instant recovery of a Veeam Agent computer. The Veeam Agent computer will be restored to the esx07.tech.local host as the WindowsAB_Restored VM.
Perform the following steps:
1. Get the restore point:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint cmdlet will not return any restore points for the Veeam Agent job.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $srv variable.
3. Run the Start-VBRViComputerInstantRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $srv variable as the Server parameter value.
- Specify the RestoredVMName parameter value.
> Example 2. Performing Instant Recovery of Specific Veeam Agent Computer using Latest Restore Point

$backup = Get-VBRBackup -Name "Windows Agent Backup*"
$restorepoint = Get-VBRRestorePoint -Name "WindowsAB" -Backup $Backup | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
$srv = Get-VBRServer -Name "esx07.tech.local"
Start-VBRViComputerInstantRecovery -RestorePoint $restorepoint[3] -Server $srv -RestoredVMName "WindowsAB_Restored"
This example shows how to perform instant recovery of the WindowsAB Veeam Agent computer. The cmdlet will restore the computer to the esx07.tech.local host as the WindowsAB_Restored VM.
Perform the following steps:
1. Get the restore point:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint cmdlet will not return any restore points for the Veeam Agent job.
b. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Set the $backup variable as the Backup parameter value.
c. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
d. Pipe the cmdlet output to the Select-Object cmdlet. Set the 1 number as the First parameter value.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $srv variable.
3. Run the Start-VBRViComputerInstantRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $srv variable as the Server parameter value.
- Specify the RestoredVMName parameter value.

---

### Parameters
#### **CacheDatastore**
Specifies a datastore to keep redo logs for the restored machine.
Note: If you do not specify this parameter, Veeam Backup & Replication will store redo logs on the vPower NFS server.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRViDatastore]`|false   |named   |False        |

#### **ConnectVMToNetwork**
Defines that the cmdlet will restore a machine with initial network settings.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Credentials**
Used to access the backups of a machine that is stored on shared folders.
Specifies the credentials you want to use to authenticate with the shared folder.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables the option to perform the secure restore. Veeam Backup & Replication will trigger the antivirus software to scan the selected machine before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For the secure restore option.
Defines that the antivirus will continue to scan a machine after the first virus threat is found. Use this option if you want to get the report on all virus threats.

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
Defines that the cmdlet will perform restore of a machine even if the geographic location of the repository where backups of a machine reside and the target host location does not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GenerateNewSystemUUID**
Defines that the cmdlet will generate a new system UUID for the restored machine.
If you do not provide this parameter, the cmdlet will keep the existing system UUID of the restored machine.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerOnAfterRestoring**
Defines that the cmdlet will power on the restored machine.
If you do not provide this parameter, you will need to power up a restored machine manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies a reason for performing instant recovery of a machine.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ResourcePool**
For restore to another location.
Specifies a resource pool on the ESXi host. The cmdlet will restore a machine to this resource pool.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RestoredVMName**
Specifies a name of the restored machine. The cmdlet will restore the machine with this name.
Note: The VM name must not contain space characters.
Default: The original machine name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point of a machine. The cmdlet will use the specified restore point to recover a machine.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
For restore to another location.
Specifies the target ESXi host. The cmdlet will restore a machine to this ESXi host.
Note: You must not specify a vCenter Server in this parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **SourceNetwork**
For restore to another location.
Specifies the source site network. Veeam Backup & Replication will map it to the target network.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRComputerNetworkInfo[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profiles. The cmdlet will restore the specified VMware storage policy associated with the restored Veeam Agent computer.
Note: Veeam Backup & Replication restores the storage policy only if you restore the Veeam Agent computer to the original location.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **TargetNetwork**
For restore to another location.
Specifies the target site network. Veeam Backup & Replication will map it with the source network.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo[]]`|false   |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies the secure restore action when the infection is detected.
* DisableNetwork: use this option if you want to restore a machine with disabled network adapters (NICs).
* AbortRecovery: use this option if you want to cancel the restore session.
Valid Values:

* DisableNetwork
* AbortRecovery

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRVirusDetectionAction]`|false   |named   |False        |

#### **VMFolder**
For restore to another location.
Specifies a folder on the ESXi host. The cmdlet will restore a machine to this folder.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

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
* Veeam.Backup.PowerShell.Infos.InstantRecovery

---

### Notes

---

### Syntax
```PowerShell
Start-VBRViComputerInstantRecovery [-RestorePoint] <COib> [-CacheDatastore <VBRViDatastore>] [-ConnectVMToNetwork] [-Credentials <CCredentials>] [-EnableAntivirusScan] [-EnableEntireVolumeScan] 
```
```PowerShell
[-EnableYARAScan] [-Force] [-GenerateNewSystemUUID] [-PowerOnAfterRestoring] [-Reason <String>] [-ResourcePool <CViResourcePoolItem>] [-RestoredVMName <String>] [-RunAsync] -Server <CHost> [-SourceNetwork 
```
```PowerShell
<VBRComputerNetworkInfo[]>] [-StoragePolicy <VBRViStoragePolicy>] [-TargetNetwork <IVBRServerNetworkInfo[]>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VMFolder <CViFolderItem>] [-YARAScanRule 
```
```PowerShell
<String>] [<CommonParameters>]
```
