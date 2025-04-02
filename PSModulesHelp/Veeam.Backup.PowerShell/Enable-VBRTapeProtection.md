Enable-VBRTapeProtection
------------------------

### Synopsis
Sets overwrite protection for selected tapes.

---

### Description

This cmdlet sets software overwrite protection for selected tapes.

Protection overrides the retention settings of the media pool to set a lifelong retention period for the selected tapes.

You can set protection for both online or offline tapes that contain data.

The protection can be switched off at any time. The retention settings will be changed to the value set for the media pool.

Run the Disable-VBRTapeProtection cmdlet to switch off the protection.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example -  Overwrite Protection to Selected Tape

$tape = Get-VBRTapeMedium -Name "00140009"
Enable-VBRTapeProtection -Medium $tape -PassThru
This example shows how to set protection for the tape named 00140009.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Enable-VBRTapeProtection cmdlet. Set the $tape variable as the Medium parameter value. Provide the PassThru parameter.

---

### Parameters
#### **Medium**
Specifies the array of tapes. The cmdlet will set protection to these tapes. Accepts the VBRTapeMedium[] object, GUID or string. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

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
Enable-VBRTapeProtection -Medium <VBRTapeMedium[]> [-PassThru] [<CommonParameters>]
```
