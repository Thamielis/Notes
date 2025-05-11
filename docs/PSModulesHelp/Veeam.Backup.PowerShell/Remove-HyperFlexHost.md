Remove-HyperFlexHost
--------------------

### Synopsis
Removes Cisco HyperFlex storage systems from the backup infrastructure.

---

### Description

This cmdlet removes Cisco HyperFlex storage from the backup infrastructure.
The storage is not deleted from the server where it was created. When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

---

### Related Links
* [Get-HyperFlexHost](Get-HyperFlexHost)

---

### Examples
> Removing Cisco HyperFlex Storage

$storage = Get-HyperFlexHost -Name "HX Storage"
Remove-HyperFlexHost -Host $storage
This example shows how to remove the HX Storage Cisco HyperFlex storage.

Perform the following steps:
1. Run the Get-HyperFlexHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-HyperFlexHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to remove.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CCiscoHxHost]`|true    |named   |True (ByPropertyName, ByValue)|

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
Remove-HyperFlexHost -Host <CCiscoHxHost> [<CommonParameters>]
```
