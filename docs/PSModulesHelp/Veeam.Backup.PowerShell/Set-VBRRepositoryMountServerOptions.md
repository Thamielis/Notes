Set-VBRRepositoryMountServerOptions
-----------------------------------

### Synopsis
Modifies settings of a mount server used for object storage repositories.

---

### Description

This cmdlet modifies settings of a mount server used for object storage repositories.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [New-VBRRepositoryMountServerOptions](New-VBRRepositoryMountServerOptions)

---

### Examples
> Modifying Cache Folder Settings for Mount Server

$server = Get-VBRServer "WinSrv2047"
$mountoptions = New-VBRRepositoryMountServerOptions -MountServer $server -EnableVPowerNFS -MountFolder "C:\ProgramData\Veeam\Backup\IRCache\"
Set-VBRRepositoryMountServerOptions -Options $mountoptions -MountFolder "C:\Backup\Veeam\IRCache\"
This example shows how to specify a new cache folder for the WinSrv2047 mount server. The mount server will keep cache in the C:\Backup\Veeam\IRCache\ folder instead of the default C:\ProgramData\Veeam\Backup\IRCache\ folder.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
2. Run the New-VBRRepositoryMountServerOptions cmdlet. Specify the MountServer, EnableVPowerNFS and MountFolder parameters. Save the result to the $mountoptions variable.
3. Run the Set-VBRRepositoryMountServerOptions cmdlet. Set the $mountoptions variable as the Options parameter value. Specify the MountFolder parameter value.

---

### Parameters
#### **EnableVPowerNFS**
Enables the Veeam vPower NFS Service on the mount server. If you enable this option, Veeam vPower NFS Service will be be able to access the object storage repository.
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
Default: 1058.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **MountServer**
Specifies a server that you want to use as a mount server. The cmdlet will apply settings to this server.
Note: If you do not specify this parameter, the cmdlet will apply settings to the backup server.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Options**
Specifies settings of a mount server that you want to modify.

|Type                               |Required|Position|PipelineInput|
|-----------------------------------|--------|--------|-------------|
|`[VBRRepositoryMountServerOptions]`|true    |named   |False        |

#### **VPowerNFSPort**
Specifies the port that the Veeam vPower NFS Service will use to connect to the target NFS share.
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
Set-VBRRepositoryMountServerOptions [-EnableVPowerNFS] [-MountFolder <String>] [-MountPort <Int32>] [-MountServer <CHost>] -Options <VBRRepositoryMountServerOptions> [-VPowerNFSPort <Int32>] [<CommonParameters>]
```
