Get-VBRGoogleCloudBackup
------------------------

### Synopsis
Returns backups of Google Cloud VM instances.

---

### Description

This cmdlet returns backups of Google Cloud VM instances. You can use these backups to restore Google Cloud VM instances or to create a backup copy job.

---

### Examples
> Getting All Backups of Google Cloud VM Instances

Get-VBRGoogleCloudBackup
This command returns all backups of Google Cloud VM instances that were created by Veeam Backup & Replication.

---

### Parameters
#### **Name**
Specifies an array of backup names.

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
Get-VBRGoogleCloudBackup [-Name <String[]>] [<CommonParameters>]
```
