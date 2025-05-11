Get-VBRCloudGatewayPool
-----------------------

### Synopsis
Returns cloud gateway pools.

---

### Description

This cmdlet returns existing cloud gateway pools.

---

### Examples
> Example 1. Getting All Cloud Gateway Pools

```PowerShell
Get-VBRCloudGatewayPool
This command gets all cloud gateway pools.
```
> Example 2. Getting Cloud Gateway Pool by Name

```PowerShell
Get-VBRCloudGatewayPool -Name "CloudGT01"
This command gets the CloudGT01 cloud gateway pool by the cloud gateway pool name.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for cloud gateway pools that you want to get.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Guid[]]`|false   |named   |True (ByValue)|

#### **Name**
Specifies an array of names for cloud gateway pool that you want to get.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |named   |True (ByValue)|

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
Get-VBRCloudGatewayPool [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudGatewayPool [-Name <String[]>] [<CommonParameters>]
```
