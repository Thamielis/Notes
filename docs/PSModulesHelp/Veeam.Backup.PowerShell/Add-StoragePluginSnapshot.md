Add-StoragePluginSnapshot
-------------------------

### Synopsis
Creates snapshots of Universal Storage API integrated systems.

---

### Description

This cmdlet creates a snapshot of a selected storage volume.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

* [Get-StoragePluginVolume](Get-StoragePluginVolume)

---

### Examples
> Example 1

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
$volume = Get-StoragePluginVolume -Host $storage -Name "VOLUME-01"
Add-StoragePluginSnapshot -Volume $volume -Name "DailySnapshot01"
This example shows how to create a volume snapshot.

Perform the following steps:
1. Run the Get-StoragePluginHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-StoragePluginVolume cmdlet. Set the $storage variable as the Host parameter value. Specify the Name parameter value. Save the result to the $volume variable.
3. Run the Add-StoragePluginSnapshot cmdlet. Set the $volume variable as the Volume parameter value. Specify the Name parameter value.

---

### Parameters
#### **Description**
Specifies the description of the storage.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the snapshot.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Volume**
Specifies the storage volume for which you want to take snapshot.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CSanVolume]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.CSanVolume

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-StoragePluginSnapshot [-Description <String>] -Name <String> -Volume <CSanVolume> [<CommonParameters>]
```
