Get-VBRBackupObject
-------------------

### Synopsis
Returns backups of machines.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet returns backups of machines. You can scan these backups with antivirus or YARA scan.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Getting Backups of Machines

$backup = Get-VBRBackup
$vmbackup = Get-VBRBackupObject -Backup $backup
This example shows how to get backups of machines.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Save the result to the $backup variable. 2. Run the Get-VBRBackupObject cmdlet. Set the $backup variable as the Backup parameter value. Save the result to the $vmbackup variable.

---

### Parameters
#### **Backup**
Specifies a backup with backed-up machines.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[CBackup]`|true    |named   |False        |

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
Get-VBRBackupObject -Backup <CBackup> [<CommonParameters>]
```
