Sync-VBRNutanixVolume
---------------------

### Synopsis
Rescans Nutanix Files volumes added to the backup infrastructure.

---

### Description

This cmdlet rescans Nutanix Files volumes added to the backup infrastructure. Veeam Backup & Replication uses this process to synchronize the state of the backup server with storage systems state and to get information about new snapshots created on the volumes.

Run the Sync-VBRNutanixHost cmdlet to rescan the entire Nutanix Files storage system.

Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform rescan.

---

### Examples
> Example 1

$volume = Get-VBRNutanixVolume -Name "VOL01"
Sync-VBRNutanixVolume -Volume $volume
This example shows how to rescan a Nutanix Files storage volume added to the backup infrastructure.

Perform the following steps: 1. Run Get-VBRNutanixVolume to get the storage that you want to rescan. Save the result to the $volume variable.
2. Run Sync-VBRNutanixVolume with the $volume variable.

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
Sync-VBRNutanixVolume -Volume <CSanVolume[]> [<CommonParameters>]
```
