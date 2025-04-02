Get-VBRObjectRestorePoint
-------------------------

### Synopsis
Returns restore points created by jobs.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet returns restore points created by jobs.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRReplica](Get-VBRReplica)

* [Sort-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Sort-Object)

* [Select-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Select-Object)

---

### Examples
> Example 1. Getting all Restore Points

```PowerShell
Get-VBRObjectRestorePoint
This command looks for all restore points of all machines registered in the database.
```
> Example 2. Getting Restore Points by ID

```PowerShell
Get-VBRObjectRestorePoint -Id "2ee79fec-9aa8-4058-a147-ff6b76ef2924"
This command looks for the 2ee79fec-9aa8-4058-a147-ff6b76ef2924 restore point.
```
> Example 3. Getting Restore Points Created by Backup Job

$backup = Get-VBRBackup -Name "MSExchange"
Get-VBRObjectRestorePoint -Name *MSExchange02* -Backup $backup
This example shows how to get all restore points of the MSExchange02 machine that is backed up by the MSExchange backup job.

Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRObjectRestorePoint cmdlet. Specify the Name parameter value. Set the $backup variable as the Backup parameter value.
> Example 4. Getting Restore Points Created by Replication Job

$replica = Get-VBRReplica -Name "DC Replica"
Get-VBRObjectRestorePoint -Backup $replica
This example shows how to get all restore points of machines that are replicated by the DC Replica replication job.
Perform the following steps:
1. Run the Get-VBRReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRObjectRestorePoint cmdlet. Set the $replica variable as the Backup parameter value.
> Example 5. Getting Restore Points Created by Veeam Agent

$winbackup = Get-VBRBackup -Name "WinBackup*"
Get-VBRObjectRestorePoint -Backup $winbackup
This example shows how to get all restore points of Windows-based machines backed up by the WinBackup Veeam Agent job.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $winbackup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRObjectRestorePoint cmdlet will not return any restore points for the Veeam Agent job.
2. Run the Get-VBRObjectRestorePoint cmdlet. Set the $winbackup variable as the Backup parameter value.
> Example 6. Getting Latest Restore Point Created by Backup Job [Using Pipeline]

Get-VBRBackup -Name MSExchange Backup | Get-VBRObjectRestorePoint -Name MSExchange02 | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
This example shows how to look for the latest restore point of machines that are backed up by the MSExchange Backup backup job.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRObjectRestorePoint cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
4. Pipe the cmdlet output to the Select-Object cmdlet. Set the 1 number as the First parameter value.

---

### Parameters
#### **Backup**
Specifies an array of backups. The cmdlet will return restore points of these backups.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies an array of IDs, The cmdlet will return restore points of these backups.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for backed-up machines. The cmdlet will return restore points of these machines.
Note: For vCD and CDP replica you must specify a vApp.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ObjectId**
Specifies an array of IDs of backed-up hosts and machines. The cmdlet will return restore points of these hosts and machines.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CBackup[]

System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRObjectRestorePoint -Backup <CBackup[]> [<CommonParameters>]
```
```PowerShell
Get-VBRObjectRestorePoint -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRObjectRestorePoint -Name <String[]> [<CommonParameters>]
```
```PowerShell
Get-VBRObjectRestorePoint -ObjectId <Guid[]> [<CommonParameters>]
```
