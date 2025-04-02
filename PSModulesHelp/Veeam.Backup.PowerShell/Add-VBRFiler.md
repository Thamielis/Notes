Add-VBRFiler
------------

### Synopsis
Adds an enterprise NAS system as a file share to the backup infrastructure.

---

### Description

This cmdlet adds an enterprise NAS system as a file share to the backup infrastructure.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Adding Enterprise NAS System as File Share Without Authentication

$netapp = Get-NetAppHost -Name 'ontap-2'
$repository = Get-VBRBackupRepository -Name "Backup Repository 05"
Add-VBRFiler -StorageServer $netapp -CacheRepository $repository
This example shows how to add the ontap-2 enterprise NAS system as a file share to the inventory without authentication. The cmdlet will set the Backup Repository 05 as the cache repository.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $netapp variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Add-VBRFiler cmdlet. Specify the following settings:
- Set the $netapp variable as the StorageServer parameter value.
- Set the $repository variable as the CacheRepository parameter value.
> Example 2. Adding Enterprise NAS System as File Share with User Name and Password

$netapp = Get-NetAppHost -Name 'ontap-2'
$repository = Get-VBRBackupRepository -Name 'Backup Repository 05'
Add-VBRFiler -StorageServer $netapp -User Administrator -Password AdminCredentials -CacheRepository $repository
This example shows how to add the ontap-2 enterprise NAS system as a file share to the inventory with user name and password. The cmdlet will set the Backup Repository 05 as the cache repository.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $netapp variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Add-VBRFiler cmdlet. Specify the following settings:
- Set the $netapp variable as the StorageServer parameter value.
- Specify the User parameter value.
- Specify the Password parameter value.
- Set the $repository variable as the CacheRepository parameter value.
> Example 3. Adding Enterprise NAS System as a File Share with Credentials

$netapp = Get-NetAppHost -Name 'ontap-2'
$repository = Get-VBRBackupRepository -Name 'Backup Repository 05'
$credentials = Get-VBRCredentials -Name "Veeam Administrator"
Add-VBRFiler -StorageServer $netapp -AccessCredentials $credentials -CacheRepository $repository
This example shows how to add the ontap-2 enterprise NAS system as a file share to the inventory with credentials. The cmdlet will set the Backup Repository 05 as the cache repository.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $netapp variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Get-VBRCredentials cmdlet. Save the result to the $credentials variable.
4. Run the Add-VBRFiler cmdlet. Specify the following settings:
- Set the $netapp variable as the StorageServer parameter value.
- Set the $credentials variable as the AccessCredentials parameter value.
- Set the $repository variable as the CacheRepository parameter value.

---

### Parameters
#### **AccessCredentials**
Specifies credentials that the cmdlet will use to authenticate against the enterprise NAS system. Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **BackupIOControlLevel**
Specifies a speed that Veeam Backup & Replication will use to read data from the file server. You can specify one of the following speed:
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

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRNASBackupIOControlLevel]`|false   |named   |False        |

#### **CacheRepository**
Specifies the cache repository. Veeam Backup & Replication will keep the .VCACHE files on this repository. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **EnableSnapDiff**
Use this parameter for Dell PowerScale (formerly Isilon) storages only. Defines that during the file share backup jobs Veeam Backup & Replication will use the file change tracking technology provided by the NAS manufacturer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password. The cmdlet will use this password to authenticate against the enterprise NAS system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **StorageServer**
Specifies the storage server where the file share is located. The cmdlet will add this storage server as a file share to the backup infrastructure. Accepts the IHost object. To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[IHost]`|true    |named   |True (ByPropertyName, ByValue)|

#### **User**
Specifies the user name. The cmdlet will apply this user name to authenticate against the enterprise NAS system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.Core.IHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRFiler -AccessCredentials <CCredentials> [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] -CacheRepository <CBackupRepository> [-EnableSnapDiff] -StorageServer <IHost> [<CommonParameters>]
```
```PowerShell
Add-VBRFiler [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] -CacheRepository <CBackupRepository> [-EnableSnapDiff] -Password <String> -StorageServer <IHost> -User <String> [<CommonParameters>]
```
