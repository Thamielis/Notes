Get-NimbleHost
--------------

### Synopsis
Returns HPE Nimble storage systems.

---

### Description

This cmdlet returns Nimble storages added to Veeam Backup & Replication.
You can get the list of all Nimble storages added to your virtual infrastructure or narrow down the output by storage name.

---

### Examples
> Example 1

```PowerShell
Get-NimbleHost
This command returns all HPE Nimble storage systems.
```
> Example 2

```PowerShell
Get-NimbleHost -Name "Nimble-FC"
This command returns an HPE Nimble storage by name.
```

---

### Parameters
#### **Name**
Specifies the array of storage names.
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
Get-NimbleHost [-Name <String[]>] [<CommonParameters>]
```
