Get-VBRCloudTenantBackup
------------------------

### Synopsis
Returns non-encrypted backups of AD tenants and tenants managed by the Service Provider.

---

### Description

Returns non-encrypted backups of AD tenants and tenants managed by the Service Provider.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Getting Non-Encrypted Backups for AD Tenant Accounts

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$backupfiles = Get-VBRCloudTenantBackup -Tenant $tenant
This example shows how to get a list of non-encrypted backups of AD tenants and tenants managed by the Service Provider.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudTenantBackup cmdlet. Set the $tenant variable as the Tenant parameter value. Save the result to the $backupfiles variable.

---

### Parameters
#### **Id**
Specifies an array of the backup IDs. The cmdlet will return backups with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies the array of the job names. The cmdlet will return backups produced with these jobs.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Tenant**
Specifies an array of tenant accounts for which you want to get backup files.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

Veeam.Backup.PowerShell.Infos.IVBRCloudTenant[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudTenantBackup [-Id <Guid[]>] [-Name <String[]>] [-Tenant <IVBRCloudTenant[]>] [<CommonParameters>]
```
