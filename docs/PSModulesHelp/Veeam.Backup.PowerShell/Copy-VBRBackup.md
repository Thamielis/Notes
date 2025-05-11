Copy-VBRBackup
--------------

### Synopsis
Copies backups to a repository or local or shared folder.

---

### Description

This cmdlet copies the whole backup chains to a repository or local or shared folder.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Copying Backups

$backup = Get-VBRBackup
$repository = Get-VBRBackupRepository
Copy-VBRBackup -Backup $backup -Repository $repository
This example shows how copy backups to a repository.
Perform the following steps:
1.	Run the Get-VBRBackup cmdlet. Save the result to the $backup variable.
2.  Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3.  Run the Copy-VBRBackup cmdlet. Set the $backup variable as the Backup parameter value. Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **AutoDelete**
Specifies the time interval after which Veeam Backup & Replication will delete copied backups.
The parameter accepts the following values:
* In1Month
* In3Months
* In6Months
* In1Year
* In2Years
* In3Years
* In5Years
* In7Years
Valid Values:

* In1Month
* In3Months
* In6Months
* In1Year
* In2Years
* In3Years
* In5Years
* In7Years

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRMoveCopyRetention]`|false   |named   |False        |

#### **Backup**
Specifies the backups that will be copied.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will copy backups without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies an array of names of the workloads that you want to move.
Note: This parameter applies only if backups are per-machine with metadata for each workload.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Path**
Specifies a path to the local or shared folder to which you want to copy backups.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Repository**
Specifies the repository to which you want to copy backups.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CBackupRepository]`|false   |named   |True (ByPropertyName, ByValue)|

#### **RetentionNumber**
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).
For the RetentionPeriodType option.
Specifies the period of time to keep the copied data. After this period finishes, Veeam Backup & Replication will remove data.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPeriodType**
Note: This parameter is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).
Specifies the type of the retention policy. You can set the following types:
* Days: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Months: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
* Years: use this option if you want Veeam Backup & Replication to apply retention policy yearly.
Use the RetentionNumber to specify the number of days, months or years.
Note: Use this parameter if the AutoDelete parameter is not specified.
Valid Values:

* Days
* Months
* Years

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRRetentionPeriodType]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ShareCredentials**
Specifies the credentials that will be used to access the shared folder.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CCredentials]`|false   |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.Core.CBackup

System.String[]

System.String

Veeam.Backup.Common.CCredentials

Veeam.Backup.Core.CBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Copy-VBRBackup [-AutoDelete {In1Month | In3Months | In6Months | In1Year | In2Years | In3Years | In5Years | In7Years}] -Backup <CBackup> [-Force] [-Name <String[]>] [-Path <String>] [-RetentionNumber <Int32>] 
```
```PowerShell
[-RetentionPeriodType {Days | Months | Years}] [-RunAsync] [-ShareCredentials <CCredentials>] [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Copy-VBRBackup [-AutoDelete {In1Month | In3Months | In6Months | In1Year | In2Years | In3Years | In5Years | In7Years}] -Backup <CBackup> [-Force] [-Name <String[]>] [-Repository <CBackupRepository>] 
```
```PowerShell
[-RetentionNumber <Int32>] [-RetentionPeriodType {Days | Months | Years}] [-RunAsync] [-Confirm] [-WhatIf] [<CommonParameters>]
```
