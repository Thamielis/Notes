Sync-StoragePluginHost
----------------------

### Synopsis
Rescans Universal Storage API integrated systems.

---

### Description

This cmdlet rescans Universal Storage API integrated systems.
During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
Run Sync-StoragePluginVolume to rescan Universal Storage API volumes added to the backup infrastructure.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

---

### Examples
> Example 1

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
Sync-StoragePluginHost -Host $storage
This example shows to how to rescan Universal Storage API integrated system.
Perform the following steps:
1. Run the Get-StoragePluginHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Sync-StoragePluginHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to rescan.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CPublicPluginHost]`|false   |named   |True (ByPropertyName, ByValue)|

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
Sync-StoragePluginHost [-Host <CPublicPluginHost>] [<CommonParameters>]
```
