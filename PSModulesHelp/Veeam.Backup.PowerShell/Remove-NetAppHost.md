Remove-NetAppHost
-----------------

### Synopsis
Removes NetApp storage systems.

---

### Description

This cmdlet removes a selected NetApp storage from Veeam Backup & Replication.  The storage is not deleted from the server where it was created. When you remove a storage, you stop managing it via your Veeam Backup & Replication console.

---

### Examples
> Example 1

$storage = Get-NetAppHost -Name "NetApp Store 01"
Remove-NetAppHost -Host $storage
This example shows how to remove a NetApp storage from Veeam Backup & Replication.

Perform the following steps:
1. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-NetAppHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies the storage you want to remove.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[CNaHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.NetApp.CNaHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-NetAppHost -Host <CNaHost> [<CommonParameters>]
```
