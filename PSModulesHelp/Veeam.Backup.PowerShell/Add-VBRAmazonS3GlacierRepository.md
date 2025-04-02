Add-VBRAmazonS3GlacierRepository
--------------------------------

### Synopsis
Adds Amazon S3 Glacier archive storage repository to the backup infrastructure.

---

### Description

This cmdlet adds Amazon S3 Glacier archive storage repository to the backup infrastructure.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Connect-VBRAmazonS3Service](Connect-VBRAmazonS3Service)

* [Get-VBRAmazonS3Bucket](Get-VBRAmazonS3Bucket)

* [Get-VBRAmazonS3Folder](Get-VBRAmazonS3Folder)

* [Get-VBRAmazonS3Region](Get-VBRAmazonS3Region)

* [Get-VBRAmazonEC2InstanceType](Get-VBRAmazonEC2InstanceType)

* [Get-VBRAmazonEC2VPC](Get-VBRAmazonEC2VPC)

* [Get-VBRAmazonEC2SecurityGroup](Get-VBRAmazonEC2SecurityGroup)

* [Get-VBRAmazonEC2Subnet](Get-VBRAmazonEC2Subnet)

* [New-VBRAmazonEC2ProxyAppliance](New-VBRAmazonEC2ProxyAppliance)

---

### Examples
> Adding Amazon S3 Glacier Repository to Backup Infrastructure

$account = Get-VBRAmazonAccount -AccessKey "XXXXXXXXXXXXXXXXXXX" -SecretKey "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
$connection = Connect-VBRAmazonS3Service -Account $account -RegionType Global -ServiceType ArchiveTier
$bucket = Get-VBRAmazonS3Bucket -Connection $connection -Name "connect"
$folder = Get-VBRAmazonS3Folder -Connection $connection -Bucket $bucket -Name "veeam"
$region = Get-VBRAmazonS3Region -Account $account -RegionType Global -Name "ap-northeast-1"
$instance = Get-VBRAmazonEC2InstanceType -Region $region -Name "al.xlarge"
$vpc = Get-VBRAmazonEC2VPC -Region $region
$sgroup = Get-VBRAmazonEC2SecurityGroup -VPC $vpc -Name "veeamvpc"
$subnet = Get-VBRAmazonEC2Subnet -VPC $vpc -Name "veeamsubnet"
$proxy = New-VBRAmazonEC2ProxyAppliance -InstanceType $instance -Subnet $subnet -SecurityGroup $sgroup -RedirectorPort 443
Add-VBRAmazonS3GlacierRepository -Connection $connection -AmazonS3Folder $folder -AmazonProxySpec $proxy -Name Repository09
This example shows how to add Amazon S3 Glacier object storage as a backup repository to the backup infrastructure.
Perform the following steps:
1. Specify Amazon connection settings:
a. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey and SecretKey parameter values. Save the result to the $account variable.
b. Run the Connect-VBRAmazonS3Service cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and ServiceType parameter values. Save the result to the $connection variable.
2. Specify object storage settings:
a. Run the Get-VBRAmazonS3Bucket cmdlet. Set the $connection variable as the Connection parameter value. Specify the Name parameter value. Save the result to the $bucket variable.
b. Run the Get-VBRAmazonS3Folder cmdlet. Set the $connection variable as the Connection parameter value. Set the $bucket variable as the Bucket parameter value. Specify the Name parameter value. Save the result to the $folder variable.
3. Define the Amazon proxy settings:
a. Run the Get-VBRAmazonS3Region cmdlet. Set the $account variable as the Account parameter value. Specify the RegionType and Name parameter values. Save the result to the $region variable.
b. Run the Get-VBRAmazonEC2InstanceType cmdlet. Set the $region variable as the Region parameter value. Specify the Name parameter value. Save the result to the $instance variable.
c. Run the Get-VBRAmazonEC2VPC cmdlet. Set the $region variable as the Region parameter value. Save the result to the $vpc variable.
d. Run the Get-VBRAmazonEC2SecurityGroup cmdlet. Set the $vpc variable as the VPC parameter value. Specify the Name parameter value. Save the result to the $sgroup variable.
e. Run the Get-VBRAmazonEC2Subnet cmdlet. Set the $vpc variable as the VPC parameter value. Specify the Name parameter value. Save the result to $subnet variable.
f. Run the New-VBRAmazonEC2ProxyAppliance cmdlet. Set the $instance variable as the InstanceType parameter value. Set the $subnet variable as the Subnet parameter value. Set the $sgroup variable as the SecurityGroup parameter value. Specify the RedirectorPort parameter value. Save the result to $proxy variable.
4. Run the Add-VBRAmazonS3GlacierRepository cmdlet. Specify the following settings:
- Set the $connection variable as the Connection parameter value.
- Set the $folder variable as the AmazonS3Folder parameter value.
- Set the $proxy variable as the AmazonProxySpec parameter value.
- Specify the Name parameter value.

---

### Parameters
#### **AmazonProxySpec**
Specifies the archiver appliance that will transfer the data from Amazon S3 to Amazon S3 Glacier object storage.

|Type                          |Required|Position|PipelineInput        |
|------------------------------|--------|--------|---------------------|
|`[VBRAmazonEC2ProxyAppliance]`|true    |named   |True (ByPropertyName)|

#### **AmazonS3Folder**
Specifies an Amazon S3 folder. Veeam Backup & Replication will move backup files into this folder.

|Type                 |Required|Position|PipelineInput |
|---------------------|--------|--------|--------------|
|`[VBRAmazonS3Folder]`|true    |named   |True (ByValue)|

#### **Connection**
Specifies an active session with an Amazon S3 Glacier object storage that you want to add as an archive repository.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRAmazonS3Connection]`|true    |named   |False        |

#### **Description**
Specifies a description of an Amazon S3 Glacier object storage. The cmdlet will add object storage with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupImmutability**
Enables the immutability option.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add an object storage repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of an Amazon S3 Glacier object storage. The cmdlet will add object storage with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **UseDeepArchive**
Defines that the cmdlet will create a repository where blocks are marked with the Glacier Deep Archive storage class.
Note: Note: If you do not provide the UseDeepArchive and UseInstantRetrieval parameters, the cmdlet will create a repository where blocks are marked as the Amazon S3 Glacier Flexible Retrieval storage class.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UseInstantRetrieval**
Defines that the cmdlet will create a repository where blocks are marked with the Amazon S3 Glacier Instant Retrieval storage class.
Note: If you do not provide the UseDeepArchive and UseInstantRetrieval parameters, the cmdlet will create a repository where blocks are marked as the Amazon S3 Glacier Flexible Retrieval storage class.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonS3Folder

Veeam.Backup.PowerShell.Infos.VBRAmazonEC2ProxyAppliance

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRAmazonS3GlacierRepository

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAmazonS3GlacierRepository -AmazonProxySpec <VBRAmazonEC2ProxyAppliance> -AmazonS3Folder <VBRAmazonS3Folder> -Connection <VBRAmazonS3Connection> [-Description <String>] [-EnableBackupImmutability] 
```
```PowerShell
[-Force] [-Name <String>] [-UseDeepArchive] [-UseInstantRetrieval] [<CommonParameters>]
```
