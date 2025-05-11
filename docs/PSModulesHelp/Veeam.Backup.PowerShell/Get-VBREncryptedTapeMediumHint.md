Get-VBREncryptedTapeMediumHint
------------------------------

### Synopsis
Returns password hints for encrypted backups stored on tapes.

---

### Description

This cmdlet returns password hints for encrypted backups stored on tapes.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example - Getting Password Hints for Encrypted Backups on Selected Tape

$tape = Get-VBRTapeMedium -Name "00110001"
Get-VBREncryptedTapeMediumHint -Medium $tape
This example shows how to get the password hints for encrypted backups on the 00110001 tape.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Get-VBREncryptedTapeMediumHint cmdlet. Set the $tape variable as the Medium parameter value.

---

### Parameters
#### **Medium**
Specifies the tape. The cmdlet will return the password hints for the media pool that contains this tape. Accepts the VBRTapeMedium[] object. To get this object, run the Get-VBRTapeMedium cmdlet.

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
Get-VBREncryptedTapeMediumHint -Medium <VBRTapeMedium[]> [<CommonParameters>]
```
