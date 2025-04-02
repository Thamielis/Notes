Get-VBRLinuxGuestItem
---------------------

### Synopsis
Returns Linux-based or Unix-based guest OS files.

---

### Description

This cmdlet returns Linux-based or Unix-based OS files.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRServer](Get-VBRServer)

* [Start-VBRLinuxFileRestore](Start-VBRLinuxFileRestore)

---

### Examples
> Example 1. Getting all Root Items Added to LinuxBased Machine

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
Get-VBRLinuxGuestItem -LinuxFlrObject $session
This example shows how to get all root items from disks that are added to the UbuntuSrv Linux-based machine.

Perform the following steps:

Start the restore session:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
2. Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value.
> Example 2.  Getting LinuxBased Guest OS Files Using Path to Folder

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
Get-VBRLinuxGuestItem -LinuxFlrObject $session -Path "/home/administrator/mydir"
This example shows how to get Linux-based guest OS files added to the UbuntuSrv Linux-based machine. The cmdlet will get all child items added to the /home/administrator/mydir folder.

Perform the following steps:

Start the restore session:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
2. Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Specify the Path parameter value.
> Example 3. Getting Child Items Added to UnixBased Machine

$backup = Get-VBRBackup -Name "Srv2067"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "Mount2067"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
$root = Get-VBRLinuxGuestItem -LinuxFlrObject $session
Get-VBRLinuxGuestItem -LinuxFlrObject $session -ParentItem $root
This example shows how to get all child items from disks that are added to the Srv2067 Unix-based machine.

Perform the following steps: 1. Start the restore session:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
- Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
- Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
- Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as the MountServer parameter value. Save the result to the $session variable.
2. Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Save the result to the $root variable.
Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Set the $root variable as the ParentItem parameter value.

---

### Parameters
#### **LinuxFlrObject**
For getting root guest OS files.
Specifies a running restore session of Linux-based or Unix-based guest OS files. The cmdlet will return files and folders that are available for restore on disks when you run this session.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRLinuxFlrObject]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for items that are available on disks.
The cmdlet will return items with these names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **ParentItem**
For getting child guest OS files.
Returns child folders and files that are available from backups of Linux-based or Unix-based machines.

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[VBRFLRItem]`|false   |named   |True (ByPropertyName)|

#### **Path**
Specifies a path to the folder where guest OS files that you want to restore are located.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **RecursiveSearch**
Defines that the cmdlet will look for items that are added to the specified folders and to all child folders.
If you provide this parameter, the cmdlet will return an array of all items that are added to Linux-based or Unix-based machines. Otherwise, the cmdlet will return an array of items that are added to the parent folder on Linux-based or Unix-based machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRLinuxFlrObject

System.String[]

Veeam.Backup.PowerShell.Infos.VBRFLRItem

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRFLRItem

---

### Notes

---

### Syntax
```PowerShell
Get-VBRLinuxGuestItem -LinuxFlrObject <VBRLinuxFlrObject> [-Name <String[]>] [-ParentItem <VBRFLRItem>] [-RecursiveSearch] [<CommonParameters>]
```
```PowerShell
Get-VBRLinuxGuestItem -LinuxFlrObject <VBRLinuxFlrObject> [-Path <String[]>] [<CommonParameters>]
```
