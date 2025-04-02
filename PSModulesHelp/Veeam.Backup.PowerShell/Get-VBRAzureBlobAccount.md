Get-VBRAzureBlobAccount
-----------------------

### Synopsis
Returns Microsoft Azure Blob credentials records.

---

### Description

This cmdlet returns an array of credentials records for Microsoft Azure Blob storage added to Veeam Backup & Replication.

---

### Examples
> Example 1. Getting Microsoft Azure Blob Credentials Records by Name

```PowerShell
Get-VBRAzureBlobAccount -Name "Azure Blob"
This command gets an Microsoft Azure Blob credentials record by the credentials record login name.
```
> Example 2. Getting Microsoft Azure Blob Credentials Records by ID

```PowerShell
Get-VBRAzureBlobAccount -Id "936edf7c-7cf3-4ddc-9895-c7485ef4bb2c"
This command gets an Microsoft Azure Blob credentials record by the credentials record ID.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for Microsoft Azure Blob credentials records. The cmdlet will return Microsoft Azure Blob credentials records with these IDs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of login names for Microsoft Azure Blob credentials records. The cmdlet will return Microsoft Azure Blob credentials records with these logins.

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
Get-VBRAzureBlobAccount -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRAzureBlobAccount [-Name <String[]>] [<CommonParameters>]
```
