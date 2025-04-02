Start-VBRvCloudQuickMigration
-----------------------------

### Synopsis
Starts a quick migration of Cloud Director VMs.

---

### Description

This cmdlet starts a quick migration of Cloud Director VMs.

NOTE: To perform a quick migration of Cloud Director VMs you must run an instant recovery of  the necessary Cloud Director VMs beforehand. Run the Start-VBRvCloudInstantRecovery cmdlet to perform an instant recovery of  the necessary Cloud Director VMs.

---

### Related Links
* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Start-VBRvCloudInstantRecovery](Start-VBRvCloudInstantRecovery)

---

### Examples
> Example 1

$restorepoint = Get-VBRRestorePoint
$VM = Start-VBRvCloudInstantRecovery -RestorePoint $restorepoint[1]
Start-VBRvCloudQuickMigration -InstantRecovery $VM
This example shows how to start quick migration of the vCloud VM.

Perform the following steps:
1. Run the Get-VBRRestorePoint cmdlet. Save the result to the $restorepoint variable.
2. Run the Start-VBRvCloudInstantRecovery cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $VM variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore point in the array).
3. Run the Start-VBRvCloudQuickMigration cmdlet. Set the $VM variable as the InstantRecovery parameter value.

---

### Parameters
#### **InstantRecovery**
Specifies the Cloud Director VM that you want to migrate

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[InstantRecovery]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **StorageProfile**
Specifies the storage policy of the selected Cloud Director VM that is restored to the original location.
Note: the cmdlet will not restore the storage policy of Cloud Director VMs in case you restore them to the different location.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|false   |named   |False        |

#### **vCloudDatastore**
Specifies the Cloud Director datastore.
Veeam Backup & Replication will move the Cloud Director VM data to the selected Cloud Director datastore.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdDatastoreRestoreInfo]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.InstantRecovery

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRvCloudQuickMigration -InstantRecovery <InstantRecovery> [-RunAsync] [-StorageProfile <CVcdOrgVdcStorageProfile>] [-vCloudDatastore <CVcdDatastoreRestoreInfo>] [<CommonParameters>]
```
