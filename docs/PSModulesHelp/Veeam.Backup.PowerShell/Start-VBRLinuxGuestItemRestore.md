Start-VBRLinuxGuestItemRestore
------------------------------

### Synopsis
Restores Linux-based or Unix-based guest OS files.

---

### Description

This cmdlet restores Linux-based or Unix-based guest OS files to the original or new location.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Start-VBRLinuxFileRestore](Start-VBRLinuxFileRestore)

* [Find-VBRViEntity](Find-VBRViEntity)

* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

* [Find-VBRHvEntity](Find-VBRHvEntity)

---

### Examples
> Example 1. Restoring LinuxBased or UnixBased Guest OS Files to Original Location

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
$root = Get-VBRLinuxGuestItem -LinuxFlrObject $session
$child = Get-VBRLinuxGuestItem -LinuxFlrObject $session -ParentItem $root
$creds = Get-VBRCredentials
Start-VBRLinuxGuestItemRestore -LinuxFlrObject $session -Item $child[3] -GuestCredentials $creds -Overwrite
This example shows how to restore Linux-based or Unix-based guest OS files of the UbuntuSrv VM to the original host with the following settings:
- The cmdlet will overwrite existing files and folders.
- The cmdlet will use the LinSrv05 machine as a helper appliance.

Perform the following steps:
1. Mount the disk and get the OS files:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Save the result to the $root variable.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Set the $root variable as the ParentItem parameter value. Save the result to the $child variable.
The Get-VBRLinuxGuestItem cmdlet will return an array of files and folders. Consider that the array numbering starts with 0. In our example, the fourth item in the array is used.
- Run the Get-VBRCredentials cmdlet. Save the result to the $creds variable.
2. Run the Start-VBRLinuxGuestItemRestore cmdlet. Specify the following settings:
- Set the $session variable as the LinuxFlrObject parameter value.
- Set the $child variable as the Item parameter value.
- Set the $creds variable as the GuestCredentials parameter value.
- Provide the Overwrite parameter.
> Example 2. Restoring LinuxBased or UnixBased Guest OS Files to VMware Platform

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
$root = Get-VBRLinuxGuestItem -LinuxFlrObject $session
$child = Get-VBRLinuxGuestItem -LinuxFlrObject $session -ParentItem $root
$targetvm = Find-VBRViEntity -Name UbuntuSrv07
Start-VBRLinuxGuestItemRestore -LinuxFlrObject $session -Item $child[5] -TargetViVm $targetvm -Overwrite
This example shows how to restore Linux-based or Unix-based guest OS files of the UbuntuSrv VM to the UbuntuSrv07 that is located on the VMware platform with the following settings:

- The cmdlet will add the restored files and folders with the _restored postfix to the UbuntuSrv VM.
- The cmdlet will use the LinSrv05 machine as a helper appliance.

Perform the following steps:
1. Mount the disk and get the OS files:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Save the result to the $root variable.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Set the $root variable as the ParentItem parameter value. Save the result to the $child variable.
The Get-VBRLinuxGuestItem cmdlet will return an array of files and folders. Consider that the array numbering starts with 0. In our example, the fourth item is used.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $targetvm variable.
3. Run the Start-VBRLinuxGuestItemRestore cmdlet. Specify the following settings:
- Set the $session variable as the LinuxFlrObject parameter value.
- Set the $child variable as the Item parameter value.
- Set the $targetvm variable as the TargetViVm parameter value.
- Provide the Overwrite parameter.

> Example 3. Restoring LinuxBased or UnixBased Guest OS Files to vCloud Director Platform

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$mountserver = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $mountserver
$root = Get-VBRLinuxGuestItem -LinuxFlrObject $session
$child = Get-VBRLinuxGuestItem -LinuxFlrObject $session -ParentItem $root
$targetvm = Find-VBRvCloudEntity -Name "UbuntuSrv04"
Start-VBRLinuxGuestItemRestore -LinuxFlrObject $session -Item $child[3] -TargetVcdVm $targetvm -Overwrite:$false
This example shows how to restore Linux-based or Unix-based guest OS files of the UbuntuSrv VM to the UbuntuSrv04 that is located on the vCloud Director platform. The cmdlet will add the restored files and folders with the _restored postfix to the UbuntuSrv04 VM.

