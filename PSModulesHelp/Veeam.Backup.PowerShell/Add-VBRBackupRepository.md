Add-VBRBackupRepository
-----------------------

### Synopsis
Adds a backup repository to the backup infrastructure.

---

### Description

This cmdlet adds a new backup repository to the backup infrastructure.
To add a scale-out backup repository, run the Add-VBRScaleOutBackupRepository cmdlet.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCredentials](Get-VBRCredentials)

* [Add-VBRLinux](Add-VBRLinux)

---

### Examples
> Example 1. Adding Windows Server as Backup Repository

$server = Get-VBRServer -Name "Win2012"
Add-VBRBackupRepository -Name "Win2012Repo" -Server $server -Folder "c:\Backup Repository" -Type WinLocal
This example shows how to add the Win2012 Windows server as a new backup repository named "Win2012Repo". The cmdlet will add the backup repository with the following settings:
- The server to add is obtained with Get-VBRServer and assigned to the $server variable beforehand.
- The folder that is used as the backup repository is located on "C:\Backup Repository".
- The server type is set to "WinLocal".

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the $server variable as the Server parameter value.
- Specify the Folder parameter value.
- Specify the Type parameter value.
> Example 2. Adding Linux Server as Backup Repository

$linsrv = Add-VBRLinux -Name "172.18.4.67" -SSHUser Admin -SSHPassword P@$$w0rd  
Add-VBRBackupRepository -Name "Linux Repository" -Server $linsrv -Type LinuxLocal -Folder "/home/Admin/backups/"
The example shows how to add a Linux server as a backup repository. Veeam Backup & Replication will store backup files in the folder located in the following path: /home/Admin/backups.
Perform the following steps:
1. Run the Add-VBRLinux cmdlet. Specify the necessary parameters. Save the result to the $linsrv variable.
2. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the Type parameter to the LinuxLocal value.
- Set the $srv variable as the Server parameter value.
- Specify the Folder parameter value.
> Example 3. Adding SMB (CIFS) Shared Folder as Backup Repository

$server = Get-VBRServer -Name "TestServer05"
$mountserver = Get-VBRServer -Name "TestServer05"
$administrator = Get-VBRCredentials -Name "Administrator"
Add-VBRBackupRepository -Type CifsShare -Name "Nimble Script Share" -Server $server -Folder "\\nimble\Backups" -MountServer $mountserver -ImportBackup:$true -LimitConcurrentJobs -MaxConcurrentJobs 6 -Credentials $administrator
This example shows how to add an SMB (CIFS) shared folder on a Windows server as the Backups Vol 01 backup repository. The cmdlet will add the backup repository with the following settings:
- Veeam Backup & Replication uses credentials to authenticate against the shared folder.
- The server type is set to CifsShare.
- The \nimble\Backups folder is used as the backup repository.
- The same server is used as a mount server.
- The ImportBackup parameter is set to import the existing backup files.
- The maximum allowed number of concurrent tasks is set to 6.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $mountserver variable.
3. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $administrator variable.
4. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Specify the Type parameter value.
- Specify the Name parameter value.
- Set the $server variable as the Server parameter value.
- Specify the Folder parameter value.
- Set the $mountserver variable as the MountServer parameter value.
- Set the ImportBackup parameter to $true.
- Provide the LimitConcurrentJobs parameter.
- Specify the MaxConcurrentJobs parameter value.
- Set the $administrator as the Credentials parameter value.
> Example 4. Adding Dedupe Storage Aplliance as Backup Repository

