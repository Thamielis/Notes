Get-VBRBackup
-------------

### Synopsis
Returns backups.

---

### Description

This cmdlet returns backups created with Veeam Backup & Replication.
NOTE: The backups contain all restore points for all machines that are processed by the job.

---

### Examples
> Example 1. Getting all Backups

Get-VBRBackup
This command returns all backups created with Veeam Backup & Replication.
> Example 2. Getting Backups by ID

```PowerShell
Get-VBRBackup -Id d6b08a78-f405-400a-bb02-a132cf1778fa
This command returns the d6b08a78-f405-400a-bb02-a132cf1778fa backup.
```
> Example 3. Getting Backups by Name

```PowerShell
Get-VBRBackup -Name "vCloud Webservices Backup", "Exchange Backup_imported"
This command returns the vCloud Webservices Backup and Exchange Backup_imported backups.
```
> Example 4. Getting VeeamZIP Backups

```PowerShell
Get-VBRBackup -VeeamZIP
This command returns the VeeamZIP backups.
```

---

### Parameters
#### **Id**
Specifies an array of the backup IDs. The cmdlet will return backups with these IDs.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName)|

#### **Name**
Specifies an array of the job name. The cmdlet will return backups produced with these jobs.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **VeeamZIP**
Defines that the cmdlet will return VeeamZIP backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
System.Guid[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRBackup -Id <Guid[]> [-VeeamZIP] [<CommonParameters>]
```
```PowerShell
Get-VBRBackup [-Name <String[]>] [-VeeamZIP] [<CommonParameters>]
```
