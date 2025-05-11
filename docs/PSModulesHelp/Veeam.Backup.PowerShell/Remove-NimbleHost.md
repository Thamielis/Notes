Remove-NimbleHost
-----------------

### Synopsis
Removes HPE Nimble storage systems from Veeam Backup & Replication.

---

### Description

This cmdlet removes a selected HPE Nimble storage from Veeam Backup & Replication.
The storage is not deleted from the server where it was created. When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

---

### Examples
> Example 1

$storage = Get-NimbleHost -Name "HPE Nimble-FC"
Remove-NimbleHost -Host $storage
This example shows how to remove an HPE Nimble storage from Veeam Backup & Replication.

Perform the following steps:
1. Run the Get-NimbleHost cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-NimbleHost cmdlet. Set the $storage variable as the Host parameter value.

---

### Parameters
#### **Host**
Specifies the storage you want to remove.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CNimbleHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Nimble.CNimbleHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-NimbleHost -Host <CNimbleHost> [<CommonParameters>]
```
