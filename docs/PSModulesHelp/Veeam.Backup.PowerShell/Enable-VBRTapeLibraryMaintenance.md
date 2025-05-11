Enable-VBRTapeLibraryMaintenance
--------------------------------

### Synopsis
Enables the Maintenance mode for a tape library or a standalone tape drive.

---

### Description

The cmdlet enables the Maintenance mode for a tape library or a standalone tape drive.

You can run this cmdlet to lock a tape library or a standalone tape drive so that Veeam Backup & Replication will not be able to use them for tape jobs. This action might be necessary in case you want to provide maintenance services to them.

Run the Disable-VBRTapeLibraryMaintenance cmdlet to disable the Maintenance mode.

NOTE

Before you enable the Maintenance mode for the tape library, consider the following:
- You cannot enable the maintenance mode for the tape library if the jobs that use this tape library are in the running state.
- After you enable the maintenance mode for the tape library, all jobs that use it will fail with an error when starting.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Enabling Maintenance Mode for Tape Library

$library = Get-VBRTapeLibrary -Name "HP MSL G3 Series 5.30"
Enable-VBRTapeLibraryMaintenance -Library $library
This example shows how to enable the maintenance mode for the HP MSL G3 Series 5.30 tape library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save the result to the $library variable.
2. Run the Enable-VBRTapeLibraryMaintenance cmdlet. Set the $library variable as the Library parameter value.

---

### Parameters
#### **Library**
Specifies an array of tape libraries. The cmdlet will enable the Maintenance mode for this array of tape libraries. Accepts the VBRTapeLibrary[] object. To get this object, run the Get-VBRTapeLibrary cmdlet.

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
Enable-VBRTapeLibraryMaintenance -Library <VBRTapeLibrary[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
