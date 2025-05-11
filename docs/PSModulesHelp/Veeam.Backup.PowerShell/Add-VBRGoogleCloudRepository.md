Add-VBRGoogleCloudRepository
----------------------------

### Synopsis
Adds the Google Cloud object storage repository to the backup infrastructure.

---

### Description

This cmdlet adds the Google Cloud object storage repository to the backup infrastructure.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

* [Connect-VBRGoogleCloudService](Connect-VBRGoogleCloudService)

* [Get-VBRGoogleCloudRegion](Get-VBRGoogleCloudRegion)

* [Get-VBRGoogleCloudBucket](Get-VBRGoogleCloudBucket)

* [Get-VBRGoogleCloudFolder](Get-VBRGoogleCloudFolder)

---

### Examples
> Adding Google Cloud Repository

$account = Get-VBRGoogleCloudAccount -AccessKey "XXXXXXXXXXXXXXXXXXX"
$connection = Connect-VBRGoogleCloudService -Account $account -ServiceType CapacityTier
$region = Get-VBRGoogleCloudRegion -Connection $connection
$bucket = Get-VBRGoogleCloudBucket -Connection $connection -Region $region -Name "bucket01"
$folder = Get-VBRGoogleCloudFolder -Connection $connection -Bucket $bucket -Name "veeam"
Add-VBRGoogleCloudRepository -Connection $connection -Folder $folder -Name "Repository09"
This example shows how to add Google Cloud object storage to the backup infrastructure.
Perform the following steps:
1. Specify Google Cloud connection settings:
a. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $account variable.
b. Run the Connect-VBRGoogleCloudService cmdlet. Set the $account variable as the Account parameter value. Specify the ServiceType parameter value. Save the result to the $connection variable.
2. Specify object storage settings:
a. Run the Get-VBRGoogleCloudRegion cmdlet. Set the $connection variable as the Connection parameter value. Save the result to the $region variable.
b. Run the Get-VBRGoogleCloudBucket cmdlet. Set the $connection variable as the Connection parameter value. Set the $region variable as the Region parameter value. Specify the Name parameter value. Save the result to the $bucket variable.
c. Run the Get-VBRGoogleCloudFolder cmdlet. Set the $connection variable as the Connection parameter value. Set the $bucket variable as the Bucket parameter value. Specify the Name parameter value. Save the result to the $folder variable.
3. Run the Add-VBRGoogleCloudRepository cmdlet. Specify the following settings:
- Set the $connection variable as the Connection parameter value.
- Set the $folder variable as the Folder parameter value.
- Specify the Name parameter value.

---

### Parameters
#### **Connection**
Specifies an active session with a Google Cloud object storage that you want to add to the backup infrastructure.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRGoogleCloudConnection]`|true    |named   |False        |

#### **Description**
Specifies a description of a Google Cloud object storage. The cmdlet will add an object storage with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableColdlineStorageClass**
Assigns the Coldline storage class to data blocks that you want to keep in Google Cloud object storage. Use this option if you plan to access your backup data rarely (for example, once a quarter) and plan to store data minimum 90 days. Default: False. Note: If you do not provide the EnableNearlineStorageClass or EnableColdlineStorageClass parameters, the cmdlet will assing the Standard storage class to data blocks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableConcurrentTasksLimit**
Enables limits for concurrent tasks that can be processed by the object storage repository. Use the MaxConcurrentTasks paramter to specify the number of tasks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableNearlineStorageClass**
Enables the nearline storage class for optimized archive storage.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Enables size limits for the Google Cloud storage that you want to add as an object storage.
Default: False.
Note: Use the SizeLimit parameter to specify the size limits.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Folder**
Specifies a Google Cloud folder. Veeam Backup & Replication will move backup files into this folder.

|Type                    |Required|Position|PipelineInput |
|------------------------|--------|--------|--------------|
|`[VBRGoogleCloudFolder]`|true    |named   |True (ByValue)|

#### **Force**
Defines that the cmdlet will add ab object storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForceOwnershipChange**
Defines that the cmdlet will force ownership change of the object storage folder. If you do not provide this parameter and the object storage folder is owned by another host, you will not be able to add object storage to the backup infrastructure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GoogleProxySpec**
Specifies proxy appliance settings for adding object storage repository.

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRGoogleCloudComputeProxyAppliance]`|false   |named   |False        |

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
Specifies a name of the Google Cloud object storage. The cmdlet will add an object storage with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SizeLimit**
For the EnableSizeLimit parameter.
Specifies the size limits in TB or PB for data blocks that you want to store in Google Cloud storage added as an object storage repository.
Default: 10 TB.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudFolder

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRGoogleCloudRepository -Connection <VBRGoogleCloudConnection> [-Description <String>] [-EnableColdlineStorageClass] [-EnableConcurrentTasksLimit] [-EnableNearlineStorageClass] [-EnableSizeLimit] -Folder 
```
```PowerShell
<VBRGoogleCloudFolder> [-Force] [-ForceOwnershipChange] [-GoogleProxySpec <VBRGoogleCloudComputeProxyAppliance>] [-MaxConcurrentTasks <Int32>] [-MountServerOptions <VBRRepositoryMountServerOptions>] [-Name 
```
```PowerShell
<String>] [-SizeLimit <Int32>] [<CommonParameters>]
```