$server = Get-VBRServer -Name "WinSrv05"
Add-VBRBackupRepository -Folder ddboost://10.0.0.80:storage/ -Type DataDomain -DDServerName 10.0.0.80 -Server $server -UserName sysadmin -Password Pa55word
This example shows how to add a Dell Data Domain storage appliance as a backup repository. The cmdlet will add the backup repository with the following settings:
- Dell Data Domain connects to the WinSrv05 explicitly set gateway server.
- The DFC prefix is not set to allow Veeam Backup & Replication to communicate with Dell Data Domain storage over the TCP/IP protocol.
- Veeam Backup & Replication will store backup files in the folder located in the following path: ddboost://10.0.0.80:storage/
- The Username/Password is used to get access to the appliance.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Specify the Folder parameter value.
- Specify the Type parameter value.
- Specify the DDServerName parameter value.
- Set the $server variable as the Server parameter value.
- Specify the UserName parameter value.
- Specify the Password parameter value.
> Example 5. Adding Backup Repository on Rotated Drive

$server = Get-VBRServer -Name "WinSrv05"  
Add-VBRBackupRepository -Name RDX -Type WinLocal -RotatedDrive -Description "Rotated drive" -Server $server -Folder F:\Repo
This example shows how to add backup repository on a rotated drive connected to a Windows server. The cmdlet will add the backup repository with the following settings:
- The server type is set to WinLocal.
- Veeam Backup & Replication will store backup files in the folder located in the following path: F:\Repo.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Type parameter value.
- Provide the RotatedDrive parameter.
- Specify the Description parameter value.
- Set the $server variable as the Server parameter value.
- Specify the Folder parameter value.
> Example 6. Adding Quantum DXi Storage Appliance as Backup Repository

$server = Get-VBRServer -Name "WinSrv05"  
Add-VBRBackupRepository -Name "Quantum DXi" -Type Quantum -Folder "/shares/Quantum-Share-01" -Server $server
This example shows how to add a Quantum DXi storage appliance as a backup repository. Veeam Backup & Replication will store backup files in the folder located in the following path: /shares/Quantum-Share-01.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Type parameter value.
- Specify the Folder parameter value.
- Set the $server variable as the Server parameter value.
> Example 7. Adding ExaGrid Share as Backup Repository

$linsrv = Add-VBRLinux -Name "172.18.4.67" -SSHUser Admin -SSHPassword P@$$w0rd  
Add-VBRBackupRepository -Name ExaGrid -Server $srv -Type ExaGrid -Folder "/home/Admin/Share01-07/MyRepo/"
The example shows how to add ExaGrid as a backup repository. Veeam Backup & Replication will store backup files in the folder located in the following path: /home/Admin/Share01-07/MyRepo. The pattern of this folder path consists of the following elements:
1. /home: A home directory
2. /Admin: Must be the same as the user name that you use to authenticate against the Linux server when you add it to Veeam Backup & Replication. In our example it is specified by the SSHUser parameter of the Add-VBRLinux cmdlet.
3. /Share01-07: The folder that you must create on the Exagrid appliances beforehand.
4. [Optional] /MyRepo/: Subfolder that you may want to create in the Share01-07 folder.
Perform the following steps:
1. Run the Add-VBRLinux cmdlet. Specify the necessary parameters. Save the result to the $linsrv variable.
2. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the Type parameter to the ExaGrid value.
- Set the $srv variable as the Server parameter value.
- Specify the Folder parameter value.
> Example 8. Adding HPE StoreOnce as Backup Repository

$creds = Get-VBRCredentials -Name "HPEStorOnce"  
Add-VBRBackupRepository -Type HPStoreOnceIntegration -Name "Atlanta Repository" -StoreOnceServerName "HPEStoreO01-dl.local" -Folder "storeonce://HPEStoreO01-dl.local:Store-015@/" -Credentials $creds
This example shows how to add HPE StoreOnce as a backup repository. Veeam Backup & Replication will store backup files in the folder located in the following path: storeonce://HPEStoreO01-dl.local:Store-015/. The pattern of this folder path consists of the following elements:
1. //HPEStoreO01-dl.local: The name of HPE StoreOnce.
2. :Store-015@/: The name of the HPE StoreOnce Catalyst Store.
Note: It is not recommended to specify any subfolders in this folder, since currently Veeam Backup & Replication is able to display only the name of HPE StoreOnce Catalyst Store. If you indeed want to specify a subfolder, review this KB article but keep in mind that you will not be able to manage the backup repository with the user interface of Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
2. Run the Add-VBRBackupRepository cmdlet. Specify the following settings:
- Set the Type parameter to the HPStoreOnceIntegration value.
- Specify the Name parameter value.
- Specify the StoreOnceServerName parameter value.
- Specify the Folder parameter value.
- Set the $creds variable as the Credentials parameter value.

