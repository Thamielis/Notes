Sync-NimbleHost
---------------

### Synopsis
Rescans HPE Nimble storage systems.

---

### Description

This cmdlet rescans HPE Nimble storage systems.
During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
Run the Sync-NimbleVolume cmdlet to rescan Dell VNX volumes added to the backup infrastructure.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-NimbleHost](Get-NimbleHost)

---

### Examples
> Example 1

$storage = Get-NimbleHost -Name "HPE Nimble-FC"
Sync-NimbleHost -Host $storage
This example shows how to rescan a HPE Nimble storage system.

1. Run the Get-NimbleHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Sync-NimbleHost cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to rescan.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CNimbleHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Nimble.CNimbleHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-NimbleHost [-Host <CNimbleHost>] [<CommonParameters>]
```
