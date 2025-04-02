Get-VBRTapeRestoreAllContentDependentMedium
-------------------------------------------

### Synopsis
Returns dependent tapes.

---

### Description

This cmdlet returns dependent tapes that store other parts of the backup. You may want to run this cmdlet before you start the Start-VBRTapeCopy cmdlet, to get information on the dependent tapes. When a backup file does not fit on one tape, it is divided into parts and written to several tapes. These tapes are considered dependent.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Getting Dependent Tapes for Specified Tape

$tape = Get-VBRTapeMedium -Name "0021000C"
Get-VBRTapeRestoreAllContentDependentMedium -Medium $tape
This example shows how to get tapes that are dependent on the 0021000C tape.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Get-VBRTapeRestoreAllContentDependentMedium cmdlet. Set the $tape variable as the Medium parameter value.

---

### Parameters
#### **Medium**
Specifies an array of tapes. The cmdlet will return dependent tapes for the tapes from this array.  Accepts the VBRTapeMedium[] object. To create this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRTapeMedium[]]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRTapeRestoreAllContentDependentMedium -Medium <VBRTapeMedium[]> [<CommonParameters>]
```
