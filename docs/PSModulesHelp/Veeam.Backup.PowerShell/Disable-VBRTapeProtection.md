Disable-VBRTapeProtection
-------------------------

### Synopsis
Disables protection set for tapes.

---

### Description

This cmdlet disables protection that was previously enabled for tapes.

You can disable protection of tapes that are both online or offline. When you disable protection, the tape retention period returns to media pool settings.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example - Turning off Tape Protection

$tape = Get-VBRTapeMedium -Name "00140009","00140010"
Disable-VBRTapeProtection -Medium $tape
This example shows how to turn off protections for the tapes named 00140009 and 00140010.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Disable-VBRTapeProtection cmdlet. Set $tape variable as the Medium parameter value.

---

### Parameters
#### **Medium**
Specifies the array of protected tapes. The cmdlet will disable protection for these tapes. Accepts the VBRTapeMedium object, GUID or string type.  To get this object, run the Get-VBRTapeMedium cmdlet.

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
Disable-VBRTapeProtection -Medium <VBRTapeMedium[]> [-PassThru] [<CommonParameters>]
```