Perform the following steps:
1. Start the restore session and get the OS files:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $mountserver variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Save the result to the $root variable.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Set the $root variable as the ParentItem parameter value. Save the result to the $child variable.
The Get-VBRLinuxGuestItem cmdlet will return an array of files and folders. Consider that the array numbering starts with 0. In our example, the fourth item is used.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $targetvm variable.
3. Run the Start-VBRLinuxGuestItemRestore cmdlet. Specify the following settings:
- Set the $session variable as the LinuxFlrObject parameter value.
- Set the $items variable as the Item parameter value.
- Set the $targetvm variable as the TargetVcdVm parameter value.
- Set the Overwrite parameter value to $false.
> Example 4. Restoring LinuxBased or UnixBased Guest OS Files to HyperV Platform

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
$root = Get-VBRLinuxGuestItem -LinuxFlrObject $session
$child = Get-VBRLinuxGuestItem -LinuxFlrObject $session -ParentItem $root
$targetvm = Find-VBRHvEntity -HostsAndVMs -Name "UbuntuSrv07"
Start-VBRLinuxGuestItemRestore -LinuxFlrObject $session -Item $child[3] -TargetHvVm $targetvm -Overwrite:$false
This example shows how to restore Linux-based or Unix-based guest OS files of the UbuntuSrv VM to the UbuntuSrv07 that is located on the Hyper-V platform. The cmdlet will add the restored files and folders with the _restored postfix to the UbuntuSrv VM.

Perform the following steps:

1. Start the restore session and get the OS files:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Save the result to the $root variable.
The Get-VBRLinuxGuestItem cmdlet will return an array of files and folders. Consider that the array numbering starts with 0. In our example, the fourth item is used.
- Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Set the $root variable as the ParentItem parameter value. Save the result to the $child variable.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $targetvm variable.
3. Run the Start-VBRLinuxGuestItemRestore cmdlet. Specify the following settings:
- Set the $session variable as the LinuxFlrObject parameter value.
- Set the $items variable as the Item parameter value.
- Set the $targetvm variable as the TargetHvVm parameter value.
- Set :$false as the Overwrite parameter value.

---

### Parameters
#### **GuestCredentials**
Specifies the credentials to authenticate against the target machine.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Item**
Specifies the array of files and folders that are available on disks of Linux-based or Unix-based machines.
The cmdlet will restore these files and folders.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRFLRFsItem[]]`|true    |named   |False        |

#### **LinuxFlrObject**
Specifies a restore session of Linux-based or Unix-based guest OS files.
The cmdlet will use this session to restore guest OS files.
Note: The restore session must be started within the current PowerShell session.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRLinuxFlrObject]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Overwrite**
Defines that the cmdlet will overwrite existing files and folders with files and folders from a backup.
If you set this parameter to the $false value, the cmdlet will not replace exiting files and folders. It will add the restored files and folders with the _restored postfix to the target machine.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TargetAgentMachine**
For performing restore to a Veeam Agent computer.
Specifies the target computer to which the cmdlet will restore guest OS files.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRDiscoveredComputer]`|false   |named   |False        |

#### **TargetDirectory**
Specifies the path to a folder on the target VM to which you want to restore files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetHvVm**
For performing restore to the VMware platform.
Specifies the target machine to which the cmdlet will restore guest OS files.
Note: This parameter will work only if source machine is restored or deleted.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CHvVmItem]`|false   |named   |False        |

#### **TargetVcdVm**
For performing restore to the vCloud Director platform.
Specifies the target machine to which the cmdlet will restore guest OS files.
Note: This parameter will work only if source machine is restored or deleted.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CVcdVmItem]`|false   |named   |False        |

#### **TargetViVm**
For performing restore to the VMware platform.
Specifies the target machine to which the cmdlet will restore guest OS files.
Note: This parameter will work only if source machine is restored or deleted.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRLinuxFlrObject

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRLinuxGuestItemRestore [-GuestCredentials <CCredentials>] -Item <VBRFLRFsItem[]> -LinuxFlrObject <VBRLinuxFlrObject> -Overwrite [-RunAsync] [-TargetAgentMachine <VBRDiscoveredComputer>] 
```
```PowerShell
[-TargetDirectory <String>] [-TargetHvVm <CHvVmItem>] [-TargetVcdVm <CVcdVmItem>] [-TargetViVm <CViVmItem>] [<CommonParameters>]
```
