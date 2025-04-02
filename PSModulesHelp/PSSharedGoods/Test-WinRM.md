Test-WinRM
----------

### Synopsis
Tests the WinRM connectivity on the specified computers.

---

### Description

The Test-WinRM function tests the WinRM connectivity on the specified computers and returns the status of the connection.

---

### Examples
> EXAMPLE 1

```PowerShell
Test-WinRM -ComputerName "Server01", "Server02"
Tests the WinRM connectivity on Server01 and Server02.
```
> EXAMPLE 2

```PowerShell
Test-WinRM -ComputerName "Server03"
Tests the WinRM connectivity on Server03.
```

---

### Parameters
#### **ComputerName**
Specifies the names of the computers to test WinRM connectivity on.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |1       |false        |Server |

---

### Syntax
```PowerShell
Test-WinRM [[-ComputerName] <String[]>] [<CommonParameters>]
```
