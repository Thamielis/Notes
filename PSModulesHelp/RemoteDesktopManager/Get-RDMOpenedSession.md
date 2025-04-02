Get-RDMOpenedSession
--------------------

### Synopsis
Retrieve the list of opened sessions of the current data source.

---

### Description

Retrieve the list of opened sessions. of the current data source

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> $list = Get-RDMOpenedSession
Retrieves the list of available data sources of the current data source.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMOpenedSession; $list[0]
Retrieves the list of the opened sessions and displays the first item.
```

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection

---

### Notes
For more information, type "Get-Help Get-RDMOpenedSession -detailed". For technical information, type "Get-Help Get-RDMOpenedSession -full".

---
