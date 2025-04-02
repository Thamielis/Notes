Set-VBRTapeServer
-----------------

### Synopsis
Modifies tape servers.

---

### Description

This cmdlet modifies tape server that was created before.

---

### Related Links
* [Get-VBRTapeServer](Get-VBRTapeServer)

---

### Examples
> Example 1 Modifying Description of Tape Server [Using Variable]

$tapeserver = Get-VBRTapeServer -Name "Sydney_Tape_Server"
Set-VBRTapeServer -TapeServer $tapeserver -Description "Sydney_Remote_Tape_Server"
This example shows how to modify the description of the Sydney_Tape_Server tape server.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $tapeserver variable.
2. Run the Set-VBRTapeServer cmdlet. Set the $tapeserver variable as the TapeServer parameter value. Specify the Description parameter value.
> Example 2 Modifying Description of Tape Server [Using Pipeline]

Get-VBRTapeServer -Name "Sydney_Tape_Server" | Set-VBRTapeServer -Description "Sydney_Remote_Tape_Server" -PassThru
This example shows how to modify the description of the Sydney_Tape_Server tape server.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Set-VBRTapeServer cmdlet. Specify the Description parameter value. Provide the PassThru parameter.

---

### Parameters
#### **Description**
Specifies the new description you want to apply to the tape server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TapeServer**
Specifies the tape server you want to modify.  Accepts the VBRTapeServer object.

|Type             |Required|Position|PipelineInput                 |
|-----------------|--------|--------|------------------------------|
|`[VBRTapeServer]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeServer

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRTapeServer [-Description <String>] [-PassThru] -TapeServer <VBRTapeServer> [<CommonParameters>]
```
