Sync-HP3Storage
---------------

### Synopsis
Rescans HPE 3PAR StoreServ storage systems.

---

### Description

This cmdlet rescans HPE 3PAR StoreServ storage systems.
During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
Run Sync-HP3Volume to rescan HPE 3PAR StoreServ volumes added to the backup infrastructure.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-HP3Storage](Get-HP3Storage)

---

### Examples
> Example 1

Get-HP3Storage -Name "HPE Store 01"
Sync-HP3Storage -Storage $storage
This example shows how to rescan an HPE 3PAR StoreServ storage system.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Sync-HP3Storage cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Storage**
Specifies a storage system that you want to rescan.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CHp3PARHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Hp3PAR.CHp3PARHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-HP3Storage [-Storage <CHp3PARHost>] [<CommonParameters>]
```
