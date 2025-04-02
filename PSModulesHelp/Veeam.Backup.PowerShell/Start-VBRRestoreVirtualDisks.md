Start-VBRRestoreVirtualDisks
----------------------------

### Synopsis
Restores disks from backups of physical or virtual machines and converts them to the VMDK, VHD or VHDX formats.

---

### Description

This cmdlet restores disks from backups of physical machines created by Veeam Agent operating in a standalone mode or virtual machines and converts them to the VMDK, VHD or VHDX formats.
The cmdlet allows you to scan the disks that you want to restore with the antivirus.
Run the Start-VBRRestoreVMFiles cmdlet to restore VM configuration files.
Note: In case the antivirus detects the virus threat, Veeam Backup & Replication will cancel the restore session.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRFilesInRestorePoint](Get-VBRFilesInRestorePoint)

* [Find-VBRViDatastore](Find-VBRViDatastore)

---

### Examples
> Example 1. Restoring All Physical Disks from Volume-Level Backups by Veeam Agent

$server = Get-VBRLocalhost
$restorepoint = Get-VBRBackup -Name "Backup Job SRV03" | Get-VBRRestorePoint | Sort-Object -Property CreationTime | Select-Object -First 1
Start-VBRRestoreVirtualDisks -RestorePoint $restorepoint -Server $server -Path "C:\SRV03_Restored" -RestoreDiskType Vmdk -RunAsync
This example shows how to restore all physical disks from volume-level backups created by Veeam Agent operating in a standalone mode. The cmdlet will restore disks to a Veeam backup server. The disks are restored to the latest restore point. The resulting format is VMDK.
Perform the following steps:
1. Run the Get-VBRLocalhost cmdlet. Save it to the $server variable.
2. Get the most recent restore point:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet.
- Pipe the cmdlet output to the Sort-Object cmdlet and specify the CreationTime parameter value.
- Pipe the cmdlet output to the Select-Object cmdlet. Specify the First parameter value.
- Save the result to the $restorepoint variable.
3. Run the Start-VBRRestoreVirtualDisks cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Set the Vmdk option for the RestoreDiskType parameter.
- Provide the RunAsync parameter value.
> Example 2. Restoring Specified Disks to Windows Server

$restorepoint = Get-VBRBackup -Name "Backup Job SRV03" | Get-VBRRestorePoint | Sort-Object -Property CreationTime | Select-Object -First 1
$server = Get-VBRServer -Type Windows -Name "Veeam_Remote"
$disks = Get-VBRFilesInRestorePoint -RestorePoint $restorepoint
Start-VBRRestoreVirtualDisks -RestorePoint $restorepoint -Server $server -Path "C:\SRV03_Restored" -RestoreDiskType Vhdx -Files $disks[1,3] -RunAsync
This example shows how to restore specified disks to a Windows server added to Veeam Backup & Replication. The disks are restored to the latest restore point. The resulting format is VHDX.
Perform the following steps:
1. Get the most recent restore point:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet.
- Pipe the cmdlet output to the Sort-Object cmdlet and specify the CreationTime parameter value.
- Pipe the cmdlet output to the Select-Object cmdlet. Specify the First parameter value.
- Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Set the Windows option for the Type parameter. Specify the Name parameter value. Save it to the $server variable.
3. Run the Get-VBRFilesInRestorePoint cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $disks variable. In this example, disks 1 and 3 will be restored.
4. Run the Start-VBRRestoreVirtualDisks cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Set the Vhdx option for the RestoreDiskType parameter.
- Set the $disks variable as the Files parameter value.
The Get-VBRFilesInRestorePoint cmdlet will return an array. Mind the ordinal number of the necessary item (in our example, it is the second and fourth items in the array).
- Provide the RunAsync parameter value.
> Example 3. Restoring Specified Disks to ESXi Host

