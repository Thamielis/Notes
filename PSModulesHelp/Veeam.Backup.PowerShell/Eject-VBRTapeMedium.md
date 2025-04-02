Eject-VBRTapeMedium
-------------------

### Synopsis
Ejects tapes from drive.

---

### Description

This cmdlet ejects tape that is located in drive. The ejected tape is moved to a standard library slot.

---

### Related Links
* [Get-VBRTapeMedium](Get-VBRTapeMedium)

* [Get-VBRTapeDrive](Get-VBRTapeDrive)

---

### Examples
> Example - Ejecting Selected Tape

$tape = Get-VBRTapeMedium -Name "00140009"
Eject-VBRTapeMedium -Medium $tape
This example shows how to eject tape named 00140009.
Perform the following steps:
1. Run the Get-VBRTapeMedium cmdlet. Specify the Name parameter value. Save it to the $tape variable.
2. Run the Eject-VBRTapeMedium cmdlet. Set the $tape variable as the Medium parameter value.

---

### Parameters
#### **Drive**
Specifies the array of drives. The cmdlet will eject tapes from these drives. Accepts the VBRTapeDrive[] object, GUID or string. To get this object, run the Get-VBRTapeMedium cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeDrive[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Medium**
Specifies the array of drives. The cmdlet will eject tapes from these drives. Accepts the VBRTapeMedium[] object, GUID or string. To get this object, run the Get-VBRTapeDrive cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRTapeMedium[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeMedium[]

Veeam.Backup.PowerShell.Infos.VBRTapeDrive[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Eject-VBRTapeMedium -Drive <VBRTapeDrive[]> [<CommonParameters>]
```
```PowerShell
Eject-VBRTapeMedium -Medium <VBRTapeMedium[]> [<CommonParameters>]
```
