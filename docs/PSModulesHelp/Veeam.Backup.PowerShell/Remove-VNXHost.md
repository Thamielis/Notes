Remove-VNXHost
--------------

### Synopsis
Removes Dell VNX storage systems from Veeam Backup & Replication.

---

### Description

This cmdlet removes a selected Dell VNX storage from Veeam Backup & Replication.
The storage is not deleted from the server where it was created. When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

---

### Related Links
* [Get-VNXHost](Get-VNXHost)

---

### Examples
> Example 1

$storage = Get-VNXHost -Name "VNX Storage"
Remove-VNXHost -Storage $storage
This example shows how to remove the Dell VNX storage.
Perform the following steps:
1. Run the Get-VNXHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-VNXHost cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Host**
Specifies the storage you want to remove.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[CVnxHost]`|true    |named   |True (ByPropertyName, ByValue)|

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
Remove-VNXHost -Host <CVnxHost> [<CommonParameters>]
```
