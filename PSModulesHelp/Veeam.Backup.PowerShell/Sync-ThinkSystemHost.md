Sync-ThinkSystemHost
--------------------

### Synopsis
Rescans ThinkSystem storage systems.

---

### Description

This cmdlet rescans ThinkSystem storage systems.
During a rescan Veeam Backup & Replication, retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
Run the Sync-ThinkSystemVolume cmdlet to rescan ThinkSystem volumes added to the backup infrastructure.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-ThinkSystemHost](Get-ThinkSystemHost)

---

### Examples
> Rescanning ThinkSystem Storage Systems

$storage = Get-ThinkSystemHost -Name "ThinkSystem Store 01"
Sync-ThinkSystemHost -Host $storage
This example shows how to rescan ThinkSystem storage systems.

Perform the following steps:
1. Run the Get-ThinkSystemHost cmdlet. Specify the Name parameter value.  Save the result to the $storage variable.
2. Run the Sync-ThinkSystemHost cmdlet. Set the $storage variable as the Host parameter value.

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
Sync-ThinkSystemHost [-Host <CNaHost>] [<CommonParameters>]
```
