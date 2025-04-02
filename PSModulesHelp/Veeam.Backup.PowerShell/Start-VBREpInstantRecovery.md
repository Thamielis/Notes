Start-VBREpInstantRecovery
--------------------------

### Synopsis
Starts instant recovery of physical computers to virtual infrastructure.

---

### Description

This cmdlet starts an instant recovery session for physical machines. The process restores a backup of a physical computer to a virtualization host.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Starting Secure Restore of Selected Machine

$restorepoint = Get-VBRRestorePoint
Start-VBREpInstantRecovery -RestorePoint $restorepoint[1] -RunAsync -EnableAntivirusScan -EnableEntireVolumeScan -VirusDetectionAction DisableNetwork
This example shows how to run secure restore of the selected machine. The job will run with the following settings:
- The antivirus will continue VM scan after the first virus threat is found.
- In case the threat is detected, Veeam Backup & Replication will restore the machine with disabled NIC.
- The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore point in the array).
2. Run the Start-VBREpInstantRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Provide the RunAsync parameter value.
- Provide the EnableAntivirusScan parameter value.
- Provide the EnableEntireVolumeScan parameter value.
- Set the DisableNetwork option for the VirusDetectionAction parameter.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the VM.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables the option to perform secure restore. Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Enables the option for the antivirus to continue machine scan after the first virus threat is found. Use this option if you want to get the report on all virus threats.

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

#### **NICsEnabled**
If set to True, the restored VM will be connected to the network. Otherwise the VM will have no network connections.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Path**
Used to redirect the redo logs. Specifies the path to the folder where you want to store the changes made to the VM during the instant recovery.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **PowerUp**
If set to True, the restored VM will be powered up immediately after the restore. Otherwise, you will have to power up the VM manually.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **PreserveMACs**
If set to True, the restored VM will get the MAC address of the original VM. Otherwise, the restored VM will get a new MAC address.
Note: If the original computer keeps running, preserving the MAC address will cause conflict. Preserving the MAC address is useful in case the original computer will not be used in future - in this case, the restored VM will be able to use the MAC settings used by its applications, if any are installed.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected endpoint.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point of the physical computer to which you want to restore the VM.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Server**
Specifies the host where you want to locate the restored VM.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |1       |False        |

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
Specifies the name you want to apply to the restored VM. By default, the original VM name is applied.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Start-VBREpInstantRecovery [-RestorePoint] <COib> [-Server] <CHost> [-Path] <String> [-Credentials <CCredentials>] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-NICsEnabled <Boolean>] 
```
```PowerShell
[-PowerUp <Boolean>] [-PreserveMACs <Boolean>] [-Reason <String>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VMName <String>] [-YARAScanRule <String>] [<CommonParameters>]
```
