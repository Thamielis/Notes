Get-VBRHvProxy
--------------

### Synopsis
Returns a list of the Hyper-V backup proxies.

---

### Description

This cmdlet returns a list of the Hyper-V backup proxies added to the backup infrastructure.

---

### Examples
> Example 1. Getting List of Hyper-V Backup Proxies

```PowerShell
Get-VBRHvProxy
This commands gets the list of all the Hyper-V proxies added to the backup infrastructure.
```
> Example 2. Getting Hyper-V Backup Proxy by Name

```PowerShell
Get-VBRHvProxy -Name "LocalProxy"
This command gets the Hyper-V backup proxy with the name LocalProxy.
```

---

### Parameters
#### **Name**
Specifies an array of names of the Hyper-V proxies. The cmdlet will return proxies with these names.

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
Get-VBRHvProxy [-Name <String[]>] [<CommonParameters>]
```
