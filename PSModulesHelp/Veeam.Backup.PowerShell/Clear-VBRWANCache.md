Clear-VBRWANCache
-----------------

### Synopsis
Removes data from WAN accelerator global cache.

---

### Description

This cmdlet clears WAN accelerator global cache.
You may need to clear the global cache, for example, if the data gets corrupted.

---

### Examples
> Example 1

Get-VBRWANAccelerator -Name "WAN 01" | Clear-VBRWANCache
This example shows how to clear cache of the WAN 01 WAN accelerator.

Perform the following steps:
1. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Clear-VBRWANCache cmdlet.
> Example 2

$accelerator01 = Get-VBRWANAccelerator -Name "WAN 01"
Clear-VBRWANCache -Accelerator $accelerator01
This example shows how to clear cache of the WAN 01 WAN accelerator.

Perform the following steps:
1. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save the result to the $accelerator01 variable.
2. Run the Clear-VBRWANCache cmdlet. Set the $accelerator01 variable as the Accelerator parameter value.

---

### Parameters
#### **Accelerator**
Specifies the WAN accelerator. The cmdlet will clear cache of this accelerator.

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
Clear-VBRWANCache -Accelerator <CWanAccelerator> [<CommonParameters>]
```
