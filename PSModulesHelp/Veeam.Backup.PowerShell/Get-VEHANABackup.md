Get-VEHANABackup
----------------

### Synopsis
Returns SAP HANA backups stored in a backup repository.

---

### Description

This cmdlet returns an array of SAP HANA backups stored in a backup repository. After you get the backups, you can use the Start-VEHANARestoreSession cmdlet to start a restore session from the specified backup.

---

### Examples
> Example 1. Getting All SAP HANA Backups

```PowerShell
$backup = Get-VEHANABackup
This command returns an array with all SAP HANA backups stored in a backup repository. Save the result to the $backup variable to be able to use it with other cmdlets.
```
> Example 2. Getting Specific SAP HANA Backups

```PowerShell
$backup = Get-VEHANABackup -Name "Backup_01"
This command returns an array of SAP HANA backups with the specified names. Save the result to the $backup variable to be able to use it with other cmdlets.
```

---

### Parameters
#### **Name**
Specifies the names of the necessary SAP HANA backups.

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
Get-VEHANABackup [-Name <String[]>] [<CommonParameters>]
```
