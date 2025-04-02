Remove-VBRWANAccelerator
------------------------

### Synopsis
Removes a WAN accelerator.

---

### Description

This cmdlet removes the selected WAN accelerator.
When you remove a WAN accelerator, Veeam Backup & Replication unassigns the accelerator role from the server, so it is no longer used as a WAN accelerator. The actual server remains connected to Veeam Backup & Replication.

---

### Examples
> Example 1

```PowerShell
Get-VBRWANAccelerator -Name "WANAccelerator 1" | Remove-VBRWANAccelerator
This command removes the WAN Accelerator named "WANAccelerator 1". The accelerator is obtained with Get-VBRWANAccelerator and piped down.
```
> Example 2

$a = Get-VBRWANAccelerator -Name "WANAccelerator 1"
Remove-VBRWANAccelerator -Accelerator $a
This example shows how to remove the WAN Accelerator named WANAccelerator 1.

Perform the following steps:
1. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save the result to the $a variable.
2. Run the Remove-VBRWANAccelerator cmdlet. Set the $a variable as the Accelerator parameter value.

---

### Parameters
#### **Accelerator**
Specifies the WAN accelerator you want to remove.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[CWanAccelerator]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CWanAccelerator

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRWANAccelerator -Accelerator <CWanAccelerator> [<CommonParameters>]
```
