Remove-HP4Storage
-----------------

### Synopsis
Removes HPE StoreVirtual storage systems from Veeam Backup & Replication.

---

### Description

This cmdlet removes a selected HPE StoreVirtual storage from Veeam Backup & Replication.
The storage is not deleted from the server where it was created. When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

Alias Remove-VBRHPStorage

---

### Examples
> Example 1

$storage = Get-HP4Storage -Name "HPE StoreVirtual VSA"
Remove-HP4Storage -Storage $storage
This command removes a selected storage.

Perform the following steps:
1. Run the Get-HP4Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-HP4Storage cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Storage**
Specifies the storage you want to remove.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CHpP4kGroup]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.HpP4k.CHpP4kGroup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-HP4Storage -Storage <CHpP4kGroup> [<CommonParameters>]
```
