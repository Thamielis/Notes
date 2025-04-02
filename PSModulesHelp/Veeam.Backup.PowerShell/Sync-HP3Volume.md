Sync-HP3Volume
--------------

### Synopsis
Rescans HPE 3PAR StoreServ storage volumes added to the backup infrastructure.

---

### Description

This cmdlet rescans HPE 3PAR StoreServ storage volumes from the backup infrastructure.
Veeam Backup & Replication uses this process to synchronize the state of the backup server with storage systems state and to get information about new snapshots created on storage volumes.  Run the Sync-HP3Storage cmdlet to rescan an entire HPE 3PAR StoreServ storage system.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-HP3Storage](Get-HP3Storage)

* [Get-HP3Volume](Get-HP3Volume)

---

### Examples
> Example 1

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServe Storage"
$volume = Get-HP3Volume -Storage $storage
Sync-HP3Volume -Volume $volume
This example shows how to rescan an HPE 3PAR StoreServ storage volume added to the backup infrastructure..

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Get-HP3Volume cmdlet. Set the $storage variable as the Storage parameter value. Save the result to the $volume variable.
3. Run the Sync-HP3Volume cmdlet. Set the $volume variable as the Volume parameter value.

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
Sync-HP3Volume -Volume <CSanVolume[]> [<CommonParameters>]
```
