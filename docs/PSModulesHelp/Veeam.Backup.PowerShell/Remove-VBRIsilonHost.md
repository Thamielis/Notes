Remove-VBRIsilonHost
--------------------

### Synopsis
Removes Dell PowerScale (formerly Isilon) storage systems from Veeam Backup & Replication.

---

### Description

This cmdlet removes a selected Dell PowerScale storage from Veeam Backup & Replication.
The storage is not deleted from the server where it was created. When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

---

### Related Links
* [Get-VBRIsilonHost](Get-VBRIsilonHost)

---

### Examples
> Removing Dell PowerScale Storage

$storage = Get-VNXHost -Name "VNX Storage"
Remove-VNXHost -Host $storage
This example shows how to remove the Dell PowerScale storage.

Perform the following steps:
1. Run the Get-VBRIsilonHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-VBRIsilonHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies a storage system that you want to rescan.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CIsilonHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Isilon.CIsilonHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRIsilonHost -Host <CIsilonHost> [<CommonParameters>]
```
