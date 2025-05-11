Get-VBRCloudTapeBackupTenantRepository
--------------------------------------

### Synopsis
Returns tenant cloud repositories.

---

### Description

This cmdlet returns the array of tenant cloud repositories. IMPORTANT! You can run this cmdlet from the service provider side only.

---

### Examples
> Example 1. Getting All Tenant Cloud Repositories

```PowerShell
Get-VBRCloudTapeBackupTenantRepository
This command gets an array of all tenant cloud repositories.
```
> Example 2. Getting Tenant Cloud Repository by Repository ID

```PowerShell
Get-VBRCloudTapeBackupTenantRepository -ID "0fccf7c9-1f90-49de-8bec-53a0697e04ab"
This command gets a tenant cloud repository by the repository ID.
```
> Example 3. Getting Tenant Cloud Repository by Repository Name

```PowerShell
Get-VBRCloudTapeBackupTenantRepository -Name "New tenant"
This command gets tenant cloud repositories by the tenant friendly name.
```
> Example 4. Getting Tenant Cloud Repository by Tenant ID

```PowerShell
Get-VBRCloudTapeBackupTenantRepository -TenantId "4bff98a5-c49e-473c-8ce0-4203549b7560"
This command gets tenant cloud repositories by the tenant ID.
```

---

### Parameters
#### **Id**
Specifies an array of IDs for tenant backup repositories. The cmdlet will return the tenant backup repositories with the specified IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of friendly names for tenant backup repositories. The cmdlet will return the tenant backup repositories with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **TenantId**
Specifies an array of tenant IDs. The cmdlet will return tenant backup repositories with the specified tenant IDs.

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
Get-VBRCloudTapeBackupTenantRepository -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTapeBackupTenantRepository [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTapeBackupTenantRepository -TenantId <Guid[]> [<CommonParameters>]
```
