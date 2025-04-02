Add-VBRAmazonS3Repository
-------------------------

### Synopsis
Adds Amazon S3 object storage repository to the backup infrastructure.

---

### Description

This cmdlet adds Amazon S3 object storage repository to the backup infrastructure.
IMPORTANT! Run the Add-VBRAmazonS3ExternalRepository to add Amazon S3 object storage as an external backup repository.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

* [Get-VBRAmazonS3Bucket](Get-VBRAmazonS3Bucket)

* [Get-VBRAmazonS3Folder](Get-VBRAmazonS3Folder)

---

### Examples
> Adding Amazon S3 Object Storage to Backup Infrastructure

$account = Get-VBRAmazonAccount
$connect = Connect-VBRAmazonS3Service -Account $account[1] -RegionType Global -ServiceType CapacityTier
$bucket = Get-VBRAmazonS3Bucket -Connection $connect -Name "Bucket-01"
$folder = Get-VBRAmazonS3Folder -Name "bucket" -Bucket $bucket -Connection $connect
Add-VBRAmazonS3Repository -Name "AmazonS3Repository" -Connection $connect -AmazonS3Folder $folder -EnableIAStorageClass -EnableSizeLimit -SizeLimit 1024
This example shows how to add Amazon S3 object storage as a backup repository to Veeam Backup & Replication. The repository will have the following settings:
- The object storage limits are enabled and are set to 1024 GB.
- The infrequent access storage class is enabled.
You will need to perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3Service cmdlet. Specify the Account, RegionType and ServiceType parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connect variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $bucket variable.
4. Run the Get-VBRAmazonS3Folder cmdlet. Specify the Name parameter value. Set the $bucket variable as the Bucket parameter value. Set the $connect variable as the Connection parameter value. Save the result to the $folder variable.
5. Run the Add-VBRAmazonS3Repository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $connect variable as the Connection parameter value.
- Set the $folder variable as the AmazonS3Folder parameter value.
- Provide the EnableIAStorageClass parameter.
- Provide the EnableSizeLimit parameter.
- Provide the SizeLimit parameter value.

---

### Parameters
#### **AmazonProxySpec**
Specifies a helper appliance. Veeam Backup & Replication will use this appliance to perform a health check of backup files and apply retention to NAS backup files.

|Type                          |Required|Position|PipelineInput        |
|------------------------------|--------|--------|---------------------|
|`[VBRAmazonEC2ProxyAppliance]`|false   |named   |True (ByPropertyName)|

#### **AmazonS3Folder**
Specifies an Amazon S3 folder.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRAmazonS3Folder]`|true    |named   |True (ByValue)|

#### **Connection**
Specifies an active session with Amazon S3 object storage that you want to add as the backup repository.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRAmazonS3Connection]`|true    |named   |False        |

#### **Description**
Specifies a description of an Amazon S3 object storage. The cmdlet will add object storage with this description.

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
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableIAStorageClass**
Defines that the cmdlet will enable the infrequent access storage class for data blocks that are stored in an Amazon S3 object storage.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableOZIAStorageClass**
Defines that the cmdlet will enable the One Zone-IA storage class for data blocks that are stored in an Amazon S3 object storage.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Enables size limits for data blocks that you want to store in an Amazon S3 object storage.
Use the SizeLimit parameter to specify the size limits.
Default: False.

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
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ImmutabilityPeriod**
For the EnableBackupImmutability parameter.
Defines the immutability period in days.
Default: 30

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
Specifies a name of an Amazon S3 object storage. The cmdlet will add object storage with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SizeLimit**
For the EnableSizeLimit parameter.
Specifies size limits in GB for data blocks that you want to store in an Amazon S3 object storage.
Permitted value: 1024 - 1073741824.
Default: 10240 GB.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Folder

Veeam.Backup.PowerShell.Infos.VBRAmazonEC2ProxyAppliance

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAmazonS3Repository [-AmazonProxySpec <VBRAmazonEC2ProxyAppliance>] -AmazonS3Folder <VBRAmazonS3Folder> -Connection <VBRAmazonS3Connection> [-Description <String>] [-EnableBackupImmutability] 
```
```PowerShell
[-EnableConcurrentTasksLimit] [-EnableIAStorageClass] [-EnableOZIAStorageClass] [-EnableSizeLimit] [-Force] [-ForceOwnershipChange] [-ImmutabilityPeriod <Int32>] [-MaxConcurrentTasks <Int32>] 
```
```PowerShell
[-MountServerOptions <VBRRepositoryMountServerOptions>] [-Name <String>] [-SizeLimit <Int32>] [<CommonParameters>]
```
