Remove-VBRLocation
------------------

### Synopsis
Removes geographic locations from Veeam Backup & Replication.

---

### Description

This cmdlet removes geographic locations from Veeam Backup & Replication.

---

### Related Links
* [Get-VBRLocation](Get-VBRLocation)

---

### Examples
> Example 1. Removing Selected Geographic Location

$location = Get-VBRLocation -Name "Sacramento"
Remove-VBRLocation -Location $location
This example shows how to remove a selected geographic location from Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRLocation cmdlet. Specify the Name parameter value. Save the result to the $location variable.
2. Run the Remove-VBRLocation cmdlet. Set the $location variable as the Location parameter value.
> Example 2. Removing Several Geographic Locations

$locations = Get-VBRLocation -Name North*
Remove-VBRLocation -Location $locations
This example shows how to remove several geographic locations from Veeam Backup & Replication.
Perform the following steps:
1. Run the Get-VBRLocation cmdlet. Specify the Name parameter value. Save the result to the $locations variable.
2. Run the Remove-VBRLocation cmdlet. Set the $locations variable as the Location parameter value.

---

### Parameters
#### **Location**
Specifies the array of locations you want to remove.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRLocation[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRLocation[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRLocation -Location <VBRLocation[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
