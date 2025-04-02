Get-VBRWindowsGuestItem
-----------------------

### Synopsis
Returns Microsoft Windows guest OS files.

---

### Description

This cmdlet returns guest OS files of the Microsoft Windows machines.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Start-VBRWindowsFileRestore](Start-VBRWindowsFileRestore)

---

### Examples
> Example 1. Getting all Disks of Microsoft Windows Machine

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint[1]
Get-VBRWindowsGuestItem -FileRestore $session
This example shows how to get all top-level disks of the WinSrv25 Microsoft Windows machine.

Perform the following steps:
1. Get the restore session:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter values. Save the result to the $restorepoint variable.
c. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
2. Run the Get-VBRWindowsGuestItem cmdlet. Set the $session variable as the FileRestore parameter value.
> Example 2. Getting File Availabe in Microsoft Windows Machine by Providing File Path

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint[1]
Get-VBRWindowsGuestItem -FileRestore $session -Path "C:\Documents\Training\SummerTraining2020.pdf"
This example shows how to get the SummerTraining2020.pdf file by providing the C:\Documents\Training\SummerTraining.pdf file path.
The cmdlet will get this file from a backup of the WinSrv25 Microsoft Windows machine.

Perform the following steps:
1. Get the restore session:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter values. Save the result to the $restorepoint variable.
c. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
2. Run the Get-VBRWindowsGuestItem cmdlet. Set the $session variable as the FileRestore parameter value. Specify the Path parameter value.
> Example 3. Getting Specific File Availabe in Folder of Microsoft Windows Machine

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint[1]
$items = Get-VBRWindowsGuestItem -FileRestore $session -Name "Vacation"
Get-VBRWindowsGuestItem -FileRestore $session -ParentItem $items[1] -Name "CyclingTripJuly"
This example shows how to get the CyclingTripJuly file from a backup of the WinSrv25 Microsoft Windows machine.
The cmdlet will look for this file in the Vacation folder.
Perform the following steps:
1. Get the restore session:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter values. Save the result to the $restorepoint variable.
c. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
2. Run the Get-VBRWindowsGuestItem cmdlet. Set the $session variable as the FileRestore parameter value. Specify the Name parameter value. Save the result to the $items variable.
3. Run the Get-VBRWindowsGuestItem cmdlet. Specify the following settings:
- Set the $session variable as the FileRestore parameter value.
- Set the $items variable as the ParentItem parameter value.
- Specify the Name parameter value.
> Example 4. Getting Specific File Availabe in Folder and Its Subfolders in Microsoft Windows Machine

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint[1]
$items = Get-VBRWindowsGuestItem -FileRestore $session -Name "Reports"
Get-VBRWindowsGuestItem -FileRestore $session -ParentItem $items[1] -Name "AutumnReport" -RecursiveSearch
This example shows how to get the AutumnReport file from a backup of the WinSrv25 Microsoft Windows machine.
The cmdlet will look for this file in the Reports folder and its subfolders.
Perform the following steps:
1. Get the restore session:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter values. Save the result to the $restorepoint variable.
c. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
2. Run the Get-VBRWindowsGuestItem cmdlet. Set the $session variable as the FileRestore parameter value. Specify the Name parameter values. Save the result to the $items variable.
3. Run the Get-VBRWindowsGuestItem cmdlet. Specify the following settings:
- Set the $session variable as the FileRestore parameter value.
- Set the $items variable as the ParentItem parameter value.
- Specify the Name parameter value.
- Provide the RecursiveSearch parameter.

---

### Parameters
#### **ChangedOnly**
For the CompareWithOriginal parameter.
Defines that the cmdlet will return files and folders with changed attributes only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **CompareWithOriginal**
For the ChangedOnly parameter.
Note: Before comparing attributes, you must establish connection with the original machine using the Connect-VBRWindowsGuestProductionMachine cmdlet.
Defines that Veeam Backup & Replication compares attributes of files and folders from the current restore session with attributes of original files and folders.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FileRestore**
Specifies a restore session of Microsoft Windows guest OS files. The cmdlet will use this session to restore guest OS files.
Note: The restore session must be started within the current PowerShell session.
This parameter is required if the Session parameter is not specified.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[FileRestore]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for guest OS files of Microsoft Windows machines.
The cmdlet will return guest OS files with these names.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **ParentItem**
For getting child items from disks.
Returns child guest OS files of Microsoft Windows machines.

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[VBRFLRItem]`|false   |named   |True (ByPropertyName)|

#### **Path**
Specifies an array of file paths to the item that you want to restore.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

#### **RecursiveSearch**
Defines that the cmdlet will look for guest OS files that are added to the specified folders and to all child folders.
If you provide this parameter, the cmdlet will return an array of all guest OS files of Microsoft Windows machines.
Otherwise, the cmdlet will return an array of guest OS that are added to the parent folder in Microsoft Windows machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies a running restore session of Microsoft Windows VMs guest OS files.
The cmdlet will return disks of Microsoft Windows machines for which you run a restore session.
This parameter is required if the FileRestore parameter is not specified.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[CRestoreSession]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CRestoreSession

Veeam.Backup.PowerShell.Infos.FileRestore

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
Get-VBRWindowsGuestItem [-ChangedOnly] [-CompareWithOriginal] [-FileRestore <FileRestore>] [-Name <String[]>] [-ParentItem <VBRFLRItem>] [-RecursiveSearch] [-RunAsync] [-Session <CRestoreSession>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-VBRWindowsGuestItem [-ChangedOnly] [-CompareWithOriginal] [-FileRestore <FileRestore>] [-Path <String[]>] [-RunAsync] [-Session <CRestoreSession>] [<CommonParameters>]
```
