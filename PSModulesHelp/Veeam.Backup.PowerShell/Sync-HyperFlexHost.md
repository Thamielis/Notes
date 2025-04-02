Sync-HyperFlexHost
------------------

### Synopsis
Rescans Cisco HyperFlex storage system.

---

### Description

This cmdlet rescans Cisco HyperFlex storage systems. During rescan Veeam Backup & Replication retrieves information about the storage system topology and adds storage volumes to the backup infrastructure.
Note: The cmdlet will not notify you in case Veeam Backup & Replication fails to perform a rescan.

---

### Related Links
* [Get-HyperFlexHost](Get-HyperFlexHost)

---

### Examples
> Rescanning Cisco HyperFlexSystem

$storage = Get-HyperFlexHost -Name "HX Storage"
Sync-HyperFlexHost -Host $storage
This example shows how to rescan the HX Storage Cisco HyperFlex storage system.

Perform the following steps:
1. Run the Get-HyperFlexHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable. 2. Run the Sync-HyperFlexHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to rescan.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CCiscoHxHost]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.CiscoHX.CCiscoHxHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-HyperFlexHost [-Host <CCiscoHxHost>] [<CommonParameters>]
```
