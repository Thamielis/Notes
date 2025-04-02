Get-HP4Storage
--------------

### Synopsis
Returns HPE StoreVirtual storages.

---

### Description

This cmdlet returns HPE StoreVirtual storages added to Veeam Backup & Replication. You can get the list of all HPE StoreVirtual storages added to your virtual infrastructure or narrow down the output by storage name.

Alias Get-VBRHPStorage

---

### Examples
> Example 1

```PowerShell
Get-HP4Storage
This command returns all storages.
```
> Example 2

```PowerShell
Get-HP4Storage -Name "HPE StoreVirtual VSA"
This command looks for a storage by name.
```

---

### Parameters
#### **Name**
Specifies the array of storage names. The cmdlet will return storages with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-HP4Storage [-Name <String[]>] [<CommonParameters>]
```
