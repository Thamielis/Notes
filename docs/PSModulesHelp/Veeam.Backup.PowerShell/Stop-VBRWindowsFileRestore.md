Stop-VBRWindowsFileRestore
--------------------------

### Synopsis
Stops Windows guest OS file restore session.

---

### Description

This cmdlet stops Windows guest OS file restore session initiated with the Start-VBRWindowsFileRestore cmdlet.
Note: Note that you cannot restore files after the disks are unmounted.

---

### Examples
> Example 1

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint
Stop-VBRWindowsFileRestore -FileRestore $session
This example shows how to stop a restore session of Windows guest OS files of the WinSrv25 machine.

Perform the following steps:
1. Start the restore session.
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter value. Save the result to the $restorepoint variable.
c. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
2. Run the Stop-VBRWindowsFileRestore cmdlet. Set the $session variable as the FileRestore parameter value.
> Example 2

```PowerShell
Stop-VBRWindowsFileRestore -MountPoint "C:\Disks"
This command unmounts Windows Guest OS Disks from the C:\Disks mount point.
```

---

### Parameters
#### **FileRestore**
Specifies the running Windows guest OS file restore session you want to stop.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[FileRestore]`|false   |0       |False        |

#### **MountPoint**
Specifies the path to the mounted disk.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Stop-VBRWindowsFileRestore [[-FileRestore] <FileRestore>] [<CommonParameters>]
```
```PowerShell
Stop-VBRWindowsFileRestore [-MountPoint <String>] [<CommonParameters>]
```
