Get-VBRIsilonHost
-----------------

### Synopsis
Returns Dell PowerScale (formerly Isilon) storage systems.

---

### Description

You can get the list of all Dell PowerScale storage systems added to your virtual infrastructure or narrow down the output by storage name.

---

### Examples
> Example 1. Returning All Dell PowerScale Storage Systems

```PowerShell
Get-VBRIsilonHost
This command returns all Dell PowerScale storage systems.
```
> Example 2. Returning Dell PowerScale Storage Systems by Name

```PowerShell
Get-VBRIsilonHost -Name "Isilon Storage"
This command returns a Dell PowerScale storage by name.
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
Get-VBRIsilonHost [-Name <String[]>] [<CommonParameters>]
```