---

### Parameters
#### **AlignDataBlocks**
Defines that the backup blocks size will be aligned by a 4Kb block boundary. Data alignment provides better deduplication on storage systems with fixed block size.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AutoSelectGateway**
Enables automatic selection of gateway servers. Default: False.

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
Specifies the Data Domain server name. Enter the name in the following formats depending on the connection mode:
* If Dell Data Domain works over TCP/IP, enter a full DNS name or an IP address of the Dell Data Domain server.
* If Dell Data Domain works over Fibre Channel, enter a name of the Data Domain server starting with the 'DFC-' prefix, for example, DFC-DataDomain690.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DecompressDataBlocks**
Defines that the backup data blocks must be decompressed before storing to the repository.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Description**
Specifies the description of the backup repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupImmutability**
Enables the immutability option for a backup repository.
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

#### **Folder**
Specifies the full path to the folder where you want to store the backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will add a backup repository without showing warnings in the PowerShell console.
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

#### **ImportBackup**
Defines that the cmdlet will import backups that are currently located on the server you are adding as repository.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ImportIndex**
Defines that the cmdlet will import the guest OS file system index.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LimitConcurrentJobs**
Defines that the number of concurrent jobs using this repository must be limited.
Use the MaxConcurrentJobs parameter to set the maximum value.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LimitDatarate**
Defines that the total speed of writing data to the backup repository disk must be restricted.
Use the DataRateLimit parameter to set the maximum value.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MaxConcurrentJobs**
Used for setting maximum value for the LimitConcurrentJobs parameter.
Specifies the maximum allowed number of concurrent tasks for the backup repository.
Permitted values: 1 to 128.
Permitted values for Dell Data Domain: 1 to 270.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountFolder**
Specifies the path to the mount folder. Veeam Backup & Replication will use this folder to mount VM disks and to keep write cache data.

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
Specifies the name you want to assign to the new backup repository.

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

#### **Password**
Specifies the password you want to use for authenticating with the backup repository host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RotatedDrive**
Defines that the repository you want to add is a rotated drive (removable media).
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RotatedDriveCleanupMode**
Defines how Veeam Backup & Replication behaves when a drive is swapped:
* ContinueBackupChain: use this option to continue the backup chain.
* ClearBackupFolder: use this option to delete all backups created by a job.
* ClearRepositoryFolder: use this option to delete all backups stored in the repository folder (for example, C:\Backups). Note that Veeam Backup & Replication will delete all backups, even backups created by other jobs.
Default: ContinueBackupChain.
Valid Values:

* ContinueBackupChain
* ClearBackupFolder
* ClearRepositoryFolder

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[VBRRotatedDriveCleanupMode]`|false   |named   |False        |

#### **Server**
Specifies the host where the backup repository you want to add is located and host that will be used as gateway servers.
Use this parameter to explicitly set the host for the following repository types:
* WinLocal: to specify a Windows based server where you want to create the backup repository or to which you want to connect the rotated drives.
* LinuxLocal type: to specify a Linux based server where you want to create the backup repository or to which you want to connect the rotated drives.
Note: when you specify an array of hosts, the first host is used as a backup repository, the others are used as gateway servers. - CifsShare, DataDomain or HPStoreOnce: to specify a Windows based server to which the storage appliance is connected and which will be used as a gateway server.
Default: This server.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CHost[]]`|false   |named   |False        |

