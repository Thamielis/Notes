Get-ComputerFirewall
--------------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
$Data = Get-ComputerFirewall
$Data | Format-Table -AutoSize
```
> EXAMPLE 2

```PowerShell
$Data = Get-ComputerFirewall
$Data | Out-HtmlView -ScrollX -Filtering -Title "Firewall Rules" -DataStore JavaScript
```

---

### Parameters
#### **ComputerName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-ComputerFirewall [[-ComputerName] <String>] [<CommonParameters>]
```
