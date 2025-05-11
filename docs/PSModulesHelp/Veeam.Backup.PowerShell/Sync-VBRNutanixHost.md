Sync-VBRNutanixHost
-------------------

### Synopsis
Rescans Nutanix Files storage systems.

---

### Description

This cmdlet rescans Nutanix Files storage systems. During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.

Run the Sync-VBRNutanixVolume cmdlet to rescan Nutanix Files volumes added to the backup infrastructure.

Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-VBRNutanixHost](Get-VBRNutanixHost)

---

### Examples
> Example 1

$storage = Get-VBRNutanixHost -Name "NetApp Store 01"
Sync-VBRNutanixHost -Host $storage
This example shows how to rescan Nutanix Files storage systems.

Perform the following steps:
1.	Run Get-VBRNutanixHost to get the storage that you want to rescan. Save the result to the $storage variable.
2.	Run Sync-VBRNutanixHost with the $storage variable.

---

### Parameters
#### **Host**
Specifies the storage system that you want to rescan.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CNutanixHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Nutanix.CNutanixHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRNutanixHost [-Host <CNutanixHost>] [<CommonParameters>]
```
