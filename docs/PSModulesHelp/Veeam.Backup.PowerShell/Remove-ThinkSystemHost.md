Remove-ThinkSystemHost
----------------------

### Synopsis
Removes ThinkSystem storage systems.

---

### Description

This cmdlet removes a selected ThinkSystem storage from Veeam Backup & Replication.
The storage is not deleted from the server where it was created.
When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

---

### Related Links
* [Get-ThinkSystemHost](Get-ThinkSystemHost)

---

### Examples
> Removing ThinkSystem Storage System

$storage = Get-ThinkSystemHost -Name "ThinkSystem Store 01"
Remove-ThinkSystemHost -Host $storage
This example shows how to remove a ThinkSystem storage system from Veeam Backup & Replication.

Perform the following steps:
1. Run the Get-ThinkSystemHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-ThinkSystemHost cmdlet. Set the $storage variable as the Host parameter value.

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
Remove-ThinkSystemHost -Host <CNaHost> [<CommonParameters>]
```
