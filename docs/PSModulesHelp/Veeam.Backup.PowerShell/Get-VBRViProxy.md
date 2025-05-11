Get-VBRViProxy
--------------

### Synopsis
Returns a list of VMware backup proxies.

---

### Description

This cmdlet returns a list of VMware backup proxies managed by Veeam Backup & Replication.
Run the Get-VBRJobProxy cmdlet to get the list of proxies assigned to a specific job.

---

### Examples
> Example 1. Getting List of VMware Backup Proxies

Get-VBRViProxy
This command gets a list of all VMware proxies managed by Veeam Backup & Replication.
> Example 2. Getting VMware Backup Proxy by Name

```PowerShell
Get-VBRViProxy -Name "LocalProxy"
This command gets the VMware backup proxy with the name LocalProxy.
```

---

### Parameters
#### **Name**
Specifies an array of names of VMware proxies. The cmdlet will return proxies with these names.

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
Get-VBRViProxy [-Name <String[]>] [<CommonParameters>]
```
