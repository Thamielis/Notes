New-VBRViDiskMigrationMappingRule
---------------------------------

### Synopsis
Defines mapping settings of recovered VM virtual disks and target datastores.

---

### Description

This cmdlet defines mapping settings of recovered VM virtual disks and target datastores.
You can run this cmdlet to specify a particular target datastore for every disk that you want to publish.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRViVirtualDevice](Get-VBRViVirtualDevice)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Mapping Recovered Virtual Disks to Default Datastore

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
New-VBRViDiskMigrationMappingRule -TargetVirtualDevice $disks
This example shows how to map the recovered virtual disks to the default datastore. The cmdlet will map virtual disks of the VM that is backed up by the Winsrv4515 job.

Perform the following steps:

Perform the following steps:
1. Get the backed-up VM virtual disks:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRViVirtualDevice cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $disks variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore session in the array).
2. Run the New-VBRViDiskMigrationMappingRule cmdlet. Set the $disks variable as the TargetVirtualDevice parameter value.
> Example 2. Mapping Restored Virtual Disks to Specific Datastore

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
$server = Get-VBRServer -Name "WinSrv2073"
$datastore = Find-VBRViDatastore -Server $server -Name "LocalStore_0"
New-VBRViDiskMigrationMappingRule -TargetVirtualDevice $disks -Datastore $datastore
This example shows how to map the recovered virtual disks to the LocalStore_0 datastore.
This datastore is connected to the WinSrv2073 server. The cmdlet will map virtual disks of the VM that is backed up by the Winsrv4515 job.

Perform the following steps: 1. Get the backed-up VM virtual disks:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRViVirtualDevice cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $disks variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore session in the array).
2. Get the datastore:
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save the result to the $datastore variable.
3. Run the New-VBRViDiskMigrationMappingRule cmdlet. Set the $disks variable as the TargetVirtualDevice parameter value. Set the $datastore variable as the Datastore parameter value.
> Example 3. Mapping Restored Virtual Disks to Datastore Cluster

$backup = Get-VBRBackup -Name "Winsrv4515"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disks = Get-VBRViVirtualDevice -RestorePoint $restorepoint[3]
$server = Get-VBRServer -Name "WinSrv2077"
$datastorecluster = Find-VBRViDatastoreCluster -Server $server -Name "Cluster_5"
New-VBRViDiskMigrationMappingRule -TargetVirtualDevice $disks -Datastore $datastorecluster
This example shows how to map the recovered virtual disks to the Cluster_5 datastore cluster.
This datastore cluster is connected to the WinSrv2077 server.
The cmdlet will map virtual disks of the VM that is backed up by the Winsrv4515 job.

Perform the following steps: 1. Get the backed-up VM virtual disks: - Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.

- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.

- Run the Get-VBRViVirtualDevice cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $disks variable.

The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore session in the array). 2. Get the datastore: - Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable

- Run the Find-VBRViDatastoreCluster cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save the result to the $datastorecluster variable.

3. Run the New-VBRViDiskMigrationMappingRule cmdlet. Set the $disks variable as the TargetVirtualDevice parameter value. Set the $datastorecluster variable as the Datastore parameter value.

---

### Parameters
#### **Datastore**
Specifies a datastore or a datastore cluster.
The cmdlet will map recovered VM virtual disks to the specified datastore or the datastore cluster.
Note: If you do not specify this parameter, the cmdlet will will map recovered VM virtual disks to the default datastore.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **DiskType**
Specifies the virtual disk type settings.
The cmdlet will set the virtual disks types to the specified type during the restore.
You can specify one of the following disk types:
* AsSource
* Thin
* LazyZeroed
* EagerZeroed
Default: AsSource
Valid Values:

* AsSource
* Thin
* LazyZeroed
* EagerZeroed

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRViDiskType]`|false   |named   |False        |

#### **TargetVirtualDevice**
Specifies recovered VM virtual disks.
The cmdlet will map these disks to the datastore.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViVirtualDevice]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRViDiskMigrationMapppingRule

---

### Notes

---

### Syntax
```PowerShell
New-VBRViDiskMigrationMappingRule [-Datastore <VBRViDatastoreBase>] [-DiskType {AsSource | Thin | LazyZeroed | EagerZeroed}] -TargetVirtualDevice <VBRViVirtualDevice> [<CommonParameters>]
```
