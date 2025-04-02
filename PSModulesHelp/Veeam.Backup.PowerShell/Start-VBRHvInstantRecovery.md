Start-VBRHvInstantRecovery
--------------------------

### Synopsis
Starts Hyper-V Instant Recovery.

---

### Description

This cmdlet starts Instant Recovery to Microsoft Hyper-V. The Instant Recovery for Hyper-V process creates a copy of a workload in a target location reading data from the directly from a compressed and deduplicated backup file.

With this cmdlet, you can perform the following recover scenarios:

- Restore to original location
- Restore to original location with different settings
- Restore to another location
- Secure restore

The recovered VM runs from a backup and does not provide a wholly functioning service. You need to finalize the successful instant recovery by one of the following steps:

- Remove the recovered VM. You can stop publishing the recovered VM and discard the changes made to it while it was running from backup. To do this, run Stop-VBRInstantRecovery.
- Migrate the recovered VM to the production. To do this, run Start-VBRHvInstantRecoveryMigration.
Run Restart-VBRInstantRecovery to restart the Instant Recovery session if it failed for some reason.
Run Get-VBRInstantRecovery to view the session status.
Starting from Veeam Backup & Replication version 9.5 Update 3, the cmdlet checks if the data of the VM you want to restore changes its geographical location.

NOTE:
- To recover Hyper-V workloads to VMware vSphere VMs, run the Start-VBRViComputerInstantRecovery cmdlet.
- The cmdlet will not run if the geographical location of the repository where VM backups reside and the target host location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint  
$server = Get-VBRServer  
Start-VBRHvInstantRecovery -RestorePoint $restorepoint[1] -Server $server -Path "c:\Hyper-V\Virtual Hard Disks\Redo" -VMName "New-Exch01" -PowerUp $True
The example shows how to start Instant Recovery of the VM.

The job will run with the following settings:

- The file path for redo logs is ?:\Hyper-V\Virtual Hard Disks\Redo.
- The VM will be restored with name "New-Exch01".
- The PowerUp parameter is set to enable the VM power up automatically.
You will need to perform the following steps:

1. Run Get-VBRRestorePoint to get the array of the restore points for the selected VM.
Save the result to the $restorepoint variable.
2. Run Get-VBRServer to get the specify the host where you want to locate the restored VM.
Save the result to the $server variable.
3. Run the Start-VBRHvInstantRecovery cmdlet. Specify the following settings: - Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the second restore point is used.
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Specify the VMName parameter value.
- Set the PowerUp parameter to $True.
> Example 2

$restorepoint = Get-VBRRestorePoint  
Start-VBRHvInstantRecovery -RestorePoint $restorepoint[1] -EnableAntivirusScan -EnableEntireVolumeScan -VirusDetectionAction DisableNetwork
The example shows how to run the secure restore of the selected VM.

The job will run with the following settings:

· The antivirus will continue VM scan after the first virus threat is found   · In case the threat is detected, Veeam Backup & Replication will restore the VM with disabled NIC
You will need to perform the following steps:
1. Run Get-VBRRestorePoint to get the array of the restore points for the selected VM.
Save the result to the $restorepoint variable.
2. Run the Start-VBRHvInstantRecovery cmdlet. Specify the following settings:   - Set the $restorepoint variable as the RestorePoint parameter value.   The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the second restore point is used.   - Provide the EnableAntivirusScan parameter value.   - Provide the EnableEntireVolumeScan parameter value.   - Set the DisableNetwork option for the VirusDetectionAction parameter.

---

### Parameters
#### **Credentials**
Used to access the VMs stored on shared folders.
Specifies the credentials you want to use to authenticate with the shared folder.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DisableDiskAllocation**
Defines whether to allocate disk space.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables secure restore. Veeam Backup & Replication will trigger the antivirus software to scan the selected workloads before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Defines that the antivirus will continue workload scan after the first virus threat is found. Use this option if you want to get the report on all virus threats.

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
Defines that the cmdlet will perform restore even if the geographical location of the repository where backups reside and the target host location do not match. The cmdlet will not show any warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HelperAppliance**
Specifies settings of a helper appliance used to restore Linux-based VMs.
Note: This parameter applies if you perform instant recovery for workloads other than Microsoft Hyper-V VMs.

|Type                                   |Required|Position|PipelineInput                 |
|---------------------------------------|--------|--------|------------------------------|
|`[VBRHvInstantRecoveryHelperAppliance]`|false   |named   |True (ByPropertyName, ByValue)|

#### **NetworkMapping**
Specifies an array of network mapping rules. These rules specify how to map networks in the original site with networks in the target site (where the recovered VM will reside).
Note: This parameter applies if you perform instant recovery of Veeam Agent computers.

|Type                                        |Required|Position|PipelineInput|
|--------------------------------------------|--------|--------|-------------|
|`[VBRHvInstantRecoveryNetworkMappingRule[]]`|false   |named   |False        |

#### **NICsEnabled**
Defines whether to connect the restored VM to the network:
* True: the restored VM will be connected to the network.
* False: the restored VM will have no network connections.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Path**
To redirect the redo logs.
Specifies the path to the folder where you want to store the changes made to the VM during the Instant Recovery.
Note: This parameter is required if you provide the Server parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PowerUp**
Defines whether to power on the VM right after restore:
* True: the restored VM will be powered on.
* False: the restored VM will be powered off and you will need to power on it manually.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **PreserveMACs**
Defines whether the restored VM gets the MAC address of the original workload:
* True: the restored VM will get the MAC address of the original workload.
* False: the restored VM will get a new MAC address.
Note: If the original workload keeps running, preserving the MAC address will cause conflict. Preserving the workload address is useful if the original VM will not be used in future - in this case, the restored VM will be able to use the MAC settings used by its applications, if any are installed.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **PreserveVmID**
Defines whether the restored VM gets the ID of the original workload:
* True: the restored VM will get the ID of the original VM.
* False: the restored VM will get a new ID.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected workload.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point to which you want to restore the workload.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Server**
Specifies the host where you want to restore the VM.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies the secure restore action when the infection is detected.
* DisableNetwork - use this option if you want to restore workkloads with disabled network adapters (NICs).
* AbortRecovery - use this option if you want to cancel the restore session
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
Note: Veeam Backup & Replication searches for YARA rules by the following path: C:\Program Files\Veeam\Backup and Replication\Backup\YaraRules.
To use the Yara rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

Veeam.Backup.PowerShell.Infos.VBRHvInstantRecoveryHelperAppliance

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRHvInstantRecovery [-RestorePoint] <COib> [-Credentials <CCredentials>] [-DisableDiskAllocation] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Force] [-HelperAppliance 
```
```PowerShell
<VBRHvInstantRecoveryHelperAppliance>] [-NetworkMapping <VBRHvInstantRecoveryNetworkMappingRule[]>] [-NICsEnabled <Boolean>] [-Path <String>] [-PowerUp <Boolean>] [-PreserveMACs <Boolean>] [-PreserveVmID 
```
```PowerShell
<Boolean>] [-Reason <String>] [-Server <CHost>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VMName <String>] [-YARAScanRule <String>] [<CommonParameters>]
```
