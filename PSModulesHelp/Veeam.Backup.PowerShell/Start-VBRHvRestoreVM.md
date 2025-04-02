Start-VBRHvRestoreVM
--------------------

### Synopsis
Starts restore of an entire Hyper-V VM.

---

### Description

This cmdlet starts the restore of the entire VM.
With this cmdlet, you can perform the following recover scenarios:
- Restore to original location
- Restore to original location with different settings
- Restore to another location
- Staged restore
- Secure restore

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRLocation](Get-VBRLocation)

* [Get-VSBHvVirtualLab](Get-VSBHvVirtualLab)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Restoring Entire Hyper-V VM to Original Location

$restorepoint = Get-VBRRestorePoint -Name srv01 | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
Start-VBRHvRestoreVM -RestorePoint $restorepoint
This example shows how to restore the srv01 Hyper-V VM to its original location.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
3. Pipe the cmdlet output to the Select-Object cmdlet. Set 1 as the First parameter value.
4. Run the Start-VBRHvRestoreVM cmdlet. Set the $restorepoint variable as the RestorePoint parameter value.
> Example 2. Cloning Hyper-V VM to Original Position

$restorepoint = Get-VBRRestorePoint -Name srv01 | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
Start-VBRHvRestoreVM -RestorePoint $restorepoint -VMName srv01_copy -PreserveVmID $false -Path "E:\Storage\HyperV\srv01"
This example shows how to clone the srv01 Hyper-V VM to its original location. The cmdlet will keep the restored VM files in the "E:\Storage\HyperV\srv01" folder.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
3. Pipe the cmdlet output to the Select-Object cmdlet. Set 1 as the First parameter value.
4. Run the Start-VBRHvRestoreVM cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Specify the VMName parameter value.
- Set the PreserveVmID parameter to the $false value.
- Specify the Path parameter value.
> Example 3. Restoring Hyper-V VM to Another Location

$restorepoint = Get-VBRRestorePoint -Name srv01 | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
$server = Get-VBRServer -Type HvServer -Name "hyperv01.east.support"
Start-VBRHvRestoreVM -RestorePoint $restorepoint -Server $server -Path "D:\Storage\HyperV\srv01_restored"
This example shows how to restore the srv01 Hyper-V VM to hyperv01.east.support server. The cmdlet will keep the restored VM files in the "D:\Storage\HyperV\srv01_restored" folder.
Perform the following steps:

1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
3. Pipe the cmdlet output to the Select-Object cmdlet. Set 1 as the First parameter value.
4. Run the Get-VBRServer  cmdlet. Specify the Type and Name parameter values. Save the result to the $server variable.
5. Run the Start-VBRHvRestoreVM cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
> Example 4. Performing Staged Restore of Hyper-V VM

$restorepoint = Get-VBRRestorePoint -Name srv01 | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
$lab = Get-VSBHvVirtualLab -Name VirtualLab
$creds = Get-VBRCredentials -Name Administrator
Start-VBRRestoreVM -RestorePoint $restorepoint -StagingVirtualLab $lab -StagingScript "c:/script.cmd" -EnableStagedRestore -StagingCredentials $creds
This example shows how to perform staged restore for the srv01 VM.
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
3. Pipe the cmdlet output to the Select-Object cmdlet. Set 1 as the First parameter value.
4. Run the Get-VSBHvVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
5. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
6. Run the Start-VBRRestoreVM cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $lab variable as the StagingVirtualLab parameter value.
- Specify the StagingScript parameter value.
- Provide the EnableStagedRestore parameter.
- Set the $creds variable as the StagingVirtualLab parameter value.
> Example 5. Performing Secure Restore of Hyper-V VM

$restorepoint = Get-VBRRestorePoint -Name srv01 | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
Start-VBRHVRestoreVM -RestorePoint $restorepoint -RunAsync -EnableAntivirusScan -EnableEntireVolumeScan -VirusDetectionAction DisableNetwork
This example shows how to perform secure restore of the srv01 VM. The restore session will run with the following settings:
- The antivirus will continue VM scan after the first virus threat is found.
- In case the threat is detected, Veeam Backup & Replication will restore the VM with disabled NIC.
- The RunAsync parameter is set to bring the process to the background.

You must perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Save the result to the $restorepoint variable.
2. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
3. Pipe the cmdlet output to the Select-Object cmdlet. Set 1 as the First parameter value.
4. Run the Start-VBRRestoreVM cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Provide the RunAsync parameter.
- Provide the EnableAntivirusScan parameter.
- Provide the EnableEntireVolumeScan parameter.
- Specify the VirusDetectionAction parameter value.

---

