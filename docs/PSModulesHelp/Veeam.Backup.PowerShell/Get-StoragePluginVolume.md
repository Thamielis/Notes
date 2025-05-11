Get-StoragePluginVolume
-----------------------

### Synopsis
Returns volumes of Universal Storage API integrated systems added to the backup infrastructure.

---

### Description

This cmdlet returns volumes of Universal Storage API integrated systems added to the backup infrastructure.

TIP: Run Get-StoragePluginInfrastructureVolume to get an array of volumes from Universal Storage API integrated systems.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

---

### Examples
> Example 1

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
Get-StoragePluginVolume -Name "VOLUME-01" -Host $storage
This example shows how to get a Universal Storage API integrated systems volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-StoragePluginHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-StoragePluginVolume cmdlet. Specify the Name parameter value. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies an array of storage systems.
The cmdlet will return volumes of these storage systems.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[CPublicPluginHost[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.PublicStorage.CPublicPluginHost[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-StoragePluginVolume [-Host <CPublicPluginHost[]>] [-Name <String[]>] [<CommonParameters>]
```
