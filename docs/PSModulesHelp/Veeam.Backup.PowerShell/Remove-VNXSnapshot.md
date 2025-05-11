Remove-VNXSnapshot
------------------

### Synopsis
Removes Dell VNX storage snapshots.

---

### Description

This cmdlet permanently removes a selected Dell VNX storage snapshot from your virtual infrastructure.

---

### Related Links
* [Get-VNXHost](Get-VNXHost)

* [Get-VNXVolume](Get-VNXVolume)

* [Get-VNXSnapshot](Get-VNXSnapshot)

---

### Examples
> Example 1

$storage = Get-VNXHost -Name "VNX Storage"
$volume1 = Get-VNXVolume -Host $storage -Name "VOLUME1"
$volume2 = Get-VNXVolume -Host $storage -Name "VOLUME2"
$snapshot = Get-VNXSnapshot -Volume $volume1, $volume2
Remove-VNXSnapshot -Snapshot $snapshot
This example shows how to remove snapshots of several Dell VNX storage volumes.
Perform the following steps:
1. Get the volume snapshots you want to remove.
- Run the Get-VNXHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
- Run the Get-VNXVolume cmdlet. Set the $storage variable as the Host parameter value. Specify the Name parameter value. Save each volume to a separate variable: $volume1, $volume2, etc.
- Run the Get-VNXSnapshot cmdlet. Set the $volume1 and $volume2 variables as the Volume parameter values. Save the result to the $snapshot variable.
2. Run the Remove-VNXSnapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

---

### Parameters
#### **Snapshot**
Specifies the array of snapshots.
The cmdlet will remove these snapshots.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[CSanSnapshot[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanSnapshot[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VNXSnapshot -Snapshot <CSanSnapshot[]> [<CommonParameters>]
```
