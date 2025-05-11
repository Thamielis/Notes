Start-VBRLinuxFileRestore
-------------------------

### Synopsis
Starts a restore session of Linux-based or Unix-based guest OS files.

---

### Description

This cmdlet mounts disks from a backup or replica to the helper host or helper appliance. After that you can restore VM guest OS files from file systems supported by Linux-based and Unix-based OSes:
1. Run the Get-VBRLinuxGuestItem cmdlet to get details on the files and folders that are available for restore.
2. Run the Start-VBRLinuxGuestItemRestore cmdlet to restore the necessary files and folders.
Consider the following:
- If you plan to restore OS files using an existing Linux-based machine as a helper host, you must first add this machine to the backup infrastructure. Run the Add-VBRLinux cmdlet to add the necessary machine.
- After you restore the necessary files, you must stop the restore session. Run run the Stop-VBRLinuxFileRestore cmdlet to stop the session.
After you stop the session, Veeam Backup & Replication unmounts disks from the helper host or helper appliance. If you use the helper appliance, Veeam Backup & Replication unregisters the helper appliance from the ESXi or Microsoft Hyper-V host.
- This method supports recovery of files and folders only. Recovery of other file system objects such as pipes is not supported.

---

### Examples
> Example 1

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "ESXi01"
$resoursepool = Find-VBRViResourcePool -Server $server -Name "Servers"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -Server $server -ResourcePool $resoursepool
This example shows how to start a restore session of Linux or Unix-based guest OS files of the UbuntuSrv VM. The cmdlet will register a helper appliance on the ESXi01 host in the Servers resource pool.

Perform the following steps:
1. Get the restore point:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Find-VBRViResourcePool cmdlet. Set the $server variable as the Server parameter value. Specify the Name parameter value. Save the result to the $resoursepool variable.
4. Run the Start-VBRLinuxFileRestore cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Set the $server variable as the Server parameter value.
- Set the $resoursepool variable as the ResourcePool parameter value.
- Save the result to the $session variable.
> Example 2

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "HV05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -Server $server
This example shows how to start a restore session of Linux or Unix-based guest OS files of the UbuntuSrv VM. The cmdlet will register a helper appliance on the HV05 Hyper-V host.

Perform the following steps:
1. Get the restore point:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the Server parameter value. Save the result to the $session variable.
> Example 3

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
This example shows how to start a restore of Linux or Unix-based guest OS files of the UbuntuSrv VM. The cmdlet will use the LinSrv05 machine as a helper appliance.

Perform the following steps:
1. Get the restore point:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
3. Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.

---

### Parameters
#### **AlternateDNSServer**
Specifies the IPv4 address of the alternate DNS server in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Credentials**
Specifies the credentials to authenticate against an existing Linux-based machine that you want to use as a helper host.

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName)|

#### **EnableFTP**
Enables the FTP access to the restored file system.
If you provide this parameter, users will be able to access the helper appliance over FTP, browse the file system of the restored VM and download necessary files on their own.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FromNSS**
Defines that the cmdlet will start a restore session of a VM guest OS using the Novell Storage Services file system.
If you provide this parameter, the cmdlet will deploy a specific appliance that supports the Novell Storage Services file system.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Gateway**
Specifies the IPv4 address of the default gateway in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IP**
Specifies the IPv4 address that you want to assign to the helper appliance.
Note: The helper appliance must be placed in the same network where the backup server resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6**
Specifies the IPv6 address that you want to assign to the helper appliance.
Note: The helper appliance must be placed in the same network where the backup server resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6AlternateDNSServer**
Specifies the IPv6 address of the alternate DNS server in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6Gateway**
Specifies the IPv6 address of the default gateway in the network where the appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PreferredDNSServer**
Specifies the IPv6 address of the DNS server in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **IPv6PrefixLength**
For the IPv6 addressesr specified.
Specifies the length of the IPv6 prefix.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountServer**
Specifies an existing Linux-based machine.
The cmdlet will mount disks from a backup or replica to this machine and will use it as a helper host.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[CHost]`|true    |named   |True (ByPropertyName)|

#### **MountToOriginalHost**
Specifies whether to mount disks to the original server and use it as a helper host.
Default: False.
Note: You can set this parameter to $true only if the Server and MountServer parameters are not specified.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |True (ByPropertyName)|

#### **NetworkInfo**
Specifies the network settings for the helper appliance.
Note:
* The helper appliance must be placed in the same network where the backup server resides.
* If you do not provide this parameter, the cmdlet will apply the VM network settings for the helper appliance.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[IVBRServerNetworkInfo]`|false   |named   |False        |

