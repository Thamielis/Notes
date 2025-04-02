Compare-VBRWindowsGuestItemsAttributes
--------------------------------------

### Synopsis
Compares attributes of files and folders from a backup with attributes of original files and folders.

---

### Description

This cmdlet compares attributes of files and folders from a backup with attributes of original files and folders.
When Veeam Backup & Replication compares files, it compares their attributes. When Veeam Backup & Replication compares folders, it compares folder attributes and file attributes inside the folder recursively. Once a file with changed attributes is found, Veeam Backup & Replication stops comparing files and marks the folder as changed. If you further browse the folder in the compared state, Veeam Backup & Replication continues comparing non-compared files and folders. Veeam Backup & Replication compares the following attributes: Date Created, Date Modified, Size (only for files), Read-Only, Hidden, Archive, NTFS Encryption.
Note: Before comparing attributes, you must establish connection with the original machine using the Connect-VBRWindowsGuestProductionMachine cmdlet.

---

### Examples
> Example 1

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint[1]
Connect-VBRWindowsGuestProductionMachine -FileRestore $session
$file = Get-VBRWindowsGuestItem -FileRestore $session -Path "C:\Documents\Training\SummerTraining2020.pdf" 
Compare-VBRWindowsGuestItemsAttributes -FileRestore $session -Item $file
This example shows how to connect to a machine whose files you restore.

Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Specify the Backup and Name parameter values. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore session in the array).
3. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint as the RestorePoint parameter value. Save the result to the $session variable.
4. Run the Connect-VBRWindowsGuestProductionMachine cmdlet. Set $session as the FileRestore parameter value.
5. Run the Get-VBRWindowsGuestItem cmdlet. Set $session as the Session parameter value. Specif the Path parameter. Save the result to the $file variable.
6. Run the Compare-VBRWindowsGuestItemsAttributes cmdlet. Set $session as the FileRestore parameter value and $file as the FileRestore parameter value.

---

### Parameters
#### **FileRestore**
Specifies a restore session of Microsoft Windows guest OS files. The cmdlet will use this session to restore guest OS files.
Note: The restore session must be started within the current PowerShell session.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[FileRestore]`|true    |named   |False        |

#### **Item**
An array of files and folders whose attributes you want to compare.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRFLRFsItem]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFLRFsItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Compare-VBRWindowsGuestItemsAttributes -FileRestore <FileRestore> -Item <VBRFLRFsItem> [<CommonParameters>]
```
