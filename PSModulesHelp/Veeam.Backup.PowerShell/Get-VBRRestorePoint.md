Get-VBRRestorePoint
-------------------

### Synopsis
Returns restore points.

---

### Description

This cmdlet returns restore points created by Veeam Backup & Replication.
Restore points created by replication jobs are represented as snapshots.
Restore points created by backup jobs are represented as full and increment backup files.
IMPORTANT! To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint cmdlet will not return any restore points for the Veeam Agent job.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Sort-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Sort-Object)

* [Select-Object](https://learn.microsoft.com/powershell/module/Microsoft.PowerShell.Utility/Select-Object)

* [Get-VBRReplica](Get-VBRReplica)

---

### Examples
> Example 1. Getting all Restore Points

```PowerShell
Get-VBRRestorePoint
This command looks for all restore points of all VMs registered in the database.
```
> Example 2. Getting Restore Points by ID

```PowerShell
Get-VBRRestorePoint -Id 2ee79fec-9aa8-4058-a147-ff6b76ef2924
This command looks for the 2ee79fec-9aa8-4058-a147-ff6b76ef2924 restore point.
```
> Example 3. Getting Restore Points Created by Backup Job

$backup = Get-VBRBackup -Name "MSExchange"
Get-VBRRestorePoint -Name *MSExchange02* -Backup $backup
This example shows how to get all restore points of the MSExchange02 VM that is backed up by the MSExchange backup job.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Specify the Name parameter value. Set the $backup variable as the Backup parameter value.
> Example 4. Getting Restore Points Created by Replication Job

$replica = Get-VBRReplica -Name "DC Replica"
Get-VBRRestorePoint -Backup $replica
This example shows how to get all restore points of VMs that are replicated by the DC Replica replication job.
Perform the following steps:
1. Run the Get-VBRReplica cmdlet. Specify the Name parameter value. Save the result to the $replica variable.
2. Run the Get-VBRRestorePoint cmdlet. Set the $replica variable as the Backup parameter value.
> Example 5. Getting Restore Points Created by Veeam Agent

$winbackup = Get-VBRBackup -Name "WinBackup*"
Get-VBRRestorePoint -Backup $winbackup
This example shows how to get all restore points of Windows-based machines backed up by the WinBackup Veeam Agent job.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $winbackup variable.
Note: To get a list of restore points for a Veeam Agent job, you must provide the asterisks sign for the Name parameter value: Name "AgentJob*". Otherwise, the Get-VBRRestorePoint cmdlet will not return any restore points for the Veeam Agent job.
2. Run the Get-VBRRestorePoint cmdlet. Set the $winbackup variable as the Backup parameter value.
> Example 6. Getting Latest Restore Point Created by Backup Job [Using Pipeline]

Get-VBRBackup -Name MSExchange Backup | Get-VBRRestorePoint -Name MSExchange02 | Sort-Object -Property CreationTime -Descending | Select-Object -First 1
This example shows how to look for the latest restore point of VMs that are backed up by the MSExchange Backup backup job.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
4. Pipe the cmdlet output to the Select-Object cmdlet. Specify the First parameter value.
> Example 7. Getting Latest Restore Point Created by Replication Job [Using Pipeline]

Get-VBRReplica -Name Replica_Exchange | Get-VBRRestorePoint -Name MSExchange02 | Sort-Object -Property CreationTime -Descending | Select -First 1
This example shows how to return the latest restore point of the MSExchange02 VM that is replicated by the Replica_Exchange replication job.
Perform the following steps:
1. Run the Get-VBRReplica cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value as the Property parameter value. Provide the Descending parameter.
4. Pipe the cmdlet output to the Select cmdlet. Specify the First parameter value.

---

### Parameters
#### **Backup**
Specifies the array of backups. The cmdlet will return restore points of these backups.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|false   |0       |True (ByPropertyName, ByValue)|

#### **Id**
Specifies an array of IDs of backed-up VMs. The cmdlet will return restore points of these VMs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName)|

#### **Name**
Specifies an array of VM names. The cmdlet will return restore points of these VMs.
Note: For vCD and CDP replica you must specify a vApp.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **ObjectId**
Specifies an array of IDs of backed-up hosts and VMs. The cmdlet will return restore points of these hosts and VMs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Guid[]

Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRRestorePoint [[-Backup] <CBackup[]>] [-Name <String[]>] [-ObjectId <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRRestorePoint -Id <Guid[]> [<CommonParameters>]
```
