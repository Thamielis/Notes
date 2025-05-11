Get-VNXSnapshot
---------------

### Synopsis
Returns Dell VNX storage snapshots.

---

### Description

This cmdlet returns existing Dell VNX storage snapshots.
You can get the list of all storage snapshots, or look for a specific snapshot by name or associated volume.

---

### Examples
> Example 1

$storage = Get-VNXHost -Name "VNX Storage"
$volume = Get-VNXVolume -Name "VOLUME1" -Host $storage
Get-VNXSnapshot -Volume $volume
This example shows how to get the existing snapshots of the Dell VNX storage volume.

You will need to perform the following steps:
1. Run Get-VNXHost to get the storage. Save the result to the $storage variable.
2. Run Get-VNXVolume with the $storage variable to get the storage volume. Save the result to the $volume variable.
3. Run Get-VNXSnapshot with the $volume variable.

---

### Parameters
#### **Name**
Specifies the array of snapshot names.
The cmdlet will return snapshots with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Volume**
Specifies the array of storage volumes.
The cmdlet will return snapshots of these volumes.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CSanVolume[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanVolume[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VNXSnapshot [-Name <String[]>] [-Volume <CSanVolume[]>] [<CommonParameters>]
```
