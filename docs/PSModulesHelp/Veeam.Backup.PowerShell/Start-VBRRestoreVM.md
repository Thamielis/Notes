Start-VBRRestoreVM
------------------

### Synopsis
Starts restore of the entire VMware VM.

---

### Description

This cmdlet starts the entire VM restore. With this cmdlet, you can restore the VM with the following options:
- Restore to original location
- Restore to original location with different settings
- Restore to another location
- Staged restore
- Secure restore

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViResourcePool](Find-VBRViResourcePool)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Find-VBRViStoragePolicy](Find-VBRViStoragePolicy)

* [Find-VBRViFolder](Find-VBRViFolder)

* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint
Start-VBRRestoreVM -RestorePoint $restorepoint -Reason "Test restore" -ToOriginalLocation -StoragePolicyAction Default
This example shows how to start restore of a VM to the original location.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRRestoreVM cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Specify the Reason parameter value.
- Provide the ToOriginalLocation parameter.
- Set the Default value for the StoragePolicyAction parameter.
> Example 2

$restorepoint = Get-VBRRestorePoint
$server = Get-VBRServer -Name "north.support.local"
$rpool = Find-VBRViResourcePool -Server $server
$datastore = Find-VBRViDatastore -Server $server
Start-VBRRestoreVM -RestorePoint $restorepoint[1] -Server $server -ResourcePool $rpool -Datastore $datastore -PowerUp:$true -NICsEnabled:$false
Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Find-VBRViResourcePool cmdlet. Set the $server variable as the Server parameter value. Save the result to the $rpool variable.
4. Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value. Save the result to the $datastore variable.
5. Run the Start-VBRRestoreVM cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the second restore point is used.
- Set the $server variable as the Server parameter value.
- Set the $rpool variable as the ResourcePool parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Set the $true value for the PowerUp parameter.
- Set the $false value for the NICsEnabled parameter.
> Example 3

$restorepoint = Get-VBRRestorePoint
$server = Get-VBRServer -Name "north.support.local"
$lab = Get-VSBVirtualLab -Name "VirtualLab"
$creds = Get-VBRCredentials -Name "Administrator"
Start-VBRRestoreVM -RestorePoint $restorepoint[0] -Server $server -StagingVirtualLab $lab -StagingScript "c:/script.cmd" -EnableStagedRestore -StagingCredentials $creds
The example shows how perform staged restore of the selected VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Get-VSBVirtualLab cmdlet. Specify the Name parameter value. Save the result to the $lab variable.
4. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
5. Run the Start-VBRRestoreVM cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the first restore point is used.
- Set the $server variable as the Server parameter value.
- Set the $lab variable as the StagingVirtualLab parameter value.
- Specify the StagingScript parameter value.
- Provide the EnableStagedRestore parameter.
- Set the $creds variable as the StagingCredentials parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the VM.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Datastore**
For restore to another location.
Specifies the datastore to which you want to connect the restored VM.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |3       |False        |

#### **DiskType**
Specifies the disk type you want to apply to the restored VM: Thin, Thick, AsOriginal.
Valid Values:

* Source
* Thick
* Thin
* ThickEagerZeroed

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EDiskCreationMode]`|false   |named   |False        |

#### **EnableAntivirusScan**
Enables the secure restore option.
Veeam Backup & Replication will trigger the antivirus software to scan selected VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableEntireVolumeScan**
For secure restore.
Defines that the antivirus will continue VMs scan after the first virus threat is found.
Use this option if you want to get the report on all virus threats.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableStagedRestore**
Note: This parameter is required for staged restore only.
Enables the staged restore option.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **EnableYARAScan**
Enables the YARA scan for the selected VMs.
Use the YARAScanRule parameter to specify the YARA rule to be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Folder**
For restore to another location.
Specifies the folder where you want to locate the restored VM.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Indicates that the cmdlet will perform VM restore even if the geographical location of the repository where VM backups reside and the target host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **NICsEnabled**
Defines that the restored VM will be connected to the network. If you do not provide this parameter, the VM will have no network connections.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PowerUp**
Defines that the restored VM will be powered up immediately after the restore.
Otherwise, you will have to power up the VM manually.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |False        |

#### **Proxy**
Specifies the backup proxy that the cmdlet will use during restore.
If you do not provide this parameter, the cmdlet will use select the backup proxy automatically.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **QuickRollback**
For restore to original location.
Defines that the incremental restore must be performed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing restore of the selected VM.
The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ResourcePool**
For restore to another location.
Specifies the resource pool where you want to locate the restored VM.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |2       |False        |

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
Specifies the ESXi host where you want to locate the restored VM.
Note: The cmdlet will not run if you specify this parameter with the ToOriginalLocation parameter.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |1       |False        |

#### **SkipTagsRestore**
Defines that the VM will be restored without its VMware tag.
Otherwise, the restored VM will keep its original tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SourceNetwork**
For restore to another location.
Specifies the source site network. Veeam Backup & Replication will map it to the target network.
Note: This parameter is required if you specify the TargetNetwork parameter.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **StagingApplicationGroup**
For staged restore.
Specifies the application group that the cmdlet will use for staged restore.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[CSbAppGroup]`|false   |named   |False        |

