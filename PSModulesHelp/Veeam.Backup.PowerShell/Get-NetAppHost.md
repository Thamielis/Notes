Get-NetAppHost
--------------

### Synopsis
Returns NetApp storage systems added to Veeam Backup & Replication.

---

### Description

This cmdlet returns NetApp storages added to Veeam Backup & Replication.
You can get the list of all NetApp storage systems added to your virtual infrastructure or narrow down the output by storage name.

---

### Examples
> Example 1

```PowerShell
Get-NetAppHost -Name "NetApp Store"
This command returns a NetApp storage by name.
```
> Example 2

```PowerShell
Get-NetAppHost
This command returns all NetApp storage systems.
```

---

### Parameters
#### **Name**
Specifies an array of storage names.
The cmdlet will return storage systems with these names.

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
Get-NetAppHost [-Name <String[]>] [<CommonParameters>]
```
