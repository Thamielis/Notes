Add-VBRVMExclusion
------------------

### Synopsis
Adds VMs to global VM exclusions.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet adds VMs to global VM exclusions. Veeam Backup & Replication stops processing such VMs even if they are included in jobs.
Note: Global VM exclusion applies only to jobs where the sources are production VMs.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

---

### Examples
> Excluding VMware vSphere VM from Processing

$vm = Find-VBRViEntity -VMsAndTemplates -Name "ubuntu88"        
Add-VBRVMExclusion -Entity $vm
This example shows how to exclude the ubuntu88 VMware vSphere VM from processing.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Provide the VMsAndTemplates parameter. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Add-VBRVMExclusion cmdlet. Set the $vm variable as the Entity parameter value.

---

### Parameters
#### **Entity**
Specifies the VMs which you want to exclude from processing.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Note**
Specifies a note why the VM is excluded from processing.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |True (ByPropertyName)|

---

### Inputs
System.Object[]

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRVMExclusion [-Entity] <Object[]> [-Note <String>] [<CommonParameters>]
```
