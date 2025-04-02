Connect-VBRViVirtualLab
-----------------------

### Synopsis
Adds VMs to Veeam Backup & Replication.

---

### Description

This cmdlet adds VMs created on VMware to Veeam Backup & Replication.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Adding VM to Virtual Lab

$vm = Find-VBRViEntity -Name "Oracle05"
Connect-VBRViVirtualLab -VM $vm
This example shows how to add the Oracle05 VM created on VMware into Veeam Backup & Replication infrastructure.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Connect-VBRViVirtualLab cmdlet. Set the $vm variable as the VM parameter value.

---

### Parameters
#### **VM**
Specifies a VM that you want to add to Veeam Backup & Replication.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CViVmItem]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.Infrastructure.CViVmItem

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Connect-VBRViVirtualLab [-VM] <CViVmItem> [<CommonParameters>]
```
