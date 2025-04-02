Export-VBRConfiguration
-----------------------

### Synopsis
Starts configuration backup job.

---

### Description

This cmdlet backs up current configuration of Veeam Backup & Replication server.

With configuration backup, you can store a copy of your host configuration: your virtual infrastructure, jobs configuration, Veeam Backup & Replication settings and other data. In case the Veeam Backup & Replication host is failed or configuration is corrupted, you can restore configuration with this copy.

The configuration backup is job-driven. You can configure settings of the configuration backup job, including schedule, in the main menu of the Veeam backup console. With Veeam PowerShell, you can start a job session but you cannot change the settings.

By default, the configuration backup job runs daily. The resulting backup files are stored to the C:\backup\VeeamConfigBackup\%BackupServer% folder on the Veeam backup default repository.

You cannot restore configuration with Veeam PowerShell. It is recommended to perform the restore operation with Veeam Backup & Replication UI for full functionality.

---

### Examples
> Example 1

Export-VBRConfiguration
This command backs up current configuration of Veeam Backup & Replication host.

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
Export-VBRConfiguration [<CommonParameters>]
```
