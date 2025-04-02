Get-VBRCDPProxy
---------------

### Synopsis
Returns VMware CDP proxies added to the backup infrastructure.

---

### Description

This cmdlet returns VMware CDP proxies added to the backup infrastructure.

---

### Examples
> Example 1. Getting VMware CDP Proxy by Name

```PowerShell
Get-VBRCDPProxy -Name "Proxy05"
This command returns the Proxy05 VMware CDP Proxy.
```
> Example 2. Getting VMware CDP Proxy by ID

```PowerShell
Get-VBRCDPProxy -Id "d602b38b-fab6-4c4e-8066-a1bf16affa76"
This command returns the d602b38b-fab6-4c4e-8066-a1bf16affa76 VMware CDP Proxy.
```

---

### Parameters
#### **Id**
Specifies an array of Ids for VMware CDP proxies.
The cmdlet will return a list of proxies with these names IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of names for VMware CDP proxies. The cmdlet will return a list of proxies with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCDPProxy [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCDPProxy [-Name <String[]>] [<CommonParameters>]
```
