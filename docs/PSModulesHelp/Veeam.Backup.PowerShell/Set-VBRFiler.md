Set-VBRFiler
------------

### Synopsis
Modifies enterprise NAS systems added as file shares to the inventory.

---

### Description

This cmdlet modifies settings of enterprise NAS systems added to the backup infrastructure. To modify settings, you need to enter the corresponding parameters with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRFiler](Get-VBRFiler)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Modifying Enterprise NAS System Added as File Share Without Authentication

$filer = Get-VBRFiler -Name 'ontap-2'
$repository = Get-VBRBackupRepository -Name "Backup Repository 02"
Set-VBRFiler -Filer $filer -CacheRepository $repository
This example shows how to modify the enterprise NAS system as a file share to the inventory without authentication.

Perform the following steps:
1. Run the Get-VBRFiler cmdlet. Specify the Name parameter value. Save the result to the $filer variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Set-VBRFiler cmdlet. Specify the following settings:
- Set the $filer variable as the Filer parameter value.
- Set the $repository variable as the CacheRepository parameter value.
> Example 2. Modifying Enterprise NAS System Added as File Share with User Name and Password

$filer = Get-VBRFiler -Name 'ontap-2'
$repository = Get-VBRBackupRepository -Name "Backup Repository 02"
Set-VBRFiler -Filer $filer -User Administrator -Password AdminCredentials -CacheRepository $repository
This example shows how to modify the enterprise NAS system added as a file share to the inventory with user name and password.

Perform the following steps:
1. Run the Get-VBRFiler cmdlet. Specify the Name parameter value. Save the result to the $filer variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Set-VBRFiler cmdlet. Specify the following settings:
- Set the $filer variable as the Filer parameter value.
- Specify the User parameter value.
- Specify the Password parameter value.
- Set the $repository variable as the CacheRepository parameter value.
> Example 3. Modifying Enterprise NAS System Added as File Share with Credentials

$filer = Get-VBRFiler -Name "ontap-2"
$repository = Get-VBRBackupRepository -Name "Backup Repository 02"
$credentials = Get-VBRCredentials
Set-VBRFiler -Filer $filer -AccessCredentials $credentials -CacheRepository $repository
This example shows how to modify the enterprise NAS system added as a file share to the infrastructure with credentials.

Perform the following steps:
1. Run the Get-VBRFiler cmdlet. Specify the Name parameter value. Save the result to the $filer variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Get-VBRCredentials cmdlet. Save the result to the $credentials variable.
4. Run the Set-VBRFiler cmdlet. Specify the following settings:
- Set the $filer variable as the Filer parameter value.
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
Specifies a speed that Veeam Backup & Replication will use to read data from the file server. You can specify either of the following speed:
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
|`[CBackupRepository]`|false   |named   |False        |

#### **EnableSnapDiff**
Use this parameter for Dell PowerScale (formerly Isilon) storages only. Defines that during the file share backup jobs Veeam Backup & Replication will use the file change tracking technology provided by the NAS manufacturer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Filer**
Specifies the enterprise NAS system. The cmdlet will modify the settings of this server. Accepts the VBRFiler object. To get this object, run the Add-VBRFiler cmdlet.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[VBRFiler]`|true    |named   |True (ByPropertyName, ByValue)|

#### **MetaMigrationType**
Specifies how the cmdlet will migrate metadata. You can use one of the following options:
* CheckExistence - use this option to check that metadata is available on the current cache repository.
* CopyMetaFromCache - use this option to migrate metadata from source cache repository to a new cache respository. Note: If metadata in a source cache repository is corruted, the cmdlet will copy data from the archive repository.
* DownloadMetaFromArchive - use this option to migrate metadata from archive repository or from replica metadata in archive repository.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRNASBackupMetaMigrationType]`|false   |named   |False        |

#### **Password**
Specifies the password. The cmdlet will use this password to authenticate against the enterprise NAS system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **RequireAccessCredentials**
Defines that the cmdlet will check whether Veeam Backup & Replication uses authentication to access the SMB network shared folder. If you do not provide this parameter, the cmdlet will not check credentials that are used to access the SMB network shared folder. To remove credentials, specify the RequireAccessCredentials parameter with the :$False value. Note: If credentials are not provided, the cmdlet will return an error. To avoid the error, you must specify credentials using either of the following parameters:
* User and Password
* AccessCredentials

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **User**
Specifies the user name. The cmdlet will apply this user name to authenticate against the enterprise NAS system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFiler

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRFiler -AccessCredentials <CCredentials> [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-EnableSnapDiff] -Filer <VBRFiler> [-MetaMigrationType 
```
```PowerShell
{CheckExistence | CopyMetaFromCache | DownloadMetaFromArchive}] [-RequireAccessCredentials] [<CommonParameters>]
```
```PowerShell
Set-VBRFiler [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] [-CacheRepository <CBackupRepository>] [-EnableSnapDiff] -Filer <VBRFiler> [-MetaMigrationType {CheckExistence | CopyMetaFromCache | 
```
```PowerShell
DownloadMetaFromArchive}] -Password <String> [-RequireAccessCredentials] -User <String> [<CommonParameters>]
```
