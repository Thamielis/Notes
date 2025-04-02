Get-VBRBackupServerInfo
-----------------------

### Synopsis
Returns the backup server information.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet returns the following information on the backup server:
- Name - the IP or name of the backup server.
- Build - the build version of you Veeam Backup & Replication installation.
- PatchLevel - patch details.

---

### Examples
> Getting Information on Backups Server

```PowerShell
Get-VBRBackupServerInfo
This command returns the IP address, current build version and patch details of the backup server.
```

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
Get-VBRBackupServerInfo [<CommonParameters>]
```
