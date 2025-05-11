Get-VSBApplicationGroup
-----------------------

### Synopsis
Returns application groups.

---

### Description

This cmdlet returns the list of existing application groups.

You can get the list of all application groups, or search for instances directly by name.

---

### Examples
> Example 1

```PowerShell
Get-VSBApplicationGroup
This command looks for the list of all application groups.
```
> Example 2

```PowerShell
Get-VSBApplicationGroup -Name "MailServer Appgroup"
This command looks for the application group named "MailServer Appgroup".
```

---

### Parameters
#### **Name**
Specifies the name of the application group you want to get, or search conditions. You can specify multiple names separated by commas.

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
Get-VSBApplicationGroup [-Name <String[]>] [<CommonParameters>]
```
