Get-ComputerWindowsUpdates
--------------------------

### Synopsis
Retrieves information about Windows updates installed on specified computers.

---

### Description

This function retrieves details about Windows updates installed on one or more computers specified by the ComputerName parameter.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerWindowsUpdates -ComputerName "EVOWIN", "AD1"
Retrieves Windows update information for computers named "EVOWIN" and "AD1".
```

---

### Parameters
#### **ComputerName**
Specifies the name of the computer(s) to retrieve Windows update information for.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Notes
This function uses the Get-HotFix cmdlet to gather information about Windows updates.

---

### Syntax
```PowerShell
Get-ComputerWindowsUpdates [[-ComputerName] <String[]>] [<CommonParameters>]
```
