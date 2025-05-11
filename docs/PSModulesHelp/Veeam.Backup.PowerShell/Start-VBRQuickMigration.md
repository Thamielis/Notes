Start-VBRQuickMigration
-----------------------

### Synopsis
Starts Quick Migration of a virtual machine.

---

### Description

This cmdlet starts Quick Migration for a selected virtual machines.
Quick Migration is a service allowing to promptly migrate a VM between ESXi hosts, datastores or both in any state with minimum disruption to business operations and end user access to services.
Note: The cmdlet will not run if the geographic location of the VMs you want to migrate and the destination server location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Examples
> Example

$vm = Find-VBRViEntity -Name "server01.tech.global"
$server = Get-VBRServer -Type ESXi -Name "esx05.tech.local"
$pool = Find-VBRViResourcePool -Server $server
$datastore = Find-VBRViDatastore -Server $server
$folder = Find-VBRViFolder -Server $server
Start-VBRQuickMigration -Entity $vm -Server $server -ResourcePool $pool -Datastore $datastore -Folder $folder -DeleteSorceVmFiles
This command starts Quick Migration of the selected VM with the following settings:
- The source and target proxies are not set enabling the Quick Migration mechanism to select them automatically.
- The ForceVeeamQM parameter is not set enabling the use of VMware VMotion.
- The DeleteSourceVmFiles parameter is set to enable the clear up of the original VM files upon successful migration.
- The RunAsync parameter is not set.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRServer cmdlet. Set the ESXi option for the Type parameter. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Find-VBRViResourcePool cmdlet. Set the $server variable as the Server parameter value. Save the result to the $pool variable.
4. Run the Find-VBRViDatastore cmdlet. Set the $server variable as the Server parameter value. Save the result to the $datastore variable.
5. Run the Find-VBRViFolder cmdlet. Set the $server variable as the Server parameter value. Save the result to the $folder variable.
6. Run the Start-VBRQuickMigration cmdlet. Specify the following settings:
- Set the $vm variable as the Entity parameter value.
- Set the $server variable as the Server parameter value.
- Set the $pool variable as the ResourcePool parameter value.
- Set the $datastore variable as the Datastore parameter value.
- Set the $folder variable as the Folder parameter value.
- Provide the DeleteSorceVmFiles parameter.

---

### Parameters
#### **Datastore**
Specifies the destination datastore to where you want to migrate the VMs.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[CViDatastoreItem]`|false   |named   |False        |

#### **DeleteSorceVmFiles**
Defines that the original VM will be deleted upon receiving the heartbeat from the VM on the target host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Entity**
Specifies the array of virtual machines you want to migrate.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CViVmItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Folder**
Specifies the destination folder to where you want to migrate the VMs.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will start Quick Migration even if the geographic location of the VMs you want to migrate and the destination server location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForceVeeamQM**
Defines that the cmdlet will force using Veeam Quick Migration.
If omitted, migration process will use VMware VMotion given that the migration scenario and VMware licensing allows it.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ResourcePool**
Specifies the destination resource pool to where you want to migrate the VMs.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the destination server to where you want to migrate the VMs.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **SourceProxy**
Specifies the array of source proxies.
For best migration performance deploy at least one source backup proxy.
Default: automatic selection (recommended).

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **StoragePolicy**
Specifies the VMware storage policy profile that must be applied to the virtual disks of the VMs.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViStoragePolicy]`|false   |named   |False        |

#### **TargetProxy**
Specifies the array of target proxies.
For best migration performance deploy at least one target backup proxy.
Default: automatic selection (recommended).

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.Infrastructure.CViVmItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRQuickMigration [-Datastore <CViDatastoreItem>] [-DeleteSorceVmFiles] -Entity <CViVmItem[]> [-Folder <CViFolderItem>] [-Force] [-ForceVeeamQM] [-ResourcePool <CViResourcePoolItem>] [-RunAsync] -Server 
```
```PowerShell
<CHost> [-SourceProxy <CViProxy[]>] [-StoragePolicy <VBRViStoragePolicy>] [-TargetProxy <CViProxy[]>] [<CommonParameters>]
```
