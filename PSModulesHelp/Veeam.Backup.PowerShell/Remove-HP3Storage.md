Remove-HP3Storage
-----------------

### Synopsis
Removes HPE 3PAR StoreServ storage systems.

---

### Description

This cmdlet removes the selected HPE 3PAR StoreServ storage from Veeam Backup & Replication.
The storage is not deleted from the server where it was created. When you remove a storage, you stop managing it in your Veeam Backup & Replication console.

---

### Examples
> Example 1

$storage = Get-HP3Storage -Name "HPE 3PAR StoreServe Storage"
Remove-HP3Storage -Storage $storage
This command removes a selected storage.

Perform the following steps:
1. Run the Get-HP3Storage cmdlet. Specify the Name parameter value. Save the result to the $storage variable.
2. Run the Remove-HP3Storage cmdlet. Set the $storage variable as the Storage parameter value.

---

### Parameters
#### **Storage**
Specifies the storage you want to remove.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[CHp3PARHost]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.SanPlugin.Hp3PAR.CHp3PARHost

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-HP3Storage -Storage <CHp3PARHost> [<CommonParameters>]
```
