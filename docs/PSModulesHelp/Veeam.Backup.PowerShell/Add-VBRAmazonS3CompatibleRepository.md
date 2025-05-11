Add-VBRAmazonS3CompatibleRepository
-----------------------------------

### Synopsis
Adds S3 compatible and S3-integrated object storage repositories to the backup infrastructure.

---

### Description

This cmdlet adds S3 compatible and S3-integrated object storage repositories to Veeam Backup & Replication.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3CompatibleService](Connect-VBRAmazonS3CompatibleService)

* [Get-VBRAmazonS3Bucket](Get-VBRAmazonS3Bucket)

* [Get-VBRAmazonS3Folder](Get-VBRAmazonS3Folder)

---

### Examples
> Adding Amazon S3 Object Storage to Backup Infrastructure

$account = Get-VBRAmazonAccount
$connect = Connect-VBRAmazonS3CompatibleService -Account $account -CustomRegionId "us-east-1" -ServicePoint "http://123.45.67.89:9000"
$bucket = Get-VBRAmazonS3Bucket -Connection $connect -Name "New Bucket"
$folder = Get-VBRAmazonS3Folder -Name "New Folder" -Bucket $bucket -Connection $connect
Add-VBRAmazonS3CompatibleRepository -AmazonS3Folder $folder -Connection $connect -Name "New Repository"
This example shows how to add an Amazon S3 compatible object storage repository to the backup infrastructure.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Save the result to the $account variable.
2. Run the Connect-VBRAmazonS3CompatibleService cmdlet. Set the $account variable as the Account parameter value. Specify the CustomRegionId and ServicePoint parameter values. Save the result to the $connect variable.
3. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connect variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $bucket variable.
4. Run the Get-VBRAmazonS3Folder cmdlet. Specify the Name parameter value. Set the $bucket variable as the Bucket parameter value. Set the $connect variable as the Connection parameter value. Save the result to the $folder variable.
5. Run the Add-VBRAmazonS3CompatibleRepository cmdlet. Set the $folder variable as the AmazonS3Folder parameter value. Set the $connect variable as the Connection parameter value. Specify the Name parameter value.

---

### Parameters
#### **AmazonS3Folder**
Specifies an S3 compatible folder. Veeam Backup & Replication will move backup files into this folder.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRAmazonS3Folder]`|true    |named   |True (ByValue)|

#### **Connection**
Specifies an active session with S3 compatible object storage. The cmdlet will add it as a backup repository.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRAmazonS3CompatibleConnection]`|true    |named   |False        |

#### **Description**
Specifies a description of an S3 ?ompatible object storage. The cmdlet will add object storage with this description.

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
Defines that the cmdlet will enable limits for concurrent tasks that can be processed by the object storage repository.
Use the MaxConcurrentTasks paramter to specify the number of tasks.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableSizeLimit**
Defines that the cmdlet will enable size limits for data blocks that you want to store in an S3 compatible storage.
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
Default: 30 days.
Maximum: 999 days.

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
Specifies a name of an S3 compatible object storage. The cmdlet will add object storage with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ProxyAppliance**
Specifies a helper appliance. Veeam Backup & Replication will use this appliance to perform a health check of backup files and apply retention to NAS backup files.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **SizeLimit**
For the EnableSizeLimit parameter.
Specifies size limits in GB for data blocks that you want to store in an S3 compatible object storage added as a backup repository.
Permitted value: 1024 - 1073741824.
Default: 10240.
Note: [For S3-integrated repository] If you specify size limits that exceed an actual capacity of the S3-integrated repository, you will get a warning. Provide the Force parameter to skip this warning.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Folder

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAmazonS3CompatibleRepository -AmazonS3Folder <VBRAmazonS3Folder> -Connection <VBRAmazonS3CompatibleConnection> [-Description <String>] [-EnableBackupImmutability] [-EnableConcurrentTasksLimit] 
```
```PowerShell
[-EnableSizeLimit] [-Force] [-ForceOwnershipChange] [-ImmutabilityPeriod <Int32>] [-MaxConcurrentTasks <Int32>] [-MountServerOptions <VBRRepositoryMountServerOptions>] [-Name <String>] [-ProxyAppliance <CHost>] 
```
```PowerShell
[-SizeLimit <Int32>] [<CommonParameters>]
```
