Get-VBRComputerBackupJob
------------------------

### Synopsis
Returns Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Description

This cmdlet returns an array of Veeam Agent backup jobs and Veeam Agent backup policies.

---

### Examples
> Example 1. Getting all Veeam Agent Backup Jobs

Get-VBRComputerBackupJob
This command returns an array of all Veeam Agent backup jobs and Veeam Agent backup policies that are added to Veeam Backup & Replication.
> Example 2. Getting Veeam Agent Backup Job by Name

```PowerShell
Get-VBRComputerBackupJob -Name "Agent Job 05"
This command returns the Agent Job 05 Veeam Agent backup job.
```
> Example 3. Getting Veeam Agent Backup Policy

```PowerShell
Get-VBRComputerBackupJob -Mode ManagedByAgent
This command returns the Veeam Agent backup policy.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for Veeam Agent backup jobs or a Veeam Agent backup policies.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName)|

#### **Mode**
Specifies the Veeam Agent backup job mode. You can specify either of the following backup job modes:
* ManagedByAgent: use this option to get the backup policy.
* ManagedByBackupServer: use this option to get a Veeam Agent backup job.
Valid Values:

* ManagedByAgent
* ManagedByBackupServer

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRComputerBackupJobMode]`|false   |named   |False        |

#### **Name**
Specifies an array of names for Veeam Agent backup jobs or a Veeam Agent backup policies.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.String[]

System.Guid[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRComputerBackupJob [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRComputerBackupJob [-Mode {ManagedByAgent | ManagedByBackupServer}] [-Name <String[]>] [<CommonParameters>]
```
