Import-VBRTapeMedium
--------------------

### Synopsis
Imports tapes into library.

---

### Description

This cmdlet imports tapes newly loaded to a tape library.

You need to run importing procedure against all new tapes. Importing moves tapes from I/E slot to library standard slots.

NOTE: Import/export commands are available only for the devices that support corresponding operations and include I/E slot.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Example 1. Importing Tapes into Tape Library

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Import-VBRTapeMedium
This example shows how to import tapes to the HP MSL G3 Series 3.00 tape library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Import-VBRTapeMedium cmdlet.
> Example 2. Importing Tapes into Tape Library [Using Variable]

$library = Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00"
Import-VBRTapeMedium -Library $library
This example shows how to import tapes to the HP MSL G3 Series 3.00 tape library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save the result to the $library variable.
2. Run the Get-VBRTapeLibrary cmdlet. Set the $library variable as the Library parameter value.

---

### Parameters
#### **Library**
Specifies the library from which you want to import tapes. Accepts the VBRTapeLibrary[] object, GUID or string. To get this object, run the Get-VBRTapeLibrary cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Wait**
Defines that the command waits for the import sessions to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Import-VBRTapeMedium -Library <VBRTapeLibrary[]> [-Wait] [<CommonParameters>]
```
