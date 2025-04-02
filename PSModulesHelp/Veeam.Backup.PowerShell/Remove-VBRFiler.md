Remove-VBRFiler
---------------

### Synopsis
Removes an enterprise NAS system added to the inventory.

---

### Description

This cmdlet removes an enterprise NAS system from the inventory.

---

### Related Links
* [Get-VBRFiler](Get-VBRFiler)

---

### Examples
> Removing Enterprise NAS System

$filer = Get-VBRFiler -Name "ontap-2"
Remove-VBRFiler -Filer $filer
This cmdlet removes an enterprise NAS system from the inventory.

Perform the following steps:
1. Run the Get-VBRFiler cmdlet. Specify the Name parameter value. Save the result to the $filer variable.
2. Run the Remove-VBRFiler cmdlet. Set the $filer variable to the Filer parameter.

---

### Parameters
#### **Filer**
Specifies an enterprise NAS system that you want to remove from the backup infrastructure. Accepts the VBRFiler[] object. To create this object, run the Get-VBRFiler cmdlet.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[VBRFiler[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFiler[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRFiler -Filer <VBRFiler[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
