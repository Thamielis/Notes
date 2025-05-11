Enable-VBRIndependentRetention
------------------------------

### Synopsis
Enables previously disabled background retention for backups.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet enables the disabled background retention for backups. Enabled background retention is launched every 24 hours at 00:30.
Run the Disable-VBRIndependentRetention cmdlet to disable background retention policy.
The Enable-VBRBackgroundRetention cmdlet is an alias for the Enable-VBRIndependentRetention cmdlet.

---

### Examples
> Enabling Background Retention for Backups

```PowerShell
Enable-VBRIndependentRetention
This command enables background retention for backups.
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
Enable-VBRIndependentRetention [<CommonParameters>]
```
