Get-VBRWANAccelerator
---------------------

### Synopsis
Returns WAN accelerators.

---

### Description

This cmdlet gets WAN accelerators managed by Veeam Backup & Replication.
WAN accelerator is an architecture component that optimizes file transfer via WAN by means of data deduplication. The role of a WAN accelerator can be assigned to a dedicated Windows-based machine (physical or virtual). For best performance you should set a WAN accelerator on both source and target sides.
You can get the list of all WAN accelerators, or search for instances directly by name.

---

### Examples
> Example 1

```PowerShell
Get-VBRWANAccelerator
This command looks for the list of all WAN accelerators.
```
> Example 2

```PowerShell
Get-VBRWANAccelerator -Name WAN*
This command looks for WAN accelerators with the names starting with "WAN".
```

---

### Parameters
#### **Name**
Specifies the array of WAN accelerator names.
The cmdlet will return WAN accelerators with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes
WAN optimization is available only in Veeam Backup & Replication Enterprise Plus Edition.

---

### Syntax
```PowerShell
Get-VBRWANAccelerator [-Name <String[]>] [<CommonParameters>]
```
