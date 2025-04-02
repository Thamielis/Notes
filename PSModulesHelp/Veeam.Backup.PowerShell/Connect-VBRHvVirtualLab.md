Connect-VBRHvVirtualLab
-----------------------

### Synopsis
Adds VMs to Veeam Backup & Replication.

---

### Description

This cmdlet adds VMs created on Hyper-V to Veeam Backup & Replication.

---

### Related Links
* [Find-VBRHvEntity](Find-VBRHvEntity)

---

### Examples
> Adding VM to Virtual Lab

$vm = Find-VBRHvEntity -Name "srv99"
Connect-VBRHvVirtualLab -VM $vm
This example shows how to add the srv99 VM into Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Find-VBRHvEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Connect-VBRHvVirtualLab cmdlet. Set the $vm variable as the VM parameter value.

---

### Parameters
#### **VM**
Specifies a VM that you want to add to Veeam Backup & Replication.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CHvVmItem]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.HyperV.Infrastructure.CHvVmItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VBRHvVirtualLab [-VM] <CHvVmItem> [<CommonParameters>]
```
