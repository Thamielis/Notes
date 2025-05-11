Sync-VNXHost
------------

### Synopsis
Rescans Dell VNX storage system.

---

### Description

This cmdlet rescans Dell VNX storage systems. During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure. Run the Sync-VNXVolume cmdlet to rescan Dell VNX volumes added to the backup infrastructure.
Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-VNXHost](Get-VNXHost)

---

### Examples
> Example 1

$storage = Get-VNXHost -Name "VNX Storage"
Sync-VNXHost -Storage $storage
This example shows how to rescan a Dell VNX storage system.

Perform the following steps:
1. Run the Get-VNXHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Sync-VNXHost cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to rescan.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CVnxHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Vnx.CVnxHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VNXHost [-Host <CVnxHost>] [<CommonParameters>]
```
