Start-VBRFCDInstantRecoveryMigration
------------------------------------

### Synopsis
Starts Quick Migration of FCDs.

---

### Description

This cmdlet starts Quick Migration of FCDs.

Important! Only the vMotion Quick Migration method is supported.

---

### Related Links
* [Get-VBRFCDInstantRecoverySession](Get-VBRFCDInstantRecoverySession)

* [Get-VBRServer](Get-VBRServer)

* [Find-VBRViDatastore](Find-VBRViDatastore)

* [Find-VBRViStoragePolicy](Find-VBRViStoragePolicy)

---

### Examples
> Example 1. Starting Quick Migration of all FCDs

$fcdInstantRecovery = Get-VBRFCDInstantRecoverySession -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
$server = Get-VBRServer -Name "tech.local"
$datastore = Find-VBRViDatastore -Server $server -Name "VeeamDatastore"
Start-VBRFCDInstantRecoveryMigration -Session $fcdInstantRecovery -TargetDatastore $datastore
This example shows how to starts Quick Migration of all FCDs.
The cmdlet will perform migration with the following settings:
- The cmdlet will mirgate FCDs that have been recovered within the 49664A5F-9C55-4A1F-8E6A-1CD5705A684B FCD recovery session.
- The cmdlet will migrate FCDS to the VeeamDatastore target datastore.
Perform the following steps:

1. Run the Get-VBRFCDInstantRecoverySession cmdlet. Specify the Id parameter value. Save the result to the $fcdInstantRecovery variable.
2. Get the datastore:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Find-VBRViDatastore cmdlet. Specify the Server and Name parameter values. Save the result to the $datastore variable.
3. Run the Start-VBRFCDInstantRecoveryMigration cmdlet. Set the $fcdInstantRecovery varialbe as the Session parameter value. Set the $datastore varialbe as the TargetDatastore parameter value.
> Example 2. Starting Quick Migration of Specific FCDs

$fcdInstantRecovery = Get-VBRFCDInstantRecoverySession -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
$server = Get-VBRServer -Name "tech.local"
$datastore = Find-VBRViDatastore -Server $server -Name "VeeamDatastore"
Start-VBRFCDInstantRecoveryMigration -Session $fcdInstantRecovery -TargetDatastore $datastore -MountedDiskNames ("disk1", "disk2")
This example shows how to starts Quick Migration of the disk1 and disk2 FCDs.
The cmdlet will perform migration with the following settings:
- The cmdlet will mirgate FCDs that have been recovered within the 49664A5F-9C55-4A1F-8E6A-1CD5705A684B FCD recovery session.
- The cmdlet will migrate FCDS to the VeeamDatastore target datastore.
Perform the following steps:

1. Run the Get-VBRFCDInstantRecoverySession cmdlet. Specify the Id parameter value. Save the result to the $fcdInstantRecovery variable.
2. Get the datastore:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Find-VBRViDatastore cmdlet. Specify the Server and Name parameter values. Save the result to the $datastore variable.
3. Run the Start-VBRFCDInstantRecoveryMigration cmdlet. Specify the following settings:
- Set the $fcdInstantRecovery varialbe as the Session parameter value.
- Set the $datastore varialbe as the TargetDatastore parameter value.
- Specify the MountedDiskNames parameter values.
> Example 3. Starting Quick Migration of all FCDs and Applying Specific Storage Policy

$fcdInstantRecovery = Get-VBRFCDInstantRecoverySession -Id "49664A5F-9C55-4A1F-8E6A-1CD5705A684B"
$server = Get-VBRServer -Name "tech.local"
$datastore = Find-VBRViDatastore -Server $server -Name "VeeamDatastore"
$storagePolicy = Find-VBRViStoragePolicy -Server $server -Datastore $datastore -Name "Virtual SAN Default"
Start-VBRFCDInstantRecoveryMigration -Session $fcdInstantRecovery -TargetDatastore $datastore -StoragePolicy $storagePolicy
This example shows how to starts Quick Migration for all FCDs and apply the Virtual SAN Default storage policy to these FCDs.
The cmdlet will perform migration with the following settings:
- The cmdlet will mirgate FCDs that have been recovered within the 49664A5F-9C55-4A1F-8E6A-1CD5705A684B FCD recovery session.
- The cmdlet will migrate FCDS to the VeeamDatastore target datastore.
Perform the following steps:

1. Run the Get-VBRFCDInstantRecoverySession cmdlet. Specify the Id parameter value. Save the result to the $fcdInstantRecovery variable.
2. Get the datastore:
a. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
b. Run the Find-VBRViDatastore cmdlet. Specify the Server and Name parameter values. Save the result to the $datastore variable.
3. Run the Find-VBRViStoragePolicy cmdlet. Specify the Server, Datastore and Name parameter values. Save the result to the $storagePolicy variable.
4. Run the Start-VBRFCDInstantRecoveryMigration cmdlet. Specify the following settings:
- Set the $fcdInstantRecovery varialbe as the Session parameter value.
- Set the $datastore varialbe as the TargetDatastore parameter value.
- Specify the MountedDiskNames parameter values.

---

### Parameters
#### **MountedDiskNames**
Specifies an array of FCDs names.
The cmdlet will migrate these FCDs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies the Instant FCD recovery session.
The cmdlet will start Quick Migration of FCDs that are restored using this session.
Note: The cmdlet will dismount the session after the virtual disks are migrated to the target datastore.
Accepts the VBRFCDInstantRecoverySession object.
To create this object, run the Get-VBRFCDInstantRecoverySession cmdlet.

|Type                            |Required|Position|PipelineInput                 |
|--------------------------------|--------|--------|------------------------------|
|`[VBRFCDInstantRecoverySession]`|true    |0       |True (ByPropertyName, ByValue)|

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

#### **TargetDatastore**
Specifies a target datastore to which you want to mirgate FCDs.
Note: The datastore must be located in the same vCenter, where a cluster to to which Veeam Backup & Replication will register FCDs, is located.
Accepts the VBRViDatastore object.
To create this object, run the Find-VBRViDatastore cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRViDatastore]`|true    |1       |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFCDInstantRecoverySession

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRFCDInstantRecoveryMigration

---

### Notes

---

### Syntax
```PowerShell
Start-VBRFCDInstantRecoveryMigration [-Session] <VBRFCDInstantRecoverySession> [-TargetDatastore] <VBRViDatastore> [-MountedDiskNames <String[]>] [-RunAsync] [-StoragePolicy <VBRViStoragePolicy>] 
```
```PowerShell
[<CommonParameters>]
```
