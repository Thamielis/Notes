Set-VBRBackupRepository
-----------------------

### Synopsis
Modifies a backup repository.

---

### Description

This cmdlet modifies a backup repository.
To modify a scale-out backup repository, run the Set-VBRScaleOutBackupRepository cmdlet.
To modify an object storage backup repository, use cmdlets from the Object Storage Repositories section.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Defining Proxy Affinity Settings

$repository = Get-VBRBackupRepository -Name "Backup Volume 01"
$proxy01 = Get-VBRViProxy -Name 172.17.53.5
$proxy02 = Get-VBRViProxy -Name 172.17.53.33
Set-VBRBackupRepository -Repository $repository -AffinityMode Manual -AffinityProxy $proxy01, $proxy02
This example shows how to configure proxy affinity settings for the backup repository named Backup Volume 01.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy1 variable.
3. Run the Get-VBRViProxy cmdlet. Specify the Name parameter value. Save the result to the $proxy2 variable.
4. Run the Set-VBRBackupRepository cmdlet. Set the $repository variable as the Repository parameter value. Set the Manual option for the AffinityMode parameter. Set the $proxy1 and $proxy2 variables as the AffinityProxy parameter values.

---

### Parameters
#### **AffinityMode**
Specifies what proxy affinity rules are set up for the backup repository:
* Auto - use this option if you want all backup proxies in the backup infrastructure to work with the backup repository
* Manual - use this option if you want backup proxies from the AffinityProxy list to work with the backup repository
To configure proxy affinity settings, you must install Veeam Backup & Replication Enterprise or higher license on the backup server.
Default: Auto.
Valid Values:

* Auto
* Manual

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRProxyAffinityMode]`|false   |named   |False        |

#### **AffinityProxy**
Specifies the list of backup proxies that can work with the backup repository. Entries in the proxy affinity list are separated with a comma.
To configure proxy affinity settings, you must install Veeam Backup & Replication Enterprise or higher license on the backup server.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CViProxy[]]`|false   |named   |False        |

#### **AlignDataBlocks**
Defines that the backup blocks size will be aligned by a 4Kb block boundary. Data alignment provides better deduplication on storage systems with fixed block size.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AutoSelectGateway**
Enables automatic selection of gateway servers.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Credentials**
Specifies credentials you want to use for authenticating with the backup repository host.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DataRateLimit**
Used for setting combined data ingestion rate for the LimitDatarate parameter.
Specifies the combined data ingestion rate for the repository.
Permitted value: 1 to 1024 (MByte/s).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **DDBoostEncryptionType**
Specifies the native Dell Data Domain encryption level: High, Medium, None.
Valid Values:

* None
* Medium
* High

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRDDBoostEncryptionType]`|false   |named   |False        |

#### **DDServerName**
Specifies the Data Domain server name according to the connection mode:
* If Dell Data Domain works over TCP, enter a full DNS name or IP address of the Dell Data Domain server.
* If Dell Data Domain works over Fibre Channel, enter a name of the Data Domain server starting with a 'DFC-' prefix, for example, "DFC-DataDomain690".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DecompressDataBlocks**
Defines that the backup data blocks must be decompressed before storing to the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Description**
Specifies a description of the backup repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupImmutability**
Enables the immutability option for a backup repository.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableVPowerNFS**
Enables the repository to be accessible by the vPower NFS service.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableXFSFastClone**
Enables the Fast Clone technology for the backup repository.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will a backup repository without showing warnings in the PowerShell console.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ImmutabilityPeriod**
For the immutability option.
Defines a number of days within which Veeam Backup & Replication will not delete blocks of data from the backup repository.
Default: 30 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **LimitConcurrentJobs**
Defines that the number of concurrent jobs using this repository must be limited. Use the MaxConcurrentJobs parameter to set the maximum value.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LimitDatarate**
Defines that the total speed of writing data to the backup repository disk must be restricted. Use the DataRateLimit parameter to set the maximum value.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MaxConcurrentJobs**
Used for setting maximum value for the LimitConcurrentJobs parameter.
Specifies the maximum allowed number of concurrent tasks for the backup repository.
Permitted values: 1 to 99.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountFolder**
Specifies the path to the mount folder. Veeam Backup & Replication will use this folder to mount VM disks  and to keep write cache data.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |named   |False        |VPowerNFSFolder|

#### **MountPort**
Specifies the port number of the mount server.
Default: 1058.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountServer**
Specifies the mount server associated with the backup repository. You can assign the mount server role to the backup repository itself or to a server that resides close to the backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the backup repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NFSRepositoryEncoding**
Specifies encoding for NFS share. You can specify either of the following values:
* utf
* ansi
Valid Values:

* utf
* ansi

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRNASEncoding]`|false   |named   |False        |

#### **Repository**
Specifies the backup repository you want to modify.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RequireAccessCreds**
Defines that the administrator credentials are needed to access the shared folder. Use the Credentials parameter to specify the credentials.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RotatedDrive**
Defines that the repository you want to add is a rotated drive (removable media).
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RotatedDriveCleanupMode**
Defines how Veeam Backup & Replication behaves when a drive is swapped:
ContinueBackupChain: use this option to continue the backup chain.
ClearBackupFolder: use this option to delete all backups created by a job.
ClearRepositoryFolder: use this option to delete all backups stored in the repository folder (for example, C:\Backups). Note that Veeam Backup & Replication will delete all backups, even backups created by other jobs.
Default: ContinueBackupChain.
Valid Values:

* ContinueBackupChain
* ClearBackupFolder
* ClearRepositoryFolder

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRRotatedDriveCleanupMode]`|false   |named   |False        |

#### **Server**
Specifies an array of hosts where the backup repositories are located. The cmdlet will set this host as a backup repository.
Default: This server.
Note: You can not set a new backup repository for the following types of hosts that have been added as backup repositories:
* WinLocal
* LinuxLocal

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **UsePerVMFile**
Defines that the backup repository must create per-VM backup files.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **VPowerNFSPort**
Specifies the port number of the vPower NFS Service. Veeam Backup & Replication will set up a direct connection between the backup repository and ESXi to which the vPower NFS datastore is mounted.
Default: 2049.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRBackupRepository [-AffinityMode {Auto | Manual}] [-AffinityProxy <CViProxy[]>] [-AlignDataBlocks] [-AutoSelectGateway] [-Credentials <CCredentials>] [-DataRateLimit <Int32>] [-DDBoostEncryptionType {None 
```
```PowerShell
| Medium | High}] [-DDServerName <String>] [-DecompressDataBlocks] [-Description <String>] [-EnableBackupImmutability] [-EnableVPowerNFS] [-EnableXFSFastClone] [-Force] [-ImmutabilityPeriod <Int32>] 
```
```PowerShell
[-LimitConcurrentJobs] [-LimitDatarate] [-MaxConcurrentJobs <Int32>] [-MountFolder <String>] [-MountPort <Int32>] [-MountServer <CHost>] [-Name <String>] [-NFSRepositoryEncoding {utf | ansi}] -Repository 
```
```PowerShell
<CBackupRepository> [-RequireAccessCreds] [-RotatedDrive] [-RotatedDriveCleanupMode {ContinueBackupChain | ClearBackupFolder | ClearRepositoryFolder}] [-Server <CHost[]>] [-UsePerVMFile] [-VPowerNFSPort 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
