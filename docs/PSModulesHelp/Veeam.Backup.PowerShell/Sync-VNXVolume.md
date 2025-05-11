Sync-VNXVolume
--------------

### Synopsis
Rescans Dell VNX storage volumes added to the backup infrastructure.

---

### Description

This cmdlet rescans Dell VNX storage volumes from the backup infrastructure.
Veeam Backup & Replication uses this process to synchronize the state of the backup server with storage systems state and to get information about new snapshots created on storage volumes.  Run the Sync-VNXHost cmdlet to rescan an entire Dell VNX storage system.
Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-VNXHost](Get-VNXHost)

* [Get-VNXVolume](Get-VNXVolume)

---

### Examples
> Example 1

$storage = Get-VNXHost -Name "VNX Storage"
$volume = Get-VNXVolume -Name "VOLUME1" -Host $storage
Sync-VNXVolume -Volume $volume
This example shows how to rescan a Dell VNX storage volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-VNXHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.  2. Run the Get-VNXVolume cmdlet. Specify the Name parameter value. Set the $storage variable as the Host parameter value. Save the result to the $volume variable.  3. Run the Sync-VNXVolume cmdlet. Set the $volume variable as the Volume parameter value.

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
Sync-VNXVolume -Volume <CSanVolume[]> [<CommonParameters>]
```
