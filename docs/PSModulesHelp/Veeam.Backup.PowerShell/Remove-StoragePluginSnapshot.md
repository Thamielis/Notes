Remove-StoragePluginSnapshot
----------------------------

### Synopsis
Removes snapshots of Universal Storage API integrated systems.

---

### Description

This cmdlet permanently removes a selected storage snapshot from your virtual infrastructure.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

* [Get-StoragePluginVolume](Get-StoragePluginVolume)

* [Get-StoragePluginSnapshot](Get-StoragePluginSnapshot)

---

### Examples
> Example 1

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
$volume1 = Get-StoragePluginVolume -Host $storage -Name "VOLUME-01"
$volume2 = Get-StoragePluginVolume -Host $storage -Name "VOLUME-02"
$snapshot = Get-StoragePluginSnapshot -Volume $volume1, $volume2
Remove-StoragePluginSnapshot -Snapshot $snapshot
This example shows how to remove snapshots of several volumes.

Perform the following steps:
1. Get the volume snapshots you want to remove. To do this, perform the following steps:
- Run the Get-StoragePluginHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
- Run the Get-StoragePluginVolume cmdlet. Set the $storage variable as the Host parameter value. Specify the Name parameter value. Save each volume to a separate variable: $volume1, $volume2, etc.
- Run the Get-StoragePluginSnapshot cmdlet. Set the $volume1 and $volume2 variables as the Volume parameter value. Save the result to the $snapshot variable.
2. Run the Remove-StoragePluginSnapshot cmdlet. Set the $snapshot variable as the Snapshot parameter value.

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
Remove-StoragePluginSnapshot -Snapshot <CSanSnapshot[]> [<CommonParameters>]
```
