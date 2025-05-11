Remove-VBRVMExclusion
---------------------

### Synopsis
Removes global VM exclusions.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet removes global exclusions.

---

### Related Links
* [Get-VBRVMExclusion](Get-VBRVMExclusion)

---

### Examples
> Removing Global VM Exclusion

$excl = Get-VBRVMExclusion -Name "ubuntusrv20"          
Remove-VBRVMExclusion -Exclusion $excl
This example shows how to add a note to the exclusion for the ubuntusrv20 VM.
Perform the following steps:
1. Run the Get-VBRVMExclusion cmdlet. Specify the Name parameter value. Save the result to the $excl variable.
2. Run the Set-VBRVMExclusion cmdlet. Set the $excl variable as the Exclusion parameter value.

---

### Parameters
#### **Exclusion**
Specifies global VM exclusions that you want to remove.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRVMExclusion[]]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRVMExclusion[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRVMExclusion [-Exclusion] <VBRVMExclusion[]> [<CommonParameters>]
```
