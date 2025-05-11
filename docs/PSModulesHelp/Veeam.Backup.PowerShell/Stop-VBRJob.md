Stop-VBRJob
-----------

### Synopsis
Stops a running backup, replication or copy job.

---

### Description

This cmdlet stops a running backup, replication or copy job. The job is stopped once, the scheduled job will start the next scheduled time.

Run the Start-VBRJob cmdlet to start the job manually.
Run the Disable-VBRJob cmdlet to temporarily disable a job.
Run the Stop-VSBJob cmdlet to stop a SureBackup job.
Run the Stop-VBRComputerBackupJob cmdlet to stop Veeam Agent backup jobs and Veeam Agent backup policies.
Run the Stop-VBRBackupCopyJob cmdlet to stop a backup copy job.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Stopping Specific Job [Using Pipeline]

Get-VBRJob -Name "SharePoint File Copy Job" | Stop-VBRJob
This example shows how to stop the SharePoint File Copy Job copy job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Stop-VBRJob cmdlet.
> Example 2. Stopping Specific Job [Using Variable]

$SharePointFileCopyJob = Get-VBRJob
Stop-VBRJob -Job $"SharePoint File Copy Job"
This example shows how to stop the copy job represented by the $SharePointFileCopyJob variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $SharePointFileCopyJob variable.
2. Run the Stop-VBRJob cmdlet. Set the $SharePointFileCopyJob variable as the Job parameter value.

---

### Parameters
#### **Gracefully**
Defines that the cmdlet will stop a job gracefully.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Job**
Specifies the array of jobs you want to stop.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command will return immediately without waiting for the task to complete.

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
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRJob [-Job] <CBackupJob[]> [-Gracefully] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
