Get-VBRServer
-------------

### Synopsis
Returns hosts connected to the backup infrastructure.

---

### Description

This cmdlet returns hosts connected to the backup infrastructure. You can get the following servers:
- BackupServer
- VC
- ESXi
- VcdSystem
- Scvmm
- HvServer
- HvCluster
- SmbCluster
- SmbServer
- Windows
- Linux
- Cloud
- Local
- SanHost
- Object storage repositories
- Object storage servers
You can get the list of all hosts or narrow down the output to servers of specific type, or search for instances directly by name.
To get VMware objects run the Find-VBRViEntity cmdlet.
To get Hyper-V objects run the Find-VBRHvEntity cmdlet.

---

### Examples
> Example 1. Looking for Server by Name

```PowerShell
Get-VBRServer -Name "Active_Directory"
This command looks for the server named Active_Directory.
```
> Example 2. Looking for VM Registered on Hyper-V Server

```PowerShell
Get-VBRServer -Type "HvServer" -Name "Hv_DNS"
This command looks for the VM named Hv_DNS registered on a Hyper-V server.
```

---

### Parameters
#### **Name**
Specifies the array of host names. The cmdlet will return hosts with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Type**
Specifies the host type. The cmdlet will return hosts of this type:
* ESX
* VC
* Linux
* Local
* Windows
* ESXi
* HvServer
* HvCluster
* Scvmm
* BackupServer
* SanHost
* SmbServer
* SmbCluster
* VcdSystem
* Cloud
* AzureWinServer
* VmSnapshotStorageHost
* ConfigurationService
* ExternalInfrastructureProxy
* NdmpServer
* ExternalInfrastructureServer
* CifsShare
* NfsShare
* SanCifsServer
* SanNfsServer
* CifsServer
* NfsServer
* CifsServerShare
* NfsServerShare
* S3CompatibleServer
* S3CompatibleBucket
* AmazonS3Server
* AmazonS3Bucket
* AzureBlobServer
* AzureBlobContainer
* GoogleStorageServer
* GoogleStorageBucket
* Unknown
Valid Values:

* ESX
* VC
* Linux
* Local
* Windows
* ESXi
* HvServer
* HvCluster
* Scvmm
* BackupServer
* SanHost
* SmbServer
* SmbCluster
* VcdSystem
* Cloud
* AzureWinServer
* VmSnapshotStorageHost
* ConfigurationService
* ExternalInfrastructureProxy
* NdmpServer
* ExternalInfrastructureServer
* CifsShare
* NfsShare
* SanCifsServer
* SanNfsServer
* CifsServer
* NfsServer
* CifsServerShare
* NfsServerShare
* S3CompatibleServer
* S3CompatibleBucket
* AmazonS3Server
* AmazonS3Bucket
* AzureBlobServer
* AzureBlobContainer
* GoogleStorageServer
* GoogleStorageBucket
* Unknown

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[EType]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRServer [-Name <String[]>] [-Type {ESX | VC | Linux | Local | Windows | ESXi | HvServer | HvCluster | Scvmm | BackupServer | SanHost | SmbServer | SmbCluster | VcdSystem | Cloud | AzureWinServer | 
```
```PowerShell
VmSnapshotStorageHost | ConfigurationService | ExternalInfrastructureProxy | NdmpServer | ExternalInfrastructureServer | CifsShare | NfsShare | SanCifsServer | SanNfsServer | CifsServer | NfsServer | 
```
```PowerShell
CifsServerShare | NfsServerShare | S3CompatibleServer | S3CompatibleBucket | AmazonS3Server | AmazonS3Bucket | AzureBlobServer | AzureBlobContainer | GoogleStorageServer | GoogleStorageBucket | Unknown}] 
```
```PowerShell
[<CommonParameters>]
```
