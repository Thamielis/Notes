Get-StoragePluginSnapshot
-------------------------

### Synopsis
Returns snapshots of Universal Storage API integrated systems.

---

### Description

This cmdlet returns snapshots of Universal Storage API integrated systems.
You can get the list of all storage snapshots, or look for a specific snapshot by name or associated volume.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

* [Get-StoragePluginVolume](Get-StoragePluginVolume)

---

### Examples
> Example 1

```PowerShell
Get-StoragePluginSnapshot -Name "DailySnapshot01"
This example shows how to get a storage snapshot by name.
The cmdlet will look for the snapshot across all Veeam Universal Storage API integrated storages.
```
> Example 2

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
$volume1 = Get-StoragePluginVolume -Host $storage -Name "VOLUME-01"
$volume2 = Get-StoragePluginVolume -Host $storage -Name "VOLUME-02"
Get-StoragePluginSnapshot -Volume $volume1, $volume2
This example shows how to get the snapshots of several storage volumes.

Perform the following steps:
1. Run the Get-StoragePluginHost cmdlet. Save the result to the $storage variable.
2. Get the volumes. To do this, run the Get-StoragePluginVolume cmdlet. Set the $storage variable as the Host parameter value. Specify the Name parameter value. Save each volume to a separate variable: $volume1, $volume2, etc.
3. Run the Get-StoragePluginSnapshot cmdlet. Set the $volume1 and $volume2 variables as the Volume parameter value.

---

### Parameters
#### **Name**
Specifies the array of snapshot names.
The cmdlet will return the snapshots with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Volume**
Specifies the array of storage volumes.
The cmdlet will return the snapshots of these volumes.

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
Get-StoragePluginSnapshot [-Name <String[]>] [-Volume <CSanVolume[]>] [<CommonParameters>]
```
