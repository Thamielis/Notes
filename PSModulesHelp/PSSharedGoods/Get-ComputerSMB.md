Get-ComputerSMB
---------------

### Synopsis
Retrieves SMB server configuration details for a specified computer.

---

### Description

This function retrieves the SMB server configuration details for a specified computer.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerSMB -ComputerName "Server01"
Retrieves the SMB server configuration details for the computer named "Server01".
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer for which to retrieve SMB server configuration details.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Notes
This function requires administrative privileges to retrieve SMB server configuration details.

---

### Syntax
```PowerShell
Get-ComputerSMB [[-ComputerName] <String[]>] [<CommonParameters>]
```
