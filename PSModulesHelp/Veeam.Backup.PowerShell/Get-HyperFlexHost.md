Get-HyperFlexHost
-----------------

### Synopsis
Returns Cisco HyperFlex storage systems.

---

### Description

can get the list of all Cisco HyperFlex storage systems added to your backup infrastructure or narrow down the output by storage name.

---

### Examples
> Example 1. Returning All Cisco HyperFlex Storage Systems

```PowerShell
Get-HyperFlexHost
This command returns all Cisco HyperFlex storage systems
```
> Example 2. Returning Cisco HyperFlex Storage Systems by Name

```PowerShell
Get-HyperFlexHost -Name "HX Storage"
This command returns the HX Storage Cisco HyperFlex storage.
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
Get-HyperFlexHost [-Name <String[]>] [<CommonParameters>]
```
