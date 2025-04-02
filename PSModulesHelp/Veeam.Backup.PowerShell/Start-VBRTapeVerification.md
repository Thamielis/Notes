Start-VBRTapeVerification
-------------------------

### Synopsis
Starts tape verification jobs.

---

### Description

This cmdlet starts tape verification jobs.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Starting Tape Verification Job

$tape = Get-VBRTapeMedium -Name "0021000C"
Start-VBRTapeVerification -Medium $tape
This example shows how to start a tape verification job that will check data that is stored on the 0021000C tape.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Start-VBRTapeVerification cmdlet. Set the $tape variable as the Medium parameter value.

---

### Parameters
#### **Medium**
Specifies an array of tapes. The cmdlet will add this array of tapes to the tape verification job. Accepts the VBRTapeMedium[] object. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Start-VBRTapeVerification -Medium <VBRTapeMedium[]> [<CommonParameters>]
```
