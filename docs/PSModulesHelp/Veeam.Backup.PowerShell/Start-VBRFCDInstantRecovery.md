Start-VBRFCDInstantRecovery
---------------------------

### Synopsis
Starts the FCD instant recovery session.

---

### Description

This cmdlet starts the FCD instant recovery session

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Find-VBRViEntity](Find-VBRViEntity)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Find-VBRViStoragePolicy](Find-VBRViStoragePolicy)

---

### Examples
> Example 1. Starting FCD Instant Recovery Session for all Disks

$backup = Get-VBRBackup -Name "Database05"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$targetCluster = Find-VBRViEntity -Name "Workload-C" -HostsAndClusters
$publishingSession = Start-VBRFCDInstantRecovery -RestorePoint $restorepoint[2] -TargetCluster $targetCluster
This example shows how to start FCD instant recovery session for all backed-up disks avaiilable in the Databaseo5 backup.
The cmdlet will publish disks to the Workload-C cluster.

Perform the following steps:

1. Run the Get-VBRBackup cmdlet.
Specify the Name parameter value.
Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet.
Specify the Backup parameter.
Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the third restore point will be used.
3. Run the Find-VBRViEntity cmdlet.
Specify the Name parameter value.
Provide the HostsAndClusters parameter.
Save the result to the $targetCluster variable.
4. Run the Start-VBRFCDInstantRecovery cmdlet.
Set the $restorepoint variable as the RestorePoint parameter value.
Set the $targetCluster variable as the TargetCluster parameter value.
Save the result to the $publishingSession variable.
> Example 2. Starting FCD Instant Recovery Session for Specified Disks

$backup = Get-VBRBackup -Name "Database backup"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$targetCluster = Find-VBRViEntity -Name "Workload-C" -HostsAndClusters
$diskMapping = New-VBRFCDInstantRecoveryMappingOptions -NameInBackup "Disk1" -MountedDiskName "RestoredDisk1" -RegisteredFCDName "FCD-Disk1"
$publishingSession = Start-VBRFCDInstantRecovery -RestorePoint $restorepoint[2] -TargetCluster $targetCluster -MappingOptions $diskMapping
This example shows how to start FCD instant recovery session for the Disk1 disk with the following settings:

-  The cmdlet will set the RestoredDisk1 to the virtual disk that that is mounted to the datastore.
- The cmdlet will set the FCD-Disk1 to the FCD that is registered on the Workload-C cluster.

Perform the following steps:

1. Run the Get-VBRBackup cmdlet.
Specify the Name parameter value.
Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet.
Specify the Backup parameter.
Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the third restore point is used.
3. Run the Find-VBRViEntity cmdlet.
Specify the Name parameter value.
Provide the HostsAndClusters parameter.
Save the result to the $targetCluster variable.
4. Run the New-VBRFCDInstantRecoveryMappingOptions cmdlet.
Specify the NameInBackup, MountedDiskName and RegisteredFCDName parameter values.
Save the result to the $diskMapping variable.
5. Run the Start-VBRFCDInstantRecovery cmdlet.
Set the $restorepoint variable as the RestorePoint parameter value.
Set the $targetCluster variable as the TargetCluster parameter value.
Set the $diskMapping variable as the MappingOptions parameter value.
Save the result to the $publishingSession variable.
> Example 3. Starting FCD Instant Recovery Session with Redo Logs Redirection

$server = Get-VBRServer -Name "tech.local"
$datastore = Find-VBRViDatastore -Server $server -Name "VeeamDatastore"
$storagePolicy = Find-VBRViStoragePolicy -Server $server -Datastore $datastore -Name "Virtual SAN Default"
$backup = Get-VBRBackup -Name "Database backup"
$restorepoint = Get-VBRRestorePoint $backup
$targetCluster = Find-VBRViEntity -Name "Workload-Cluster" -HostsAndClusters
$publishingSession = Start-VBRFCDInstantRecovery -RestorePoint $restorepoint[2] -TargetCluster $targetCluster -CacheDatastore $datastore -StoragePolicy $storagePolicy
This example shows how to start FCD instant recovery session for the Disk1 disk.
The cmdlet will write redo logs to the VeeamDatastore datastore.
The datastore is assigned the Virtual SAN Default Storage Policy.

Perform the following steps:

1. Get the datastore:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Find-VBRViDatastore cmdlet. Specify the Server and Name parameter values. Save the result to the $datastore variable.
c. Run the Find-VBRViStoragePolicy cmdlet. Specify the Server, Datastore and Name parameter values. Save the result to the $storagePolicy variable.
2. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
3. Run the Get-VBRRestorePoint cmdlet. Specify the Backup parameter. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Consider that the array numbering starts with 0. In our example, the third restore point will be used.
4. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Provide the HostsAndClusters parameter. Save the result to the $targetCluster variable.
5. Run the Start-VBRFCDInstantRecovery cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $targetCluster variable as the TargetCluster parameter value.
- Set the $datastore variable as the CacheDatastore parameter value.
- Set the $storagePolicy variable as the StoragePolicy parameter value.
- Save the result to the $publishingSession variable.

---

### Parameters
#### **CacheDatastore**
Specifies a datastore to keep redo logs for the restored FCDs.
Accepts the VBRViDatastore object.
To create this object, run the Find-VBRViDatastore cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRViDatastore]`|false   |named   |False        |

#### **MappingOptions**
Specifies mapping settings of virtual disks that you want to restore as FCDs.
By default, Veeam Backup & Replication assigns the name of the backed-up disk to all types of virtual disks.
Note: If you do not provide this parameter, Veeam Backup & Replication will add all backed-up disks to the FCD instant recovery session.
Accepts the VBRFCDInstantRecoveryMappingOptions object.
To create this object, run the New-VBRFCDInstantRecoveryMappingOptions cmdlet.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRFCDInstantRecoveryMappingOptions]`|false   |named   |False        |

#### **Reason**
Specifies a reason for performing a restore of FCDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point for the VM whose virtual disks you want to restore as FCDs.
Accepts the COib object.
To create this object, run the Get-VBRRestorePoint cmdlet.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StoragePolicy**
Specifies a VM storage policy.
Veeam Backup & Replication will apply this storage policy for FCDs and for a datastore that keeps redo logs for the restored FCDs.
Note: The encrypted VM storage policy is not applied for FCD disks.
However, you can apply this policy for a datastore that keeps redo logs for the restored FCDs.
Accepts the VBRViStoragePolicy object.
To create this object, run the Find-VBRViStoragePolicy  cmdlet.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **TargetCluster**
Specifies a cluster to which Veeam Backup & Replication will register FCDs.
Accepts the CViClusterItem object.
To create this object, run the Find-VBRViEntity cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CViClusterItem]`|true    |1       |False        |

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRFCDInstantRecoverySession

---

### Notes

---

### Syntax
```PowerShell
Start-VBRFCDInstantRecovery [-RestorePoint] <COib> [-TargetCluster] <CViClusterItem> [-CacheDatastore <VBRViDatastore>] [-MappingOptions <VBRFCDInstantRecoveryMappingOptions>] [-Reason <String>] [-RunAsync] 
```
```PowerShell
[-StoragePolicy <VBRViStoragePolicy>] [<CommonParameters>]
```