#### **StagingCredentials**
Note: This parameter is required for staged restore only.
Specifies the VM guest credentials for the staged restore. Veeam Backup & Replication will use these credentials for authenticating with the VM and run the script.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CInternalCredentials]`|true    |named   |False        |

#### **StagingScript**
Note: This parameter is required for staged restore only.
Specifies the script location. Veeam Backup & Replication will use this script to prepare VMs before the restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **StagingStartupOptions**
For staged restore.
Specifies startup settings of VMs that you want to restore. Veeam Backup & Replication will use these settings to start selected VMs after recovery.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRApplicationGroupStartupOptions]`|false   |named   |False        |

#### **StagingVirtualLab**
For staged restore.
Specifies the virtual lab. The cmdlet will use this virtual lab to start VMs and run the script.
Specifies the virtual lab that you will use for staged restore.
Veeam Backup & Replication will move VMs into the isolated environment and will run the staging script.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[ISbVirtualLab]`|true    |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile that must be applied to the restored virtual disks.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **StoragePolicyAction**
Specifies the strategy for selecting storage policy profile in case the storage profile of the backed up VM differs from the profile of the original VM:
* Current: the restored VM will be subscribed to the same profile as in backup (if such profile still exists) or to the profile to which the original VM is subscribed (if profile as in backup was removed).
* Default: the restored VM will be subscribed to the profile that is set as default for the target datastore.
* Stored: the restored VM will be subscribed to the profile as in backup (if such profile still exists).
Valid Values:

* Current
* Stored
* Default

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRStoragePolicyAction]`|false   |named   |False        |

#### **TargetNetwork**
For restore to another location.
Specifies the target site network. Veeam Backup & Replication will map it with the source network.
Note: This parameter is required if you specify the SourceNetwork parameter.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViNetworkInfo[]]`|false   |named   |False        |

#### **ToOriginalLocation**
Defines that the VM must be restored with original ResourcePool, Datastore and Folder settings.
Note: The cmdlet will not run if you specify this parameter with the Server parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **VirusDetectionAction**
For secure restore. Specifies the secure restore action when the infection is detected. - DisableNetwork - use this option if you want to restore VMs with disabled network adapters (NICs).
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
To use the YARA rule, you must specify its name and extension. Veeam Backup & Replication accepts only .yar and .yara extension.

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
Start-VBRRestoreVM [-RestorePoint] <COib> [-Server] <CHost> [[-ResourcePool] <CViResourcePoolItem>] [[-Datastore] <CViDatastoreItem>] [-Credentials <CCredentials>] [-DiskType {Source | Thick | Thin | 
```
```PowerShell
ThickEagerZeroed}] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Folder <CViFolderItem>] [-Force] [-NICsEnabled] [-PowerUp <Boolean>] [-Proxy <CViProxy[]>] [-Reason <String>] [-RunAsync] 
```
```PowerShell
[-SkipTagsRestore] [-SourceNetwork <VBRViNetworkInfo[]>] [-StoragePolicy <VBRViStoragePolicy>] [-TargetNetwork <VBRViNetworkInfo[]>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-VMName <String>] 
```
```PowerShell
[-YARAScanRule <String>] [<CommonParameters>]
```
```PowerShell
Start-VBRRestoreVM [-RestorePoint] <COib> [-Server] <CHost> [[-ResourcePool] <CViResourcePoolItem>] [[-Datastore] <CViDatastoreItem>] [-Credentials <CCredentials>] [-DiskType {Source | Thick | Thin | 
```
```PowerShell
ThickEagerZeroed}] [-EnableAntivirusScan] [-EnableEntireVolumeScan] -EnableStagedRestore [-EnableYARAScan] [-Folder <CViFolderItem>] [-Force] [-NICsEnabled] [-PowerUp <Boolean>] [-Proxy <CViProxy[]>] [-Reason 
```
```PowerShell
<String>] [-RunAsync] [-SkipTagsRestore] [-SourceNetwork <VBRViNetworkInfo[]>] [-StagingApplicationGroup <CSbAppGroup>] -StagingCredentials <CInternalCredentials> -StagingScript <String> [-StagingStartupOptions 
```
```PowerShell
<VBRApplicationGroupStartupOptions>] -StagingVirtualLab <ISbVirtualLab> [-StoragePolicy <VBRViStoragePolicy>] [-TargetNetwork <VBRViNetworkInfo[]>] [-VirusDetectionAction {DisableNetwork | AbortRecovery}] 
```
```PowerShell
[-VMName <String>] [-YARAScanRule <String>] [<CommonParameters>]
```
```PowerShell
Start-VBRRestoreVM [-RestorePoint] <COib> [-Credentials <CCredentials>] [-DiskType {Source | Thick | Thin | ThickEagerZeroed}] [-EnableAntivirusScan] [-EnableEntireVolumeScan] [-EnableYARAScan] [-Force] 
```
```PowerShell
[-NICsEnabled] [-PowerUp <Boolean>] [-Proxy <CViProxy[]>] [-QuickRollback] [-Reason <String>] [-RunAsync] [-SkipTagsRestore] [-StoragePolicyAction {Current | Stored | Default}] -ToOriginalLocation 
```
```PowerShell
[-VirusDetectionAction {DisableNetwork | AbortRecovery}] [-YARAScanRule <String>] [<CommonParameters>]
```
