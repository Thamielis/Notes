Get-VBRBackupSession
--------------------

### Synopsis
Returns jobs sessions.

---

### Description

This cmdlet returns jobs sessions.
You can get the sessions for the following jobs:
- Backup jobs
- Replication jobs
- Backup copy jobs
- NAS backup jobs
- NAS backup copy jobs
Run the Get-VSBTaskSession cmdlet to get the SureBackup jobs sessions.
Run the Get-VBRSession cmdlet to get the tape jobs sessions.
Run the Get-VBRTaskSession cmdlet to get the tasks performed during specific sessions.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

---

### Examples
> Example 1. Getting All Backup Sessions

```PowerShell
Get-VBRBackupSession
This command returns the list of all backup sessions.
```
> Example 2. Getting Backup Session by Name

```PowerShell
Get-VBRBackupSession -Name "Backup Copy (Incremental)"
This command returns all Backup Copy sessions with incremental backups.
```
> Example 3. Getting Latest Backup Session for Backup Job

$job = Get-VBRJob -Name "ABC Job"
Get-VBRBackupSession | Where {$_.jobId -eq $job.Id.Guid} | Sort EndTimeUTC -Descending | Select -First 1
This example shows how to return the latest backup session for the backup job.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRBackupSession cmdlet. Use the Where-Object method to get all backup sessions for the backup job in the $job variable. Use the Sort-Object method to get the latest backup session.
> Example 4. Getting Latest Stopped Backup Session

```PowerShell
Get-VBRBackupSession | Sort {$_.state -eq "Stopped"} -Descending | Select -First 1
This command returns the latest stopped backup session.
```

---

### Parameters
#### **Id**
Specifies the array of backup session IDs. The cmdlet will return the sessions with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specify the array of backup session names, followed by the backup type (Incremental, Full, Synthetic Full).
The cmdlet will return the sessions with these names and the specified backup type.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

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
Get-VBRBackupSession [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRBackupSession [-Name <String[]>] [<CommonParameters>]
```
