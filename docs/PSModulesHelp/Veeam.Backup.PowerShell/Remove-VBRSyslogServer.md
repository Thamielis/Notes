Remove-VBRSyslogServer
----------------------

### Synopsis
Removes the syslog server.
NOTE: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet modifies the syslog server added to Veeam Backup & Replication.

---

### Related Links
* [Get-VBRSyslogServer](Get-VBRSyslogServer)

---

### Examples
> Removing Syslog Server from Veeam Backup & Replication

$server = Get-VBRSyslogServer
Remove-VBRSyslogServer -Server $server
This example shows how to remove the existing syslog server.
Perform the following steps:
1. Run the Get-VBRSyslogServer cmdlet. Save the result to the $server variable.
2. Run the Remove-VBRSyslogServer cmdlet. Set the $server variable as the Server parameter value.

---

### Parameters
#### **Server**
Specifies the syslog server you want to remove.

|Type               |Required|Position|PipelineInput |
|-------------------|--------|--------|--------------|
|`[VBRSyslogServer]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSyslogServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRSyslogServer -Server <VBRSyslogServer> [<CommonParameters>]
```
