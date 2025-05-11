Export-VBRTapeMedium
--------------------

### Synopsis
Moves tapes to Import/Export slot.

---

### Description

This cmdlet exports selected tapes to the Import/Export slot. You need to to run the exporting procedure if you want to take the tapes out of the tape library.

NOTE: Import/export commands are available only for the devices that support corresponding operations and include I/E slot.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example - Exporting Selected Tape

$tape = Get-VBRTapeMedium -Name "00170008"
Export-VBRTapeMedium -Medium $tape
This example shows how to export the 00170008 tape.

Perform the following steps:
1. Run Get-VBRTapeMedium to get the tape and save it to the $tape variable.
2. Run Export-VBRTapeMedium with this variable.

---

### Parameters
#### **Medium**
Specifies the array of tapes. The cmdlet will export these tapes. Accepts the VBRTapeMedium[] object, GUID or string. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Wait**
Defines that the command waits for the import sessions to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Export-VBRTapeMedium -Medium <VBRTapeMedium[]> [-Wait] [<CommonParameters>]
```
