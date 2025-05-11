Sync-NetAppHost
---------------

### Synopsis
Rescans NetApp storage systems.

---

### Description

This cmdlet rescans NetApp storage systems.
During a rescan Veeam Backup & Replication, retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
Run the Sync-NetAppVolume cmdlet to rescan NetApp volumes added to the backup infrastructure.

Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-NetAppHost](Get-NetAppHost)

---

### Examples
> Example 1

$storage = Get-NetAppHost -Name "NetApp Store 01"
Sync-NetAppHost -Host $storage
This example shows how to rescan NetApp storage systems.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Sync-NetAppHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to rescan.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CNaHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.NetApp.CNaHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-NetAppHost [-Host <CNaHost>] [<CommonParameters>]
```
