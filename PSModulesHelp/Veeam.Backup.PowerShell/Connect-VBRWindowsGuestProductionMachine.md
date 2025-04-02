Connect-VBRWindowsGuestProductionMachine
----------------------------------------

### Synopsis
Connects to the machine where original files and folders reside.

---

### Description

Connects to the machine where original files and folders reside. You must launch this cmdlet before comparing files and folders using the Compare-VBRWindowsGuestItemsAttributes cmdlet.

---

### Examples
> Example 1

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint[1]
Connect-VBRWindowsGuestProductionMachine -FileRestore $session
This example shows how to connect to a machine whose files you restore.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore session in the array).
3. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
4. Run the Connect-VBRWindowsGuestProductionMachine cmdlet. Set the $session variable as the FileRestore parameter value.

---

### Parameters
#### **FileRestore**
Specifies a restore session of Microsoft Windows guest OS files.
The cmdlet will use this session to restore guest OS files.
Note: The restore session must be started within the current PowerShell session.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[FileRestore]`|true    |named   |False        |

#### **GuestCredentials**
Specifies credentials for the original machine.
Note: If you do not specify credentials, the cmdlet will try to use the credentials specified in the backup job that created the backup.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

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
Connect-VBRWindowsGuestProductionMachine -FileRestore <FileRestore> [-GuestCredentials <CCredentials>] [<CommonParameters>]
```
