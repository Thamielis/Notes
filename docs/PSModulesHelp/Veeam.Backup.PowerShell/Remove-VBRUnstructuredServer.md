Remove-VBRUnstructuredServer
----------------------------

### Synopsis
Removes unstructured data sources from the inventory.

---

### Description

This cmdlet removes unstructured data sources from the inventory.

---

### Related Links
* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

---

### Examples
> Example 1. Removing all Unstructured Data Sources

$server = Get-VBRUnstructuredServer
Remove-VBRUnstructuredServer -Server $server
This example shows how to remove all unstructured data sources from the inventory.

Perform the following steps:
1. Run the Get-VBRUnstructuredServer cmdlet. Save the result to the $server variable.
2. Run the Remove-VBRUnstructuredServer cmdlet. Set the $server variable as the Server parameter value.
> Example 2. Removing Certain File Share from Inventory

$fileshare = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Documents"
Remove-VBRUnstructuredServer -Server $fileshare -Confirm
This example shows how to remove all unstructured data sources from the inventory.

Perform the following steps:
1. Run the Get-VBRUnstructuredServer cmdlet. Save the result to the $fileshare variable.
2. Run the Remove-VBRUnstructuredServer cmdlet. Set the $fileshare variable as the Server parameter value. Specify the Confirm parameter.

---

### Parameters
#### **Server**
Specifies an array of unstructured data sources. The cmdlet will remove these unstructured data sources from the inventory. Accepts the VBRUnstructuredServer[] object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredServer[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRUnstructuredServer[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRUnstructuredServer -Server <VBRUnstructuredServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
