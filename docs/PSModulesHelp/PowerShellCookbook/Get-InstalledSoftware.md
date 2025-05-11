Get-InstalledSoftware
---------------------

### Synopsis
Lists installed software on the current computer.

---

### Description

---

### Examples
> EXAMPLE 1

Get-InstalledSoftware *Frame* | Select DisplayName
DisplayName
-----------
Microsoft .NET Framework 3.5 SP1
Microsoft .NET Framework 3.5 SP1
Hotfix for Microsoft .NET Framework 3.5 SP1 (KB953595)
Hotfix for Microsoft .NET Framework 3.5 SP1 (KB958484)
Update for Microsoft .NET Framework 3.5 SP1 (KB963707)

---

### Parameters
#### **DisplayName**
The name of the software to search for

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-InstalledSoftware [[-DisplayName] <Object>] [<CommonParameters>]
```
