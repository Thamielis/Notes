Copy-VBRLinuxGuestItem
----------------------

### Synopsis
Copies Linux-based or Unix-based guest OS files to the target host.

---

### Description

This cmdlet copies Linux-based or Unix-based guest OS files to the target host.
You can use the following types of servers and hosts as the target hosts:
- Microsoft Windows Server
- Linux Server
- VMware vSphere Server
- VMware Cloud Director Server

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Get-VBRLinuxGuestItem](Get-VBRLinuxGuestItem)

---

### Examples
> Copying LinuxBased or UnixBased Guest OS Files to Target Host

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
$items = Get-VBRLinuxGuestItem -LinuxFlrObject $session
$targetserver = Get-VBRServer -Name "LinSrv07"
Copy-VBRLinuxGuestItem -Item $items -LinuxFlrObject $session -TargetFolder "/home/pictures" -Server $targetserver
This example shows how to copy files from the UbuntuSrv to the LinSrv07 target machine.

Perform the following steps: 1. Start the restore session:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
2. Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Save the result to the $items variable.
3. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $targetserver variable.
4. Run the Copy-VBRLinuxGuestItem cmdlet. Specify the following settings:
- Set the $items variable as the Item parameter value.
- Set the $session variable as the LinuxFlrObject parameter value.
- Specify the TargetFolder parameter value.
- Set the $targetserver variable as the Server parameter value.

---

### Parameters
#### **Datastore**
Specifies the datastore where the target machine will be located.
The cmdlet will copy the guest OS files to the machine located in this datastore.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRViDatastoreBase]`|false   |named   |False        |

#### **Item**
Specifies an array of files and folders that are available on disks of Linux-based or Unix-based machines.
The cmdlet will copy these files and folders.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRFLRFsItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **KeepPermissionsAndOwnership**
Defines that the cmdlet will keep custom permissions and the ownership of the copied guest OS files.
If you do not provide this parameter, the cmdlet will restore guest OS files with default permissions and ownership.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LinuxFlrObject**
Specifies a restore session of Linux-based or Unix-based guest OS files.
The cmdlet will use this session to copy guest OS files.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRLinuxFlrObject]`|true    |named   |False        |

#### **Server**
Specifies a target machine to which you want to copy guest OS files.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **ShareCredentials**
For copying guest OS files to a shared folder.
Specifies credentials that you want to use to authenticate with the target shared folder to which you copy guest OS files.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **TargetFolder**
Specifies a folder in the target machine. The cmdlet will copy the guest OS files to this folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFLRFsItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Copy-VBRLinuxGuestItem [-Datastore <VBRViDatastoreBase>] -Item <VBRFLRFsItem[]> [-KeepPermissionsAndOwnership] -LinuxFlrObject <VBRLinuxFlrObject> -Server <CHost> [-ShareCredentials <PSCredential>] 
```
```PowerShell
-TargetFolder <String> [<CommonParameters>]
```
