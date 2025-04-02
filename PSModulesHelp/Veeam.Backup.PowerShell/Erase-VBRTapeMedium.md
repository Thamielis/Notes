Erase-VBRTapeMedium
-------------------

### Synopsis
Erases data from tape.

---

### Description

This cmdlet erases data from the selected tapes. The erased tapes are moved to the Free media pool.

The cmdlet provides two scenarios for erasing options:
- Short: only the tape data header is cleared. The tape becomes available for overwriting. Short erase is a quick procedure.
- Long: all data is cleared from tape. This procedure requires more time.
You cannot run erase for the following tapes:
- Offline tapes
- Tapes used by any jobs
- Tapes with software or hardware protection.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example 1. Running Short Erase on Selected Tape

$tape = Get-VBRTapeMedium -Name "00170010"
Erase-VBRTapeMedium -Medium $tape
This example shows how to run short erase on the 00170010 tape.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Erase-VBRTapeMedium cmdlet. Set the $tape variable as the Medium parameter value.
> Example 2. Running Long Erase on Selected Tape

$tape = Get-VBRTapeMedium -Name "00170010"
Erase-VBRTapeMedium -Medium $tape -Long
This example shows how to run long erase on the 00170010 tape.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Erase-VBRTapeMedium cmdlet. Set the $tape variable as the Medium parameter value. Provide the Long parameter.

---

### Parameters
#### **Long**
Defines that the cmdlet will perform the long (full) erase. Default: short erase.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Medium**
Specifies the array of tapes. The cmdlet will erase these tapes. Accepts the VBRTapeMedium[] object, GUID or string. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Wait**
Defines that the command waits for the erase process(es) to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Erase-VBRTapeMedium [-Long] -Medium <VBRTapeMedium[]> [-Wait] [-Confirm] [-WhatIf] [<CommonParameters>]
```
