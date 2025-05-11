Get-VBRExternalRepository
-------------------------

### Synopsis
Returns an array of external repositories from the backup infrastructure.

---

### Description

This cmdlet returns an array of external repositories added to the backup infrastructure. You can get the following types of external repositories:
- Amazon S3 object storage.
- Microsoft Azure object storage.

---

### Examples
> Example 1. Getting External Repository by Name

Get-VBRExternalRepository  -Name "External Repository
This command allows you to get an external repository named External Repository.
> Example 2. Getting External Repository by ID

```PowerShell
Get-VBRExternalRepository -Id "0x0x0xxx-000x-0x0x-000-000x00000x0x"
This command allows you to get an external repository by the external repository ID.
```

---

### Parameters
#### **Id**
Specifies the ID of an external repository that you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies the name of an external repository that you want to get.

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
Get-VBRExternalRepository -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRExternalRepository [-Name <String[]>] [<CommonParameters>]
```
