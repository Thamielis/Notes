Get-VBRCatalystCopyJob
----------------------

### Synopsis
Returns backup copy jobs for HPE StoreOnce repositories.

---

### Description

This cmdlet returns backup copy jobs for HPE StoreOnce repositories.

---

### Examples
> Example 1. Getting Backup Copy Job for HPE StoreOnce Repository by Name

```PowerShell
Get-VBRCatalystCopyJob -Name "StoreOnce copy job"
This command returns the StoreOnce copy job backup copy job for an HPE StoreOnce repository.
```
> Example 2. Getting Backup Copy Job for HPE StoreOnce Repositories by ID

```PowerShell
Get-VBRCatalystCopyJob -Id "cc20878e-614a-4e28-b00b-d2434bae15d7"
This command returns the cc20878e-614a-4e28-b00b-d2434bae15d7 backup copy job for an HPE StoreOnce repository.
```

---

### Parameters
#### **Id**
Specifies an ID of a backup copy job for HPE StoreOnce repositories. The cmdlet will return the job with this ID.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |False        |

#### **Name**
Specifies an array of names of backup copy jobs for HPE StoreOnce repositories. The cmdlet will return the job with this name.

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
Get-VBRCatalystCopyJob [-Id <Guid>] [<CommonParameters>]
```
```PowerShell
Get-VBRCatalystCopyJob [-Name <String[]>] [<CommonParameters>]
```
