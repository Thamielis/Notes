Get-VBRCloudTapeBackupTenant
----------------------------

### Synopsis
Returns tenants backups.

---

### Description

This cmdlet returns the array of backups of tenants. IMPORTANT! You can run this cmdlet from the service provider side only.

---

### Examples
> Example 1. Getting Backups of All Tenants

```PowerShell
Get-VBRCloudTapeBackupTenant -ID "0fccf7c9-1f90-49de-8bec-53a0697e04ab"
This command gets backups of all tenants.
```
> Example 2. Getting Backups of Selected Tenant by Tenant ID

```PowerShell
Get-VBRCloudTapeBackupTenant -ID "0fccf7c9-1f90-49de-8bec-53a0697e04ab"
This command gets backups of a tenant with a specific tenant ID.
```
> Example 3. Getting Backups of Selected Tenant by Tenant Name

```PowerShell
Get-VBRCloudTapeBackupTenant -Name "New tenant"
This command gets a backup of a tenant by the tenant name.
```

---

### Parameters
#### **Id**
Specifies an array of tenant IDs. The cmdlet will return backups of tenants with the specified IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of tenant names. The cmdlet will return backups of tenants with these names.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

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
Get-VBRCloudTapeBackupTenant -Id <Guid[]> [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTapeBackupTenant [-Name <String[]>] [<CommonParameters>]
```