#### **StoreOnceServerName**
Specifies the HPE StoreOnce server name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **StoreOnceWanLink**
Defines that the HPE StoreOnce must use source-side deduplication.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Type**
Specifies the type you want to assign to the repository:
* WinLocal
* LinuxLocal
* CifsShare
* ExaGrid
* DataDomain
* HPStoreOnceIntegration
* Quantum
* Nfs
* Infinidat
* Fujitsu
* HPStoreOnceCloudBank
* Hardened
Valid Values:

* WinLocal
* LinuxLocal
* CifsShare
* ExaGrid
* DataDomain
* HPStoreOnceIntegration
* Quantum
* Nfs
* Infinidat
* Fujitsu
* HPStoreOnceCloudBank
* Hardened

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRRepositoryType]`|true    |named   |False        |

#### **UsePerVMFile**
Defines that the backup repository must create per-VM backup files.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UserName**
Specifies the user name you want to use for authenticating with the backup repository host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VPowerNFSPort**
Specifies the port number of the vPower NFS Service. Veeam Backup & Replication will set up a direct connection between the backup repository and ESXi to which the vPower NFS datastore is mounted.
Default: 2049.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
Add-VBRBackupRepository [-AlignDataBlocks] [-AutoSelectGateway] [-Credentials <CCredentials>] [-DataRateLimit <Int32>] [-DDBoostEncryptionType {None | Medium | High}] [-DDServerName <String>] 
```
```PowerShell
[-DecompressDataBlocks] [-Description <String>] [-EnableBackupImmutability] [-EnableXFSFastClone] -Folder <String> [-Force] [-ImmutabilityPeriod <Int32>] [-ImportBackup] [-ImportIndex] [-LimitConcurrentJobs] 
```
```PowerShell
[-LimitDatarate] [-MaxConcurrentJobs <Int32>] [-MountFolder <String>] [-MountPort <Int32>] [-MountServer <CHost>] [-Name <String>] [-NFSRepositoryEncoding {utf | ansi}] [-RotatedDrive] [-RotatedDriveCleanupMode 
```
```PowerShell
{ContinueBackupChain | ClearBackupFolder | ClearRepositoryFolder}] [-Server <CHost[]>] [-StoreOnceServerName <String>] [-StoreOnceWanLink] -Type {WinLocal | LinuxLocal | CifsShare | ExaGrid | DataDomain | 
```
```PowerShell
HPStoreOnceIntegration | Quantum | Nfs | Infinidat | Fujitsu | HPStoreOnceCloudBank | Hardened} [-UsePerVMFile] [-VPowerNFSPort <Int32>] [<CommonParameters>]
```
```PowerShell
Add-VBRBackupRepository [-AlignDataBlocks] [-AutoSelectGateway] [-DataRateLimit <Int32>] [-DDBoostEncryptionType {None | Medium | High}] [-DDServerName <String>] [-DecompressDataBlocks] [-Description <String>] 
```
```PowerShell
[-EnableBackupImmutability] [-EnableXFSFastClone] -Folder <String> [-Force] [-ImmutabilityPeriod <Int32>] [-ImportBackup] [-ImportIndex] [-LimitConcurrentJobs] [-LimitDatarate] [-MaxConcurrentJobs <Int32>] 
```
```PowerShell
[-MountFolder <String>] [-MountPort <Int32>] [-MountServer <CHost>] [-Name <String>] [-NFSRepositoryEncoding {utf | ansi}] [-Password <String>] [-RotatedDrive] [-RotatedDriveCleanupMode {ContinueBackupChain | 
```
```PowerShell
ClearBackupFolder | ClearRepositoryFolder}] [-Server <CHost[]>] [-StoreOnceServerName <String>] [-StoreOnceWanLink] -Type {WinLocal | LinuxLocal | CifsShare | ExaGrid | DataDomain | HPStoreOnceIntegration | 
```
```PowerShell
Quantum | Nfs | Infinidat | Fujitsu | HPStoreOnceCloudBank | Hardened} [-UsePerVMFile] [-UserName <String>] [-VPowerNFSPort <Int32>] [<CommonParameters>]
```
