Detach-VBRBackup
----------------

### Synopsis
Detaches backups from the job they belong to.

---

### Description

This cmdlet detaches backups from the job they belong to.

When the cmdlet detaches backups from a job, the job stops processing these backup files. During the next run, the job will start a new backups chain, that is, will create active full backups.
If the detached backups belonged to the job with daily retention, the background retention process retains the backups according to the configured retention and deletes the backups from the repository after the retention period ends. If the retention period is set in restore points, the background retention process does not delete the backups. You need to delete them manually using the Remove-VBRBackup cmdlet.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Detaching Backups from Job

$backup = Get-VBRBackup -Name "Daily backups"
Detach-VBRBackup -Backup $backup
This example shows how to detach backups from the Daily backups job.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Detach-VBRBackup cmdlet. Set the $backup variable as the Backup parameter value.

---

### Parameters
#### **Backup**
Specifies an array of backups that you want to detach from a job.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will detach backups without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Detach-VBRBackup -Backup <CBackup[]> [-Force] [-Confirm] [-WhatIf] [<CommonParameters>]
```
