Get-VBRSecurityOptions
----------------------

### Synopsis
Returns Veeam Backup & Replication security settings.

---

### Description

This cmdlet returns information on the following Veeam Backup & Replication security settings:
- Backup Server Certificate
- Linux Host Authentication
- Audit Logs Location

---

### Examples
> Getting Veeam Backup & Replication Security Settings

Get-VBRSecurityOptions
Certificate              : Veeam.Backup.PowerShell.Infos.VBRBackupServerCertificate
TrustedHosts             : 0
HostPolicy               : Veeam.Backup.PowerShell.Infos.VBRLinuxTrustedHostPolicy
AuditLogsPath            : C:\ProgramData\Veeam\Backup\Audit
CompressOldAuditLogs     : True
FipsCompliantModeEnabled : False
This example returns Veeam Backup & Replication security settings.
The cmdlet output will contain the following details on the security settings: Certificate, TrustedHosts, HostPolicy, AuditLogsPath,CompressOldAuditLogs and the FipsCompliantModeEnabled.

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
Get-VBRSecurityOptions [<CommonParameters>]
```
