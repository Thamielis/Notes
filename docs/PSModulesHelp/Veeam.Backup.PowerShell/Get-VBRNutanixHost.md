Get-VBRNutanixHost
------------------

### Synopsis
Returns Nutanix Files storage systems.

---

### Description

This cmdlet returns Nutanix Files storage systems.
You can get the list of all Nutanix Files storage systems added to your virtual infrastructure or narrow down the output by a storage system name.

---

### Examples
> Example 1

```PowerShell
Get-VBRNutanixHost -Name "Nutanix Files_host"
This command gets Nutanix Files storage systems.
```

---

### Parameters
#### **Name**
Specifies an array of storage system names. The cmdlet will return storage systems with these names.

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
Get-VBRNutanixHost [-Name <String[]>] [<CommonParameters>]
```
