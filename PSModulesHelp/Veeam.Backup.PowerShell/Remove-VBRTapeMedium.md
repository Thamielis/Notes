Remove-VBRTapeMedium
--------------------

### Synopsis
Removes the selected tapes from tape catalog.

---

### Description

This cmdlet removes the selected tapes and the data written to the tapes from the tape catalog and Veeam backup database.

NOTE:
- You can remove only offline tapes.
- You cannot remove protected tapes.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example - Removing Tape from the Tape Catalog and Backup Database

$tape = Get-VBRTapeMedium -Name SWOHC001
Remove-VBRTapeMedium -Medium $tape
This example shows how to remove the tape SWOHC001 from the tape catalog and Veeam backup database.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save it to the $tape variable.
2. Run the Remove-VBRTapeMedium cmdlet. Set the $tape variable as the Medium parameter value.

---

### Parameters
#### **FromVault**
Defines that the cmdlet will remove the tape from the vault.
Note that the tape will not be removed from the tape catalog.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Medium**
Specifies the tapes you want to remove. Accepts the VBRTapeMedium[] object.  To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRTapeMedium[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRTapeMedium [-FromVault] -Medium <VBRTapeMedium[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
