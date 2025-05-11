Get-ComputerApplication
-----------------------

### Synopsis
Get software installed on computer or server

---

### Description

Get software installed on computer or server

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerApplications -Verbose | Format-Table
```
> EXAMPLE 2

```PowerShell
Get-ComputerApplications -Verbose -ComputerName AD1, AD2 | Format-Table
```

---

### Parameters
#### **ComputerName**
Specifies computer on which you want to run the operation.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-ComputerApplication [[-ComputerName] <String[]>] [<CommonParameters>]
```
