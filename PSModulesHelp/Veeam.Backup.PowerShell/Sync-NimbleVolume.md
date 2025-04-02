Sync-NimbleVolume
-----------------

### Synopsis
Rescans HPE Nimble storage volumes added to the backup infrastructure.

---

### Description

This cmdlet rescans HPE Nimble storage volumes from the backup infrastructure.
Veeam Backup & Replication uses this process to synchronize the state of the backup server with storage systems state and to get information about new snapshots created on storage volumes.
Run the Sync-NimbleHost cmdlet to rescan an entire HPE Nimble storage system.

NOTE: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-NimbleVolume](Get-NimbleVolume)

---

### Examples
> Example 1

$volume = Get-NimbleVolume -Name "VOL01"
Sync-NimbleVolume -Volume $volume
This example shows how to rescan an HPE Nimble storage volume added to the backup infrastructure.

Perform the following steps:
1. Run the Get-NimbleVolume cmdlet. Specify the Name parameter value Save the result to the $volume variable.
2. Run the Sync-NimbleVolume cmdlet. Set the $volume variable as the Volume parameter value.

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
Sync-NimbleVolume -Volume <CSanVolume[]> [<CommonParameters>]
```
