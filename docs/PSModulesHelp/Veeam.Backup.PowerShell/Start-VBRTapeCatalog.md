Start-VBRTapeCatalog
--------------------

### Synopsis
Starts tape catalog process.

---

### Description

This cmdlet starts catalog process.

Catalog process scans tape contents and registers tapes in the Veeam Backup & Replication database after which Veeam Backup & Replication is able to administrate tape allocation and consumption and track data written to tapes.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

* [Get-VBRTapeMedium](Get-VBRTapeMedium)

---

### Examples
> Example 1 Cataloging Selected Library [Using Pipeline]

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Start-VBRTapeCatalog
This example shows how to catalog a selected library.
Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Start-VBRTapeCatalog cmdlet.
> Example 2 Cataloging Selected Tapes [Using Variable]

$tape = Get-VBRTapeMedium -Name "00140009","00140010"
Start-VBRTapeCatalog -Medium $tape
This example shows how to catalog selected tapes.

Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save the result to the $tape variable.
2. Run the Start-VBRTapeCatalog cmdlet. Set the $tape variable as the Medium parameter value.

---

### Parameters
#### **Library**
Specifies the array of tape libraries. The cmdlet will catalog these tape libraries. Accepts the VBRTapeLibrary[] object, GUID or string.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Medium**
Specifies the array of tapes. The cmdlet will catalog these tapes. Accepts the VBRTapeMedium[] object, GUID or string.

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
Start-VBRTapeCatalog -Library <VBRTapeLibrary[]> [-Wait] [<CommonParameters>]
```
```PowerShell
Start-VBRTapeCatalog -Medium <VBRTapeMedium[]> [-Wait] [<CommonParameters>]
```