### Parameters
#### **Credential**
Specifies the credentials you want to use to access a backup file imported from a shared folder.
Note: If you provide this parameter, you must omit the User and Password parameters.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **EnableAntivirusScan**
Defines that the cmdlet will perform secure restore.
Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Enables the option to continue antivirus scan of the VMs after the first virus threat is found.
Use this option if you want to get the report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableStagedRestore**
Note: This parameter is required for staged restore only.
Defines that the cmdlet will perform staged restore. If you do not provide this parameter, the cmdlet will not perform staged restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Indicates that the cmdlet will perform VM restore even if the geographical location of the repository where VM backups reside and the target host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NICsEnabled**
Defines that the restored VM will be connected to the network.
If you do not provide this parameter, the VM will have no network connections.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Password**
Specifies the password you want to use to access a backup file imported from a shared folder.
Note: If you provide the User and Password parameters, you must omit the Credentials parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Path**
Specifies the path to the folder where you want to restore the VM.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PowerUp**
Defines that the restored VM will be powered up immediately after the restore.
If you do not provide this parameter, you will have to power up the VM manually.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreserveMACs**
Defines that the restored VM will get the MAC address of the original VM. If you do not provide this parameter, the restored VM will get a new MAC address.
Note: If the original VM keeps running, preserving the MAC address will cause conflict. Preserving the MAC address is useful in case the original VM will not be used in future - in this case, the restored VM will be able to use the MAC settings used by its applications, if any are installed.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **PreserveVmID**
Defines whether the restored VM will get the UUID of the original VM.
Note: The cmdlet deletes the original VM if you restore it to the same Hyper-V host. This is done to avoid UUID conflicts. To keep both VMs in the same location, the restored VM must have a new UUID and a different name. To generate a new UUID, set this parameter to False.
* True: The cmdet will restore a VM with the UUID of the original VM.
* False: The cmdet will restore a VM with a new UUID.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **QuickRollback**
For restore to original location.
Defines that the incremental restore must be performed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected VM. The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RegisterAsClusterResource**
Defines that the restored VM will be registered as a part of a cluster in case you restore the VM to a clustered host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePoint**
Specifies the VM restore point to which you want to restore.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Indicates that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the host where you want to locate the restored VM.
By default, the cmdlet will restore a VM to its original location.
Note: This parameter is required for the staged restore jobs.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **StagingApplicationGroup**
For staged restore.
Specifies the application group that the cmdlet will use for staged restore.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CSbAppGroup]`|false   |named   |False        |

#### **StagingCredentials**
For staged restore.
Specifies the credentials for the account that has administrator privileges on VMs that you want to restore. The cmdlet will use these credentials to authenticate against VMs and run the script.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|true    |named   |False        |

#### **StagingScript**
For staged restore.
Specifies the script location.
Veeam Backup & Replication will use this script to prepare VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **StagingStartupOptions**
For staged restore.
Specifies startup settings of VMs that you want to restore.
Veeam Backup & Replication will use these settings to start selected VMs after recovery.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRApplicationGroupStartupOptions]`|false   |named   |False        |

#### **StagingVirtualLab**
For staged restore.
Specifies the virtual lab. The cmdlet will use this virtual lab to start VMs and run the script.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CHvSbVirtualLab]`|true    |named   |False        |

#### **User**
Specifies the user name you want to use to access a backup file imported from a shared folder.
Note: If you provide the User and Password parameters, you must omit the Credentials parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VirusDetectionAction**
For secure restore.
Specifies the secure restore action when the infection is detected.
* DisableNetwork - use this option if you want to restore VMs in with disabled network adapters (NICs).
* AbortRecovery - use this option if you want to cancel the restore session.
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
Start-VBRHvRestoreVM [-RestorePoint] <COib> [-Credential <PSCredential>] [-EnableAntivirusScan] [-EnableEntireVolumeScan] -EnableStagedRestore [-EnableYARAScan] [-Force] [-NICsEnabled <Boolean>] [-Password 
```
```PowerShell
<String>] [-Path <String>] [-PowerUp] [-PreserveMACs <Boolean>] [-PreserveVmID <Boolean>] [-QuickRollback] [-Reason <String>] [-RegisterAsClusterResource] [-RunAsync] [-Server <CHost>] [-StagingApplicationGroup 
```
```PowerShell
<CSbAppGroup>] -StagingCredentials <CInternalCredentials> -StagingScript <String> [-StagingStartupOptions <VBRApplicationGroupStartupOptions>] -StagingVirtualLab <CHvSbVirtualLab> [-User <String>] 
```
```PowerShell
[-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VMName <String>] [-YARAScanRule <String>] [<CommonParameters>]
```
