Get-VNXHost
-----------

### Synopsis
Returns Dell VNX storage systems.

---

### Description

You can get the list of all Dell VNX storage systems added to your virtual infrastructure or narrow down the output by storage name.

---

### Examples
> Example 1

```PowerShell
Get-VNXHost
This command looks for the list of all storages.
```
> Example 2

```PowerShell
Get-VNXHost -Name "Veeam VNX Storage"
This command looks for storage named "Veeam VNX Storage".
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
Get-VNXHost [-Name <String[]>] [<CommonParameters>]
```
