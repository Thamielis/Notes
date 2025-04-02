Set-VBRTapeLibrary
------------------

### Synopsis
Modifies a tape library.

---

### Description

This cmdlet modifies the name of the selected tape library.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Example 1 Modifying Tape Library Name [Using Pipeline]

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Set-VBRTapeLibrary -Name "New York Remote Tape" -PassThru
Drives       : {Tape0, Tape1}
Enabled      : True
Model        : MSL G3 Series
Slots        : 24
TapeServerId : 00000000-0000-0000-0000-000000000000
Type         : Automated
State        : Online
Id           : 2f1fdc3c-8a97-4fa0-b631-74a039e64d5c
Name         : New York Remote Tape
Description  : New York office Tape Library
This example shows how to modify the name of the tape library named HP MSL G3 Series 3.00 to New York Remote Tape.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRTapeLibrary cmdlet. Specify the Name parameter value. Provide the PassThru parameter.
> Example 2 Modifying Tape Library Name [Using Variable]

$tapelibrary = Get-VBRTapeLibrary -Name "US Remote Tape" 
Set-VBRTapeLibrary -TapeLibrary $tapelibrary -Name "New York Remote Tape"
This example shows how to modify the name of the US Remote Tape tape library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value. Save the result to the $tapelibrary variable.
2. Run the Set-VBRTapeLibrary cmdlet. Set the $tapelibrary variable as the TapeLibrary parameter values. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the new name you want to assign to the library.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TapeLibrary**
Specifies the tape library you want to modify. Accepts the VBRTapeLibrary object.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeLibrary

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRTapeLibrary -Name <String> [-PassThru] -TapeLibrary <VBRTapeLibrary> [<CommonParameters>]
```
