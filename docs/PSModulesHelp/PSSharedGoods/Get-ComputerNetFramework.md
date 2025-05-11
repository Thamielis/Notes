Get-ComputerNetFramework
------------------------

### Synopsis
Get the installed .NET Framework version on a computer

---

### Description

Get the installed .NET Framework version on a computer

---

### Examples
> EXAMPLE 1

```PowerShell
$DCs = Get-ADDomainController -Filter * -Server 'ad.evotec.xyz'
Get-ComputerNetFramework -ComputerName $Dcs.HostName | Format-Table *
```

---

### Parameters
#### **ComputerName**
The name of the computer to check the .NET Framework version on

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-ComputerNetFramework [[-ComputerName] <String[]>] [<CommonParameters>]
```
