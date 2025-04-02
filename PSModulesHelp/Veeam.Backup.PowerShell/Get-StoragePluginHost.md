Get-StoragePluginHost
---------------------

### Synopsis
Returns Universal Storage API integrated systems.

---

### Description

This cmdlet returns Veeam Universal Storage API integrated storages added to Veeam Backup & Replication.

You can get the list of all storages or narrow down the output by storage name or storage plugin.

---

### Related Links
* [Get-StoragePluginHost](Get-StoragePluginHost)

---

### Examples
> Example 1

Get-StoragePluginHost
This command returns all storages added to Veeam Backup & Replication.
> Example 2

```PowerShell
Get-StoragePluginHost -Name "IBM Spectrum"
This command returns storages by name.
```
> Example 3

```PowerShell
Get-StoragePluginHost -PluginType "Ibm"
This command returns storages by the associated storage plugin.
```

---

### Parameters
#### **Name**
Specifies the array of storage names.
The cmdlet will return storage systems with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **PluginType**
Specifies the storage plug-in.
The cmdlet will return storage systems added to Veeam Backup & Replication over this plug-in.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

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
Get-StoragePluginHost [-Name <String[]>] [-PluginType <String>] [<CommonParameters>]
```
