Start-VBRViInstantRecoveryDiskMigration
---------------------------------------

### Synopsis
Starts publish VM virtual disks to the production environment.

---

### Description

This cmdlet publish VM virtual disks to the production environment. To publish the disks, it uses the Quick Migration mechanism. IMPORTANT You can run this cmdlet only after you have performed Instant VM Disk Recovery.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRViVirtualDevice](Get-VBRViVirtualDevice)

* [New-VBRViVirtualDeviceMappingRule](New-VBRViVirtualDeviceMappingRule)

---

### Examples
> Publishing VM Virtual Disks to Production Environment

$sesson = Get-VBRInstantRecovery
$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
$mapping = New-VBRViDiskMigrationMappingRule -TargetVirtualDevice $disks
Start-VBRViInstantRecoveryDiskMigration -InstantRecovery $sesson -DiskMigrationMappingRule $mapping -Force -RunAsync
This example shows how to publish VM virtual disks to the production environment. The cmdlet will publish the disks to the datastore as it is defines in the mapping settings of the VM virtual disks.

Perform the following steps:

1. Run the Get-VBRInstantRecovery cmdlet.  Save the result to the $sesson variable.   2. Get the mapping settings of VM virtual disks:      a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.      b. Run the Get-VBRRestorePoint cmdlet. Specify the Backup parameter value. Save the result to the $restorepoint variable.      c. Run the Get-VBRViVirtualDevice cmdlet. Specify the RestorePoint parameter value. Save the result to the $disks variable.         The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore session in the array).      d. Run the New-VBRViVirtualDeviceMappingRule cmdlet. Specify the SourceVirtualDevice parameter value. Save the result to the $mappingrule variable.   3. Run the Start-VBRViVirtualDiskRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $mappingrule variable as the VirtualDeviceMapping parameter value..

---

### Parameters
#### **Datastore**
Specifies a datastore. The cmdelt will publish VM virtual disks to this datastore. Accepts the CViDatastoreItem object. To create this object, run the Find-VBRViDatastore cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **DiskMigrationMappingRule**
Specifies an array of mapping settings of VM virual disks. The cmdlet will publish the recovered VM virual disks to the datastores that you define in these mapping settings. Provide this parameter to defines mapping settings for multiple VM virtual disks. Accepts the VBRViDiskMigrationRule[] object. To create this object, run the New-VBRViDiskMigrationMappingRule cmdlet.

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRViDiskMigrationMapppingRule[]]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform VM restore even if the geographical location of the repository where VM backups reside and the target host location does not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **InstantRecovery**
Specifies an Instant VM Disc Recovery session. The cmdlet will start quick migration of VM virtual discs that are recovered during this session.  Accepts the InstantRecovery object. To create this object, run the Get-VBRInstantRecovery cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[InstantRecovery]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **SourceProxy**
Specifies an array of the source backup proxies that you want to use as source backup proxies. Accepts the CViProxy[] object. To create this object, run the Get-VBRServer cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile that must be applied to the restored virtual disks. Accepts the VBRViStoragePolicy object. To create this object, run the Get-VBRServer cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **TargetProxy**
Specifies an array of the target backup proxies that you want to use as target backup proxies. Accepts the CViProxy[] object. To create this object, run the Get-VBRServer cmdlet.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **UseDataTransportEngine**
Defines that the cmdet will enable the data transport engine,

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.InstantRecovery

---

### Outputs
* Veeam.Backup.Core.CBackupSession

---

### Notes

---

### Syntax
```PowerShell
Start-VBRViInstantRecoveryDiskMigration [-InstantRecovery] <InstantRecovery> [-Datastore <VBRViDatastoreBase>] [-DiskMigrationMappingRule <VBRViDiskMigrationMapppingRule[]>] [-Force] [-RunAsync] [-SourceProxy 
```
```PowerShell
<CViProxy[]>] [-StoragePolicy <VBRViStoragePolicy>] [-TargetProxy <CViProxy[]>] [-UseDataTransportEngine] [<CommonParameters>]
```
