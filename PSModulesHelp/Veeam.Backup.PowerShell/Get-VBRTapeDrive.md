Get-VBRTapeDrive
----------------

### Synopsis
Returns tape drives.

---

### Description

This cmdlet returns tape recording drives. You can also view the model name, the state of the drive and whether it is enabled or disabled.

---

### Related Links
* [Get-VBRTapeLibrary](Get-VBRTapeLibrary)

---

### Examples
> Example 1 Getting Drives of Selected Library [Using Pipeline]

Get-VBRTapeLibrary -Name "HP MSL G3 Series 3.00" | Get-VBRTapeDrive
This example shows how to get drives of the HP MSL G3 Series 3.00 library.

Perform the following steps:
1. Run the Get-VBRTapeLibrary cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRTapeDrive cmdlet.
> Example 2 Getting Drive by Name

```PowerShell
Get-VBRTapeDrive -Name "Drive1"
This command looks for a tape drive named "Drive1".
```

---

### Parameters
#### **Address**
Specifies the array of drive addresses (slot numbers). The cmdlet will return drives in these slots.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[Int32[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the array of drive IDs. The cmdlet will return drives with these IDs. Accepts GUID or string.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Library**
Specifies the tape library. The cmdlet will return drives that belong to this library.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRTapeLibrary]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of tape drive names. The cmdlet will return drives with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRTapeLibrary

System.String[]

System.Guid[]

System.Int32[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRTapeDrive -Address <Int32[]> [<CommonParameters>]
```
```PowerShell
Get-VBRTapeDrive [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeDrive [-Library <VBRTapeLibrary>] [<CommonParameters>]
```
```PowerShell
Get-VBRTapeDrive [-Name <String[]>] [<CommonParameters>]
```
