New-VBRRepositoryMountServerOptions
-----------------------------------

### Synopsis
Defines settings of a mount server used for object storage repositories.

---

### Description

This cmdlet creates the VBRRepositoryMountServerOptions object. This object contains settings of a mount server that you can use for object storage repositories.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Example 1. Defining Settings for Default Mount Server

$mountoptions = New-VBRRepositoryMountServerOptions -EnableVPowerNFS -MountFolder "C:\ProgramData\Veeam\Backup\IRCache\"
This command defines settings for a backup server that Veeam Backup & Replication will use as the mount server. Save the result to a variable to use with other cmdlets.
> Example 2. Defining Settings for Specific Mount Server

$server = Get-VBRServer "WinSrv2047"
$mountoptions = New-VBRRepositoryMountServerOptions -MountServer $server -EnableVPowerNFS -MountFolder "C:\ProgramData\Veeam\Backup\IRCache\"
This example shows how to define settings for the WinSrv2047 mount server.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
2. Run the New-VBRRepositoryMountServerOptions cmdlet. Set the $server variable as the MountServer parameter value. Provide the EnableVPowerNFS parameter. Specify the MountFolder parameter value.
Save the result to the $mountoptions variable to use with other cmdlets.
> Example 3. Disabling Veeam PowerNFS Settings for Specific Mount Server

$server = Get-VBRServer "WinSrv2047"
$mountoptions = New-VBRRepositoryMountServerOptions -MountServer $server -EnableVPowerNFS:$false -MountFolder "C:\ProgramData\Veeam\Backup\IRCache\"
This example shows how to define settings for the WinSrv2047 mount server. The Veeam PowerNFS option will be disabled.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Save the result to the $server variable.
2. Run the New-VBRRepositoryMountServerOptions cmdlet. Set the $server variable as the MountServer parameter value. Provide the :$false value for the EnableVPowerNFS parameter. Specify the MountFolder parameter value.
Save the result to the $mountoptions variable to use with other cmdlets.

---

### Parameters
#### **EnableVPowerNFS**
Enables the Veeam vPower NFS Service on the mount server. If you enable this option, Veeam vPower NFS Service will be able to access the object storage repository.
Default: True.
Note: To disable this option, set the parameter value to $false. That is, parameter_name:$false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **MountFolder**
Specifies a folder to keep cache that is created during mount operations.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|false   |named   |False        |VPowerNFSFolder|

#### **MountPort**
Specifies the port that the Veeam vPower NFS Service will use to mount the vPower NFS datastore to the ESXi host.
Default: 1058

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountServer**
Specifies a server that you want to use as a mount server. The cmdlet will apply settings to this server.
Note: If you do not specify this parameter, the cmdlet will apply settings to the backup server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **VPowerNFSPort**
Specifies the port that the Veeam vPower NFS Service will use to connect to the target NFS share.
Default: 2049

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
New-VBRRepositoryMountServerOptions [-EnableVPowerNFS] [-MountFolder <String>] [-MountPort <Int32>] [-MountServer <CHost>] [-VPowerNFSPort <Int32>] [<CommonParameters>]
```
