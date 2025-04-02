Get-VBRComputerDisk
-------------------

### Synopsis
Returns disks of computers backed-up with Veeam Agent For Microsoft Windows.

---

### Description

This cmdlet returns disks of computers backed-up with Veeam Agent For Microsoft Windows.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Getting Volumes of Computers Backed-Up with Veeam Agent For Microsoft Windows

$backup = Get-VBRBackup -Name "WinLaptop2017*"
$restorepoint = Get-VBRRestorePoint -Backup $backup
Get-VBRComputerDisk -RestorePoint $restorepoint[3]
This example shows how to get volumes of the WinLaptop2017 computer backed-up with Veeam Agent For Microsoft Windows.
Perform the following steps:
1. Get the restore point:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint cmdlet will not return any restore points for the Veeam Agent job.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
2. Run the Get-VBRComputerDisk cmdlet. Set the $restorepoint[3] variable as the RestorePoint parameter value.

---

### Parameters
#### **RestorePoint**
Specifies a restore point of computers. The cmdlet will return details on backed-up disks of these computers.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRComputerDisk -RestorePoint <COib> [<CommonParameters>]
```
