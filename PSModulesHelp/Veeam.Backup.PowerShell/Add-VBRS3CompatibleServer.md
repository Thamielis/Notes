Add-VBRS3CompatibleServer
-------------------------

### Synopsis
Adds S3 compatible object storage as an unstructured data source to the inventory.

---

### Description

This cmdlet adds S3 compatible object storage as unstructured data source to the inventory.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRNASProxyServer](Get-VBRNASProxyServer)

---

### Examples
> Adding S3 Compatible Storage as Unstructured Data Source

$account = Get-VBRAmazonAccount -AccessKey "XXXXXXXX" -SecretKey "XXXXXXXXXXXX" -Description "S3 account"
$cacherepository = Get-VBRBackupRepository -Name "WinSrv"
Add-VBRS3CompatibleServer -FriendlyName "S3 compatible" -Account $account -ServicePoint "S3.eu.compatible" -CacheRepository $cacherepository
This example shows how to add S3 compatible storage as unstructured data source to the inventory.

Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the AccessKey, SecretKey and the Description parameters values. Save the result to the $account variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $cacherepository variable.
3. Run the Add-VBRAmazonS3Server cmdlet. Specify the following settings:
- Specify the FriendlyName parameter value.
- Set the $account variable as the Account parameter value.
- Specify the ServicePoint parameter value.
- Set the $cacherepository variable as the CacheRepository parameter value.

---

### Parameters
#### **Account**
Specifies an S3 credentials record. Veeam Backup & Replication will use this credentials record to connect to S3 compatible object storage. Accepts the VBRAmazonAccount object.  To get this object, run the Get-VBRAmazonAccount cmdlet.

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[VBRAmazonAccount]`|true    |named   |True (ByValue)|

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
Specifies a name of the S3 compatible bucket. The cmdlet will connect to this bucket.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **CacheRepository**
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository. Accepts the CBackupRepository object.  To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will add S3 compatible object storage without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FriendlyName**
Specify a name that you want to assign to the object storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **ProxyMode**
Specifies the backup proxy options:
* Automatic: use this option if you want Veeam Backup & Replication to choose the backup proxy that will process object storage.
* SelectedProxy: use this option if you want to specify the backup proxy that will process object storage. Use the SelectedProxyServer parameter to specify the backup proxy.
Valid Values:

* Automatic
* SelectedProxy

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRNASProxyMode]`|false   |named   |False        |

#### **RegionId**
Specifies a region.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **SelectedProxyServer**
For the SelectedProxy option of the ProxyMode parameter. Specifies the backup proxy. Veeam Backup & Replication will use this backup proxy to back up S3 compatible object storage. Accepts the VBRNASProxyServer[] object.  To get this object, run the Get-VBRNASProxyServer cmdlet.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRNASProxyServer[]]`|false   |named   |False        |

#### **ServicePoint**
Specifies a service point address of object storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRS3CompatibleServer -Account <VBRAmazonAccount> [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-BucketName <String>] -CacheRepository <CBackupRepository> [-Force] -FriendlyName <String> 
```
```PowerShell
[-ProxyMode {Automatic | SelectedProxy}] [-RegionId <String>] [-SelectedProxyServer <VBRNASProxyServer[]>] -ServicePoint <String> [<CommonParameters>]
```
