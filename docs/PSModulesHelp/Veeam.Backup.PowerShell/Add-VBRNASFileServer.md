Add-VBRNASFileServer
--------------------

### Synopsis
Adds managed Windows or Linux file serves to the Veeam Backup & Replication infrastructure.

---

### Description

This cmdlet adds managed Windows or Linux file servers to the Veeam Backup & Replication infrastructure.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Adding File Servers

$server = Get-VBRServer -Name "Active_Directory"
$repository = Get-VBRBackupRepository -Name "Backup Repository 08"
Add-VBRNASFileServer -Server $server -CacheRepository $repository
This example shows how to add managed Windows or Linux file servers to the Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
3. Run the Add-VBRNASNFSServer cmdlet. Set the $server variable as the Server parameter value. Set the $repository variable as the CacheRepository parameter value.

---

### Parameters
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
|`[CBackupRepository]`|true    |named   |False        |

#### **Server**
Specifies the host where the file server is located. Veeam Backup & Replication will add the file server that is located on this host. Accepts the CHost object. To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[CHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Common.CHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRNASFileServer [-BackupIOControlLevel {Lowest | Low | Medium | High | Highest}] -CacheRepository <CBackupRepository> -Server <CHost> [<CommonParameters>]
```
