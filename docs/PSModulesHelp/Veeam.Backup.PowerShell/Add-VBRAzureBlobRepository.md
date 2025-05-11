Add-VBRAzureBlobRepository
--------------------------

### Synopsis
Adds Azure Blob object storage repository to the backup infrastructure.

---

### Description

This cmdlet adds Azure Blob object storage repository to to the backup infrastructure.

---

### Related Links
* [Get-VBRAzureBlobAccount](Get-VBRAzureBlobAccount)

* [Connect-VBRAzureBlobService](Connect-VBRAzureBlobService)

* [Get-VBRAzureBlobContainer](Get-VBRAzureBlobContainer)

* [Get-VBRAzureBlobContainer](Get-VBRAzureBlobContainer)

* [New-VBRAzureBlobFolder](New-VBRAzureBlobFolder)

---

### Examples
> Example 1. Adding Microsoft Azure Object Storage [Mapping to Existing Folder]

$account = Get-VBRAzureBlobAccount -Name "Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
$container = Get-VBRAzureBlobContainer -Connection $connect
$folder = Get-VBRAzureBlobFolder -Container $container -Connection $connect
Add-VBRAzureBlobRepository -AzureBlobFolder $folder[3] -Connection $connect
This example shows how to add Microsoft Azure Object Storage to the backup infrastructure and map object storage repository to an existing folder.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connect variable as the Connection parameter value. Save the result to the $container variable.
4. Run the Get-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connect variable as the Connection parameter value. Save the result to the $folder variable.
The Get-VBRAzureBlobFolder cmdlet will return an array of folders. Mind the ordinal number of the necessary folders (in our example, it is the fourth restore point in the array).
5. Run the Add-VBRAzureBlobRepository cmdlet. Set the $folder variable as the AzureBlobFolder parameter value. Set the $connect variable as the Connection parameter value.
> Example 2. Adding Microsoft Azure Object Storage [Mapping to New Folder]

$account = Get-VBRAzureBlobAccount -Name "Azure Blob"
$connect = Connect-VBRAzureBlobService -Account $account -RegionType Global -ServiceType CapacityTier
$container = Get-VBRAzureBlobContainer -Connection $connect
$folder = New-VBRAzureBlobFolder -Container $container -Connection $connect -Name "Images"
Add-VBRAzureBlobRepository -AzureBlobFolder $folder -Connection $connect
This example shows how to add Microsoft Azure Object Storage to the backup infrastructure and map object storage repository to a new folder. The cmdlet will map object storage repository to the Images folder.
Perform the following steps:
1. Run the Get-VBRAzureBlobAccount cmdlet. Specify the Name parameter value. Save the result to the $account variable.
2. Run the Connect-VBRAzureBlobService cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connect variable. 3. Run the Get-VBRAzureBlobContainer cmdlet. Set the $connect variable as the Connection parameter value. Save the result to the $container variable.
4. Run the New-VBRAzureBlobFolder cmdlet. Set the $container variable as the Container parameter value. Set the $connect variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $folder variable. 5. Run the Add-VBRAzureBlobRepository cmdlet. Set the $folder variable as the AzureBlobFolder parameter value. Set the $connect variable as the Connection parameter value.

---

### Parameters
#### **AzureBlobFolder**
Specifies an Azure Blob folder. The cmdlet will map object storage repository to this folder.

|Type                  |Required|Position|PipelineInput |
|----------------------|--------|--------|--------------|
|`[VBRAzureBlobFolder]`|true    |named   |True (ByValue)|

#### **AzureProxySpec**
Specifies a helper appliance. Veeam Backup & Replication will use this appliance to perform a health check of backup files and apply retention to NAS backup files.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRAzureComputeProxyAppliance]`|false   |named   |False        |

#### **Connection**
Specifies an active session with Azure Blob storage that you want to add as the backup repository.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRAzureBlobConnection]`|true    |named   |False        |

#### **Description**
Specifies a description of Azure Blob storage. The cmdlet will add Azure Blob storage to Veeam Backup & Replication with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupImmutability**
Defines that the cmdlet will enable the immutability option.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by the object storage repository.
Use the MaxConcurrentTasks paramter to specify the number of tasks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableCoolAccessTier**
Defines that Veeam Backup & Replication will keep blocks of data in the Cool access tier.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Defines that the cmdlet will enable size limits for an Azure Blob storage that you want to add as a backup repository.
Use the SizeLimit parameter to specify the size limits.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an object storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForceOwnershipChange**
Defines that the cmdlet will force ownership change of the object storage folder.
If you do not provide this parameter and the object storage folder is owned by another host, you will not be able to add object storage to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ImmutabilityPeriod**
For the EnableBackupImmutability parameter.
Defines the immutability period in days.
Default: 30 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MaxConcurrentTasks**
Specifies a maximum number of concurrent tasks that can be processed at once by the object storage repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountServerOptions**
Specifies settings of a mount server for object storage repositories.
Note: This parameter is required for object storage repositories that you want to add as performance extents to a scale-out backup repository.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRRepositoryMountServerOptions]`|false   |named   |False        |

#### **Name**
Specifies a name of an object storage. The cmdlet will add Azure Blob storage to Veeam Backup & Replication with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SizeLimit**
For the EnableSizeLimit parameter.
Specifies size limits in GB for data blocks that you want to store in Azure Blob storage added as an object storage repository.
Permitted value: 1024 - 1073741824.
Default: 10240

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureBlobFolder

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAzureBlobRepository -AzureBlobFolder <VBRAzureBlobFolder> [-AzureProxySpec <VBRAzureComputeProxyAppliance>] -Connection <VBRAzureBlobConnection> [-Description <String>] [-EnableBackupImmutability] 
```
```PowerShell
[-EnableConcurrentTasksLimit] [-EnableCoolAccessTier] [-EnableSizeLimit] [-Force] [-ForceOwnershipChange] [-ImmutabilityPeriod <Int32>] [-MaxConcurrentTasks <Int32>] [-MountServerOptions 
```
```PowerShell
<VBRRepositoryMountServerOptions>] [-Name <String>] [-SizeLimit <Int32>] [<CommonParameters>]
```
