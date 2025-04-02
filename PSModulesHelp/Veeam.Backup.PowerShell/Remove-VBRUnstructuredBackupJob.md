Remove-VBRUnstructuredBackupJob
-------------------------------

### Synopsis
Removes file backup jobs and object storage backup jobs from the backup infrastructure.

---

### Description

This cmdlet removes file backup jobs and object storage backup jobs from the backup infrastructure.

---

### Related Links
* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

---

### Examples
> Example 1. Removing All File Backup and Object Storage Backup Jobs

$job = Get-VBRUnstructuredBackupJob  
Remove-VBRUnstructuredBackupJob -Job $job
This example shows how to remove all file backup jobs from the Veeam Backup & Replication infrastructure.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Save the result to the $job variable.
2. Run the Remove-VBRUnstructuredBackupJob cmdlet. Set the $job variable as the Job parameter value.
> Example 2. Removing Object Storage Backup Jobs by Name

$job = Get-VBRUnstructuredBackupJob -Name "Azue Job" 
Remove-VBRUnstructuredBackupJob -Job $job
This example shows how to remove the Azue Job file backup jobs.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value.Save the result to the $job variable.
2. Run the Remove-VBRUnstructuredBackupJob cmdlet. Set the $job variable as the Job parameter value.

---

### Parameters
#### **Job**
Specifies an array of file backup jobs and object storage backup jobs. The cmdlet will remove these jobs from the backup infrastructure. Accepts the VBRUnstructuredBackupJob[] object.  To get this object, run the Get-VBRUnstructuredBackupJob cmdlet.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRUnstructuredBackupJob -Job <VBRUnstructuredBackupJob[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
