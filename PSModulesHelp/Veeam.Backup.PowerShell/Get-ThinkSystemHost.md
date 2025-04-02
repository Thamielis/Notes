Get-ThinkSystemHost
-------------------

### Synopsis
Returns ThinkSystem storage systems added to the backup infrastructure.

---

### Description

This cmdlet returns the list of all ThinkSystem storage systems added to the backup infrastructure or narrow down the output by a storage name.

---

### Examples
> Example 1. Getting All ThinkSystem Storage Systems

```PowerShell
Get-ThinkSystemHost
This command returns all ThinkSystem storage systems.
```
> Example 2. Getting ThinkSystem Storage Systems by Name

```PowerShell
Get-ThinkSystemHost -Name "ThinkSystem Store"
This command returns a ThinkSystem storage by name.
```

---

### Parameters
#### **Name**
Specifies an array of storage names. The cmdlet will return storage systems with these names.

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
Get-ThinkSystemHost [-Name <String[]>] [<CommonParameters>]
```
