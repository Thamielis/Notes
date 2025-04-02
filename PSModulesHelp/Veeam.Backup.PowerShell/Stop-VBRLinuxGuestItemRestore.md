Stop-VBRLinuxGuestItemRestore
-----------------------------

### Synopsis
Stops Linux guest OS file restore session initiated with the Start-VBRLinuxGuestItemRestore cmdlet.

---

### Description

This cmdlet stops Linux-based or Unix-based guest OS file restore session initiated with the Start-VBRLinuxGuestItemRestore cmdlet.

---

### Examples
> Example 1

$backup = Get-VBRBackup -Name "UbuntuSrv"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$server = Get-VBRServer -Name "LinSrv05"
$session = Start-VBRLinuxFileRestore -RestorePoint $restorepoint -MountServer $server
$root = Get-VBRLinuxGuestItem -LinuxFlrObject $session
$child = Get-VBRLinuxGuestItem -LinuxFlrObject $session -ParentItem $root
$restoresession = Start-VBRLinuxGuestItemRestore -LinuxFlrObject $session -Item $child[3] -RunAsync
Stop-VBRLinuxGuestItemRestore -ItemSession $restoresession
This example shows how to stop a restore session.
During the session Unix-based guest OS files of the UbuntuSrv VM are restored to the original host with the following settings:
- The cmdlet will overwrite existing files and folders.
- The cmdlet will use the LinSrv05 machine as a helper appliance.

Perform the following steps:
1. Mount the disk and get the OS files:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
c. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $server variable.
d. Run the Start-VBRLinuxFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Set the $server variable as MountServer parameter value. Save the result to the $session variable.
e. Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable the LinuxFlrObject parameter value. Save the result to the $root variable.
f. Run the Get-VBRLinuxGuestItem cmdlet. Set the $session variable as the LinuxFlrObject parameter value. Set the $root variable as ParentItem parameter value. Save the result to the $child variable.
The Get-VBRLinuxGuestItem cmdlet will return an array of files and folders. Mind the ordinal number of the necessary item (in our example, it is the fourth item in the array).
2. Run the Start-VBRLinuxGuestItemRestore cmdlet. Specify the LinuxFlrObject and Item parameter values. Specify the RunAsync parameter. Save the result to the $restoresession variable.
3. Run the Stop-VBRLinuxGuestItemRestore. Set the $restoresession variable as the ItemSession parameter value.

---

### Parameters
#### **ItemSession**
Specifies the running Linux guest OS file restore session that you want to stop.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRItemSession]`|true    |named   |False        |

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
Stop-VBRLinuxGuestItemRestore -ItemSession <VBRItemSession> [<CommonParameters>]
```
