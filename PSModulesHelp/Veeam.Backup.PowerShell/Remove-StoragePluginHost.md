Remove-StoragePluginHost
------------------------

### Synopsis
Removes Veeam Universal Storage API integrated storages from Veeam Backup & Replication console.

---

### Description

This cmdlet removes a selected storage from Veeam Backup & Replication console.

The storage is not deleted from the server where it was created.
When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

---

### Examples
> Example 1

$storage = Get-StoragePluginHost -Name "IBM Spectrum"
Remove-StoragePluginHost -Host $storage
This example shows how to remove a selected storage from Veeam Backup & Replication console.

Perform the following steps:
1. Run the Get-StoragePluginHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-StoragePluginHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies the storage you want to remove.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[CPublicPluginHost]`|true    |named   |True (ByPropertyName, ByValue)|

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
Remove-StoragePluginHost -Host <CPublicPluginHost> [<CommonParameters>]
```
