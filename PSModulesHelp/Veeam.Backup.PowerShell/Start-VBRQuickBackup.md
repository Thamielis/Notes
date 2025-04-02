Start-VBRQuickBackup
--------------------

### Synopsis
Performs quick backup.

---

### Description

This cmdlet starts quick backup for a selected VMs.

---

### Related Links
* [Find-VBRViEntity](Find-VBRViEntity)

* [Find-VBRHvEntity](Find-VBRHvEntity)

---

### Examples
> Example 1. Starting QuickBackup for Single VM

$VM = Find-VBRViEntity -Name "SQL_Database"
Start-VBRQuickBackup -VM $VM
This example shows how to start quick backup for the SQL_Database VM.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $VM variable.
2. Run the Start-VBRQuickBackup cmdlet. Set the $VM variable as the VM parameter value.
> Example 2. Starting QuickBackup for Group of VMs

$VMs = @()
$VMs += Find-VBRViEntity -Name "VM01"
$VMs += Find-VBRViEntity -Name "VM02"
Start-VBRQuickBackup -VM $VMs
This example shows how to start quick backup for a group of VMs.
Perform the following steps:
1. Create an empty array. Declare the VMs variable and assign the @() to it.
2. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Use the += operator to save the result to the $VMs variable.
3. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Use the += operator to save the result to the $VMs variable.
4. Run the Start-VBRQuickBackup cmdlet. Set the $VMs variable as the VM parameter value.

---

### Parameters
#### **VM**
Specifies the array of VMs for which you want to perform the QuickBackup. You can add VMware or Hyper-V VMs.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[IVmItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Wait**
Defines that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.IVmItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRQuickBackup -VM <IVmItem[]> [-Wait] [<CommonParameters>]
```