$backup = Get-VBRBackup -Name "MSExchange"
$rp = Get-VBRRestorePoint -Name *MSExchange02* -Backup $backup
$server = Get-VBRServer -Name "172.17.42.11"
$datastore = Find-VBRViDatastore -Server "172.17.42.11" -Name "srv07-DAS1"
Start-VBRRestoreVirtualDisks -RestorePoint $rp -Server $server -Path "C:\MSEx02_Restored" -Datastore $datastore -RestoreDiskType Vmdk -StorageFormat Thin
This example shows how to restore selected disks to the 172.17.42.11 ESXi host and register them on the srv07-DAS1 datastore.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Set the $backup variable as the Backup parameter value. Save the result to the $rp variable.
3. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
4. Run the Find-VBRViDatastore cmdlet. Specify the Server and Name parameter values. Save the result to the $datastore variable.
5. Run the Start-VBRRestoreVirtualDisks cmdlet. Specify the following settings:
- Set the $rp variable as the RestorePoint parameter value.
- Set the $server variable as the Server parameter value.
- Specify the Path parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Set the Vmdk option for the RestoreDiskType parameter.
- Set the Thin option for the StorageFormat parameter.

---

### Parameters
#### **Datastore**
Specifies a target datastore. The cmdlet will register converted disks to this datastore.
Note: You must provide the Path parameter to specify the path to the folder in the datastore where you want to keep the converted disks. You must create the necessary folder beforehand.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables the secure restore option. Veeam Backup & Replication will trigger the antivirus software to scan selected machines before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Enables the option for the antivirus to continue physical discs scan after the first virus threat is found. Use this option if you want to get the report on all virus threats.

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

#### **Files**
Specifies the disks from the backup that you want to restore.
Default: all.

|Type              |Required|Position|PipelineInput        |
|------------------|--------|--------|---------------------|
|`[COIBFileInfo[]]`|false   |named   |True (ByPropertyName)|

#### **Path**
Specifies the path to the folder on the target server. The cmdlet will register virtual disks in this folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **ProceedToRecoveryIfThreatFound**
For secure restore.
Defines that if antivirus detects malware, the cmdlet will restore physical disks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing the disk restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestoreDiskType**
Specifies the format to which you want to convert the resulting virtual disk:
* VHD
* VHDX
* VMDK
Valid Values:

* Vmdk
* Vhd
* Vhdx

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[EVirtualDiskRestoreType]`|true    |named   |False        |

#### **RestorePoint**
Specifies the restore point from which you want to restore the disks.
You must select restore points only from Veeam Agent for Microsoft Windows volume-level backups.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the Windows host to which the disks should be restored.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |1       |False        |

#### **SourceShareCredentials**
Specifies the credentials for the backup repository. The cmdlet will export the backup from this repository.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **StorageFormat**
Specifies the format that will be used to convert the resulting virtual disk:
* Thin: the resulting vmdk virtual disk will be thin.
* Thick: the restresulting vmdk virtual disk will be thick lazy zeroed.
* EagerZeroedThick: resulting vmdk virtual disk will be eager lazy zeroed.
* Fixed: resulting vhd/vhdx virtual disk will be thick fixed.
* Dynamic: resulting vhd/vhdx virtual disk will be dynamic.
Default: Source.
Valid Values:

* Thin
* Thick
* EagerZeroedThick
* Fixed
* Dynamic

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRStorageFormatType]`|false   |named   |False        |

#### **TargetShareCredentials**
Specifies the credentials for the shared folder. The cmdlet will add the exported files to that folder.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

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

Veeam.Backup.Core.COIBFileInfo[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRRestoreVirtualDisks [-RestorePoint] <COib> [-Server] <CHost> [-Path] <String> [-Datastore <VBRViDatastoreBase>] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Files 
```
```PowerShell
<COIBFileInfo[]>] [-ProceedToRecoveryIfThreatFound] [-Reason <String>] -RestoreDiskType {Vmdk | Vhd | Vhdx} [-RunAsync] [-SourceShareCredentials <CCredentials>] [-StorageFormat {Thin | Thick | EagerZeroedThick 
```
```PowerShell
| Fixed | Dynamic}] [-TargetShareCredentials <CCredentials>] [-YARAScanRule <String>] [<CommonParameters>]
```