#### **NetworkMask**
For the IP parameter specified.
Specifies the network mask that you want to assign to the helper appliance.
Note: The helper appliance must be placed in the same network where the backup server resides.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PreferredDNSServer**
Specifies the IPv4 address of the DNS server in the network where the helper appliance resides.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[IPAddress]`|false   |named   |False        |

#### **Reason**
Specifies the reason for performing files restore. The information you provide will be saved in the session history so that you can reference it later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

#### **ResourcePool**
To start a restore session using the VMware platform.
Specifies the resource pool to which the helper appliance must be placed.

|Type                   |Required|Position|PipelineInput        |
|-----------------------|--------|--------|---------------------|
|`[CViResourcePoolItem]`|false   |named   |True (ByPropertyName)|

#### **RestorePoint**
Specifies the restore point to start a restore session.
You will be able to use the session to perform operations with VM guest OS files.

|Type    |Required|Position|PipelineInput        |
|--------|--------|--------|---------------------|
|`[COib]`|true    |named   |True (ByPropertyName)|

#### **Server**
Specifies the ESXi or Microsoft Hyper-V host on which the helper appliance must be registered.
Note: If you specify a host for the Novell file system proxy appliance, make sure that it can run VMs with 64-bit guest OSes.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[CHost]`|true    |named   |True (ByPropertyName)|

#### **VLanId**
To start a restore session using the Hyper-V platform.
Specifies the VLAN ID where the helper appliance must reside.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.COib

System.String

Veeam.Backup.Core.Common.CHost

Veeam.Backup.Core.Infrastructure.CViResourcePoolItem

Veeam.Backup.Common.CCredentials

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRLinuxFileRestore [-AlternateDNSServer <IPAddress>] [-Credentials <CCredentials>] [-EnableFTP] [-FromNSS] [-Gateway <IPAddress>] [-IP <IPAddress>] [-IPv6 <IPAddress>] [-IPv6AlternateDNSServer 
```
```PowerShell
<IPAddress>] [-IPv6Gateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] [-NetworkInfo <IVBRServerNetworkInfo>] [-NetworkMask <String>] [-PreferredDNSServer <IPAddress>] 
```
```PowerShell
[-Reason <String>] [-ResourcePool <CViResourcePoolItem>] -RestorePoint <COib> -Server <CHost> [<CommonParameters>]
```
```PowerShell
Start-VBRLinuxFileRestore [-AlternateDNSServer <IPAddress>] [-Credentials <CCredentials>] [-EnableFTP] [-Gateway <IPAddress>] [-IP <IPAddress>] [-IPv6 <IPAddress>] [-IPv6AlternateDNSServer <IPAddress>] 
```
```PowerShell
[-IPv6Gateway <IPAddress>] [-IPv6PreferredDNSServer <IPAddress>] [-IPv6PrefixLength <Int32>] [-NetworkInfo <IVBRServerNetworkInfo>] [-NetworkMask <String>] [-PreferredDNSServer <IPAddress>] [-Reason <String>] 
```
```PowerShell
-RestorePoint <COib> -Server <CHost> [-VLanId <Int32>] [<CommonParameters>]
```
```PowerShell
Start-VBRLinuxFileRestore [-Credentials <CCredentials>] -MountServer <CHost> [-Reason <String>] -RestorePoint <COib> [<CommonParameters>]
```
```PowerShell
Start-VBRLinuxFileRestore [-Credentials <CCredentials>] -MountToOriginalHost [-Reason <String>] -RestorePoint <COib> [<CommonParameters>]
```
