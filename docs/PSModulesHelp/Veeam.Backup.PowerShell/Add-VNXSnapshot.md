Add-VNXSnapshot
---------------

### Synopsis
Creates Dell VNX storage snapshots.

---

### Description

This cmdlet creates a snapshot of a selected Dell VNX storage volume.

---

### Examples
> Example 1

$storage = Get-VNXHost -Name "VNX Storage"
$volume = Get-VNXVolume -Name "VOLUME1" -Host $storage
Add-VNXSnapshot -Volume $volume -Name "Snapshot01"
This example shows how to create a volume snapshot.
Perform the following steps:
1. Run Get-VNXHost to get the storage. Save the result to the $storage variable.
2. Run Get-VNXVolume with the $storage variable to get the storage volume. Save the result to the $volume variable.
3. Run Add-VNXSnapshot with the $volume variable.

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
Add-VNXSnapshot [-Name <String>] -Volume <CSanVolume> [<CommonParameters>]
```
