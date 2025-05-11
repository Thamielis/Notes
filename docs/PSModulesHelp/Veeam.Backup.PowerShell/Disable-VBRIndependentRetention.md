Disable-VBRIndependentRetention
-------------------------------

### Synopsis
Disables background retention for backups.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet disables background retention for backups that starts automatically every 24 hours at 00:30.
Run the Enable-VBRIndependentRetention cmdlet to enable background retention policy.
The Disable-VBRBackgroundRetention cmdlet is an alias for the Disable-VBRIndependentRetention cmdlet.

---

### Examples
> Disabling Background Retention for Backups

```PowerShell
Disable-VBRIndependentRetention
This command disables background retention for backups.
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
Disable-VBRIndependentRetention [<CommonParameters>]
```
