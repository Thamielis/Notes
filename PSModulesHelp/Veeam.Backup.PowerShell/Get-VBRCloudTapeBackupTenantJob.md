Get-VBRCloudTapeBackupTenantJob
-------------------------------

### Synopsis
Returns tenant jobs.

---

### Description

This cmdlet returns the array of jobs from the tenant Veeam Backup & Replication infrastructure. IMPORTANT! You can run this cmdlet from the service provider side only.

---

### Examples
> Example 1. Getting Tenant Job by Name

```PowerShell
Get-VBRCloudTapeBackupTenantJob -Name "Backup Job 01"
This command gets a tenant job by the job name.
```
> Example 2. Getting Tenant Job by Job ID

```PowerShell
Get-VBRCloudTapeBackupTenantJob -Id "0814a9b4-5fba-4f20-86dd-4790a5b659ab"
This command gets a tenant job by the job ID.
```
> Example 3. Getting Tenant Job by Tenant ID

```PowerShell
Get-VBRCloudTapeBackupTenantJob -TenantId "12a6f8f5-832a-4c7c-9b9b-74b020d6d78e"
This command gets a tenant job by the tenant ID.
```
> Example 4. Getting Tenant Job by Tenant Repository ID

```PowerShell
Get-VBRCloudTapeBackupTenantJob -TenantRepositoryId "729c82d6-54d5-4eb6-b0f2-9d85bcff1b9b"
This command gets a tenant job by the tenant repository ID.
```

---

### Parameters
#### **Id**
Specifies an array of tenant jobs IDs. The cmdlet will return tenant jobs with specified IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of tenant jobs names. The cmdlet will return tenant jobs with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **TenantId**
Specifies an array of tenant IDs. The cmdlet will return tenant jobs of specified tenant IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **TenantRepositoryId**
Specifies an array of the tenant cloud repository IDs. The cmdlet will return tenant jobs that are targeted to these repositories.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.String[]

System.Guid[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudTapeBackupTenantJob -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTapeBackupTenantJob [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTapeBackupTenantJob -TenantId <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTapeBackupTenantJob -TenantRepositoryId <Guid[]> [<CommonParameters>]
```
