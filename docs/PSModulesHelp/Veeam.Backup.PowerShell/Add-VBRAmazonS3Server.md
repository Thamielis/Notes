Add-VBRAmazonS3Server
---------------------

### Synopsis
Adds Amazon S3 storage as unstructured data source to the inventory.

---

### Description

This cmdlet adds Amazon S3 storage to the inventory. You can use this object storage as a source of data for object storage backup job.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonS3Region](Get-VBRAmazonS3Region)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Adding Amazon S3 Storage as Unstructured Data Source

$account = Get-VBRAmazonAccount -AccessKey "XXXXXXXX" -SecretKey "XXXXXXXXXXXX" -Description "AWS account"
$region = Get-VBRAmazonS3Region -RegionId "eu-central-1"
$cacherepository = Get-VBRBackupRepository -Name "WinSrv"
Add-VBRAmazonS3Server -FriendlyName "Amazon S3 OS" -Account $account -Region $region -CacheRepository $cacherepository
This example shows how to add Amazon S3 storage as unstructured data source to the inventory.

Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey, SecretKey and the Description parameters values. Save the result to the $account variable.
2. Run the Get-VBRAmazonS3Region cmdlet. Specify the RegionId parameter value. Save the result to the $region variable.
3. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $cacherepository variable.
4. Run the Add-VBRAmazonS3Server cmdlet. Specify the following settings:
- Specify the FriendlyName parameter value.
- Set the $account variable as the Account parameter value.
- Set the $region variable as the Region parameter value.
- Set the $cacherepository variable as the CacheRepository parameter value.

---

### Parameters
#### **Account**
Specifies an Amazon S3 credentials record. Veeam Backup & Replication will use this credentials record to connect to Amazon S3 storage. Accepts the VBRAmazonAccount object.  To get this object, run the Get-VBRAmazonAccount cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAmazonAccount]`|true    |named   |False        |

#### **BackupIOControlLevel**
Specifies a speed that Veeam Backup & Replication will use to read data from object storage. You can specify either of the following speed:
* Lowest
* Low
* Medium
* High
* Highest
Valid Values:

* Lowest
* Low
* Medium
* High
* Highest

|Type                                   |Required|Position|PipelineInput|
|---------------------------------------|--------|--------|-------------|
|`[VBRUnstructuredBackupIOControlLevel]`|false   |named   |False        |

#### **BucketName**
Specifies a name of the Amazon S3 bucket. The cmdlet will connect to this bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CacheRepository**
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **FriendlyName**
Specify a name that you want to assign to the object storage.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |True (ByValue)|

#### **ProxyMode**
Specifies the backup proxy options:
* Automatic: use this option if you want Veeam Backup & Replication to choose the backup proxy that will process object storage.
* SelectedProxy: use this option if you want to specify the backup proxy that will process object storage.  Use the SelectedProxyServer parameter to specify the backup proxy.
Valid Values:

* Automatic
* SelectedProxy

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNASProxyMode]`|false   |named   |False        |

#### **Region**
Specifies an array of Amazon S3 regions where Amazon S3 buckets are located. The cmdlet will return an array of Amazon S3 buckets from these Amazon S3 regions. Accepts the VBRAmazonS3Region object.  To get this object, run the Get-VBRAmazonS3Region cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRAmazonS3Region]`|true    |named   |False        |

#### **SelectedProxyServer**
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to back up Amazon S3 object storage. Accepts the VBRNASProxyServer[] object.  To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRAmazonS3Server -Account <VBRAmazonAccount> [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-BucketName <String>] -CacheRepository <CBackupRepository> -FriendlyName <String> [-ProxyMode 
```
```PowerShell
{Automatic | SelectedProxy}] -Region <VBRAmazonS3Region> [-SelectedProxyServer <VBRNASProxyServer[]>] [<CommonParameters>]
```
