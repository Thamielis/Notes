Get-ComputerRDP
---------------

### Synopsis
Retrieves Remote Desktop Protocol (RDP) settings for a specified computer.

---

### Description

This function retrieves RDP settings for a specified computer using the Win32_TSGeneralSetting class.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerRDP -ComputerName "Computer01"
Retrieves RDP settings for a computer named "Computer01".
```
> EXAMPLE 2

```PowerShell
Get-ComputerRDP -ComputerName "Computer02", "Computer03"
Retrieves RDP settings for multiple computers named "Computer02" and "Computer03".
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer to retrieve RDP settings for.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-ComputerRDP [[-ComputerName] <String[]>] [<CommonParameters>]
```
