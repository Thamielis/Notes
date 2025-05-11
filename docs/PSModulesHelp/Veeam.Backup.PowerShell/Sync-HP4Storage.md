Sync-HP4Storage
---------------

### Synopsis
Rescans HPE StoreVirtual storage systems.

---

### Description

This cmdlet rescans HPE StoreVirtual storage systems. During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure. Run the Sync-HP4Volume cmdlet to rescan HPE StoreVirtual volumes added to the backup infrastructure.
Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

Alias Sync-VBRHPStorage

---

### Related Links
* [Get-HP4Storage](Get-HP4Storage)

---

### Examples
> Example 1

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
Sync-HP4Storage -Storage $storage
This example shows how to how to rescan an HPE StoreVirtual storage system.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Sync-HP4Storage cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Storage**
Specifies a storage system that you want to rescan.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CHpP4kGroup]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.HpP4k.CHpP4kGroup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-HP4Storage [-Storage <CHpP4kGroup>] [<CommonParameters>]
```
