Remove-VBRTapeLibrary
---------------------

### Synopsis
Removes a specified tape library from Veeam Backup & Replication.

---

### Description

This cmdlet removes a specified tape library from Veeam Backup & Replication.

When you remove a tape library, you stop managing it with your Veeam Backup & Replication console.

Before you remove a tape library, consider the following limitations:
- Only the libraries in the offline status can be removed. To remove a tape library, you need to physically disconnect it from the tape server first. Alternatively, you can remove the tape server to which the tape library is connected.
- You can remove the tape devices that are not used by any tape jobs. If any jobs are using the media pools assigned to the tape device, first redirect these jobs to other media pools.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Example 1 Removing Tape Library [Using Pipeline]

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Remove-VBRTapeLibrary
This example shows how to remove a tape library named HP MSL G3 Series 3.00.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRTapeLibrary cmdlet.
> Example 2 Removing Tape Library [Using Variable]

$SydneyTapeLibrary = Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00"
Remove-VBRTapeLibrary -Library $SydneyTapeLibrary
This example shows how to remove a tape library named HP MSL G3 Series 3.00.
Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Run the Remove-VBRTapeLibrary cmdlet. Set the $SydneyTapeLibrary variable as the Library parameter values.

---

### Parameters
#### **Library**
Specifies the array of tape libraries. The cmdlet will remove these tape libraries. Accepts the VBRTapeLibrary object.

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
Remove-VBRTapeLibrary -Library <VBRTapeLibrary[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
