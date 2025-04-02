Sync-HP4Volume
--------------

### Synopsis
Rescans HPE StoreVirtual storage volumes added to the backup infrastructure.

---

### Description

This cmdlet rescans HPE StoreVirtual storage volumes from the backup infrastructure.
Veeam Backup & Replication uses this process to synchronize the state of the backup server with storage systems state and to get information about new snapshots created on storage volumes.
Run the Sync-HP4Storage cmdlet to rescan an entire HPE StoreVirtual storage system.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

Alias Sync-VBRHPVolume

---

### Related Links
* [Get-HP4Storage](Get-HP4Storage)

* [Get-HP4Volume](Get-HP4Volume)

---

### Examples
> Example 1

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
$volume = Get-HP4Volume -Storage $storage -Name "HPE Volume 01"
Sync-HP4Volume -Volume $volume
This example shows how to rescan an HPE StoreVirual storage volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP4Volume cmdlet. Set the $storage variable as the Storage parameter value. Specify the Name parameter value. Save the result to the $volume variable.
3. Run the Sync-HP4Volume cmdlet. Set the $volume variable as the Volume parameter value.

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
Sync-HP4Volume -Volume <CSanVolume[]> [<CommonParameters>]
```
