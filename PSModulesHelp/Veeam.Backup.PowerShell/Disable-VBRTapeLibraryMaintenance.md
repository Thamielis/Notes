Disable-VBRTapeLibraryMaintenance
---------------------------------

### Synopsis
Disables the Maintenance mode for a tape library or a standalone tape drive.

---

### Description

The cmdlet disables the Maintenance mode for a tape library or a standalone tape drive. Run the Enable-VBRTapeLibraryMaintenance cmdlet to enable the maintenance mode for a tape library or a standalone tape drive.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Disabling Maintenance Mode for Tape Library

$library = Get-VBRTapeLibrary -Name "HP MSL G3 Series 5.30"
Disable-VBRTapeLibraryMaintenance -Library $library
This example shows how to disable the maintenance mode for the HP MSL G3 Series 5.30 tape library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save the result to the $library variable.
2. Run the Disable-VBRTapeLibraryMaintenance cmdlet. Set the $library variable as the Library parameter value.

---

### Parameters
#### **Library**
Specifies an array of tape libraries. The cmdlet will disable the Maintenance mode for this array of tape libraries. Accepts the VBRTapeLibrary[] object. To get this object, run the Get-VBRTapeLibrary cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRTapeLibrary[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRTapeLibraryMaintenance -Library <VBRTapeLibrary[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
