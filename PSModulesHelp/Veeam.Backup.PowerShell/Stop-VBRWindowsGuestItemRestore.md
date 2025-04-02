Stop-VBRWindowsGuestItemRestore
-------------------------------

### Synopsis
Stops Windows guest OS file restore session initiated with the Start-VBRWindowsGuestItemRestore cmdlet.

---

### Description

Stops Windows guest OS file restore session initiated with the Start-VBRWindowsGuestItemRestore cmdlet.

---

### Examples
> Example 1

$backup = Get-VBRBackup
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint
$restoresession = Start-VBRWindowsGuestItemRestore -Path "C:\Files\" -FileRestore $session -RestorePolicy Keep -RunAsync
Stop-VBRWindowsGuestItemRestore -ItemSession $restoresession
This example shows how to stop a restore session for Windows VM guest OS files. During the session, files are restored to the specified folder.

Perform the following steps:
1. Run Get-VBRBackup to get a backup that contains files which you want to restore. Save the result to the $backup variable.
2. Run Get-VBRRestorePoint with the $backup variable to get a restore point of a VM. Use the Name parameter to specify the VM name. Save the result to the $restorepoint variable.
3. Run Start-VBRWindowsFileRestore with the $restorepoint variable. Save the result to the $session variable.
4. Run the Start-VBRWindowsGuestItemRestore cmdlet and save the result to the $restoresession variable. Specify the following settings:
a. Specify the Path parameter.
b. Set the $session variable as the FileRestore parameter value.
c. Specify the RestorePolicy parameter.
d. Specify the RunAsync parameter.
5. Run the Stop-VBRWindowsGuestItemRestore cmdlet. Set the $restoresession variable as the ItemSession parameter value.

---

### Parameters
#### **ItemSession**
Specifies the running Windows guest OS file restore session that you want to stop.

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
Stop-VBRWindowsGuestItemRestore -ItemSession <VBRItemSession> [<CommonParameters>]
```
