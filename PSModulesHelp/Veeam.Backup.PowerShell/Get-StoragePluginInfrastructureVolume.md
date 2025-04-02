Get-StoragePluginInfrastructureVolume
-------------------------------------

### Synopsis
Returns volumes of Universal Storage API integrated systems.

---

### Description

This cmdlet returns an array of volumes of Universal Storage API integrated systems.
The cmdlet will return storage volumes, even if they are not added to your backup infrastructure.

TIP: You can use this cmdlet to specify storage volumes that you want to rescan or exclude from the storage rescan.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

---

### Examples
> Example 1

```PowerShell
Get-StoragePluginInfrastructureVolume
This command returns all volumes added to Universal Storage API integrated systems.
```
> Example 2

```PowerShell
Get-StoragePluginInfrastructureVolume -Name "Volume4", "Volume5", "Volume1"
This command returns specific volumes added to Universal Storage API integrated systems.
```
> Example 3

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
Get-StoragePluginInfrastructureVolume -Name "VOLUME-01" -Host $storage
This example shows how to get all volumes added to the specific Universal Storage API integrated systems.

Perform the following steps:
1. Run the Get-StoragePluginHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-StoragePluginInfrastructureVolume cmdlet. Specify the Name parameter value. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage.
The cmdlet will return an array of volumes added to that storage.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CPublicPluginHost]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of volume names.
The cmdlet will return volumes with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.SanPlugin.PublicStorage.CPublicPluginHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-StoragePluginInfrastructureVolume [-Host <CPublicPluginHost>] [-Name <String[]>] [<CommonParameters>]
```
