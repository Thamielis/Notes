Sync-VBRIsilonHost
------------------

### Synopsis
Rescans Dell PowerScale (formerly Isilon) storage system.

---

### Description

This cmdlet rescans Dell PowerScale storage systems. During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
Run the Sync-VBRIsilonVolume cmdlet to rescan Dell PowerScale volumes added to the backup infrastructure.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-VBRIsilonHost](Get-VBRIsilonHost)

* [Sync-VBRIsilonVolume](Sync-VBRIsilonVolume)

---

### Examples
> Rescanning Dell PowerScale Storage System

$storage = Get-VBRIsilonHost -Name "Isilon Storage"
Sync-VBRIsilonHost -Host $storage
This example shows how to rescan a Dell PowerScale storage system.

Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Sync-VBRIsilonHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to rescan.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CIsilonHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Isilon.CIsilonHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRIsilonHost [-Host <CIsilonHost>] [<CommonParameters>]
```
