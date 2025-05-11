Get-VBRComputerDiskPartition
----------------------------

### Synopsis
Returns volumes of computers backed-up with Veeam Agent For Microsoft Windows.
IMPORTANT!
This cmdlet is available starting from Veeam Backup & Replication 11a (build 11.0.1.1261).

---

### Description

This cmdlet returns volumes of computers backed-up with Veeam Agent for Microsoft Windows.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Get-VBRComputerDisk](Get-VBRComputerDisk)

---

### Examples
> Example 1. Getting all Volumes of Computers Backed-Up with Veeam Agent For Microsoft Windows

$backup = Get-VBRBackup -Name "WinLaptop2017*"
$restorepoint = Get-VBRRestorePoint -Backup $backup
Get-VBRComputerDiskPartition -RestorePoint $restorepoint[3]
This example shows how get all volumes of the WinLaptop2017 computer backed-up with Veeam Agent For Microsoft Windows.
Perform the following steps:
1. Get the restore point:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint cmdlet will not return any restore points for the Veeam Agent job.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
2. Run the Get-VBRComputerDiskPartition cmdlet. Set the $restorepoint[3] variable as the RestorePoint parameter value.
> Example 2. Getting Specific Volumes of Computers Backed-Up with Veeam Agent For Microsoft Windows

$backup = Get-VBRBackup -Name "WinLaptop2017*"
$restorepoint = Get-VBRRestorePoint -Backup $backup
$disk = Get-VBRComputerDisk -RestorePoint $restorepoint[3]
Get-VBRComputerDiskPartition -RestorePoint $restorepoint[3] -Disk $disk[2]
This example shows how to get specific volumes of the WinLaptop2017 computer backed-up with Veeam Agent For Microsoft Windows.
Perform the following steps:
1. Get the restore point:
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint will not return any restore points for the Veeam Agent job.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the fourth restore point in the array).
2. Run the Get-VBRComputerDisk cmdlet. Set the $restorepoint[3] variable as the RestorePoint parameter value. Save the result to the $disk variable.
The Get-VBRComputerDisk cmdlet will return an array of volumes. Mind the ordinal number of the necessary volumes (in our example, it is the third volume in the array).
3. Run the Get-VBRComputerDiskPartition cmdlet. Set the $restorepoint[3] variable as the RestorePoint parameter value. Set the $disk[2] variable as the Disk parameter value.

---

### Parameters
#### **Disk**
Specifies computer disks. The cmdlet will return details on these disks.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRComputerDisk[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RestorePoint**
Specifies a restore point of computers. The cmdlet will return details on backed-up volumes of these computers

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

Veeam.Backup.PowerShell.Infos.VBRComputerDisk[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRComputerDiskPartition -Disk <VBRComputerDisk[]> -RestorePoint <COib> [<CommonParameters>]
```
