Start-VBRTapeInventory
----------------------

### Synopsis
Starts tape inventory.

---

### Description

This cmdlet starts inventory process.

You can run inventory job for selected libraries or for selected tapes.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example 1 Inventorying Selected Library [Using Pipeline]

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Start-VBRTapeInventory
This example shows how to inventory a library.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Start-VBRTapeInventory cmdlet.
> Example 2 Inventorying Selected Tapes [Using Variable]

$tape = Get-VBRTapeMedium -Name "00140009","00140010"
Start-VBRTapeInventory -Medium $tape
This example shows how to inventory selected tapes.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Start-VBRTapeInventory cmdlet. Set the $tape variable as the Medium parameter value.

---

### Parameters
#### **Library**
Specifies the array of tape libraries. The cmdlet will inventory these tape libraries. Accepts the VBRTapeLibrary[] object, GUID or string.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Medium**
Specifies the array of tapes. The cmdlet will inventory these tapes. Accepts the VBRTapeMedium[] object, GUID or string.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Wait**
Defines that the command waits for the process to complete before accepting more input.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeLibrary[]

Veeam.Backup.PowerShell.Infos.VBRTapeMedium[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRTapeInventory -Library <VBRTapeLibrary[]> [-Wait] [<CommonParameters>]
```
```PowerShell
Start-VBRTapeInventory -Medium <VBRTapeMedium[]> [-Wait] [<CommonParameters>]
```
