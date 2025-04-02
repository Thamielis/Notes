Sync-StoragePluginVolume
------------------------

### Synopsis
Rescans volumes of Universal Storage API integrated systems.

---

### Description

This cmdlet rescans volumes of Universal Storage API integrated systems added to the backup infrastructure.
Veeam Backup & Replication uses this process to synchronize the state of the backup server with storage systems state and to get information about new snapshots created on storage volumes. Run Sync-StoragePluginHost to rescan an Universal Storage API integrated systems.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-StoragePluginVolume](Get-StoragePluginVolume)

---

### Examples
> Example 1

$volume = Get-StoragePluginVolume -Name "VOLUME-01"
Sync-StoragePluginVolume -Volume $volume
This example shows how to rescan a Universal Storage API integrated systems volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-StoragePluginVolume cmdlet. Specify the Name parameter value. Save the result to the $volume variable.
2. Run the Sync-StoragePluginVolume cmdlet. Set the $volume variable as the Volume parameter value.

---

### Parameters
#### **Volume**
Specifies an array of storage volumes that you want to rescan.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CSanVolume[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Sync-StoragePluginVolume -Volume <CSanVolume[]> [<CommonParameters>]
```
