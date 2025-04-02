Get-VBRAzureADAccount
---------------------

### Synopsis
Returns Azure Entra ID-based storage accounts.
Note: This cmdlet is available starting from Veeam Backup & Replication 12.1 (build 12.1.0.2131).

---

### Description

This cmdlet returns Azure Entra ID-based storage accounts added to Veeam Backup & Replication.

---

### Examples
> Example 1. Getting Azure Entra ID-Based Storage Accounts by ID

```PowerShell
Get-VBRAzureADAccount -Id Guid "cfe6a67f-f322-446d-92e3-cf1da7cbf192", "1242a067-8292-406b-8035-8b0aefb187bf"
This command returns Azure Entra ID-based storage accounts with the following IDs: cfe6a67f-f322-446d-92e3-cf1da7cbf192 and 1242a067-8292-406b-8035-8b0aefb187bf.
```
> Example 2. Getting Azure Entra ID-Based Storage Accounts by Names

```PowerShell
Get-VBRAzureADAccount -Name "Azure Entra ID Admin"
This command returns Azure Entra ID-based storage accounts with the Azure Entra ID Admin name.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for Azure Entra ID-based storage accounts. The cmdlet will return storage accounts with these ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**
Specifies an array of friendly names for storage accounts. The cmdlet will return storage accounts with these names. Note: The friendly names match the names of the storage accounts

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **StorageAccountName**
Specifies an array of names for Azure Entra ID storage account. The cmdlet will return Microsoft Entra ID user accounts with these names.

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
Get-VBRAzureADAccount -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRAzureADAccount [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRAzureADAccount [-StorageAccountName <String[]>] [<CommonParameters>]
```
