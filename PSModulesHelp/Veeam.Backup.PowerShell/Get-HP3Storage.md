Get-HP3Storage
--------------

### Synopsis
Returns HPE 3PAR StoreServ storage systems.

---

### Description

This cmdlet returns HPE 3PAR StoreServ storages added to Veeam Backup & Replication.
You can get the list of all storages added to your virtual infrastructure or narrow down the output by storage name.

---

### Examples
> Example 1

```PowerShell
Get-HP3Storage
This command returns all storages.
```
> Example 2

```PowerShell
Get-HP3Storage -Name "HPE 3PAR StoreServe Storage"
This command looks for a storage by name.
```

---

### Parameters
#### **Name**
Specifies the array of storage names.
The cmdlet will return the storage systems with these names.

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
Get-HP3Storage [-Name <String[]>] [<CommonParameters>]
```
