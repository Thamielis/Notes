Add-NimbleSnapshot
------------------

### Synopsis
Creates HPE Nimble storage snapshots.

---

### Description

This cmdlet creates a snapshot of a selected HPE Nimble storage volume.

---

### Examples
> Example 1

$storage = Get-NimbleHost -Name "HPE Nimble-FC"
$volume = Get-NimbleVolume -Host $storage -Name "VOL01"
Add-NimbleSnapshot -Volume $volume -Name "DailySnapshot01"
This example shows how to create a volume snapshot.

Perform the following steps:
1. Run the Get-NimbleHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-NimbleVolume cmdlet. Set the $storage variable as the Host parameter value. Specify the Name parameter value. Save the result to the $volume variable.
3. Run the Add-NimbleSnapshot cmdlet. Set the $volume variable as the Volume parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the name you want to assign to the snapshot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Volume**
Specifies the storage volume for which you want to take snapshot.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CSanVolume]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanVolume

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-NimbleSnapshot [-Name <String>] -Volume <CSanVolume> [<CommonParameters>]
```
