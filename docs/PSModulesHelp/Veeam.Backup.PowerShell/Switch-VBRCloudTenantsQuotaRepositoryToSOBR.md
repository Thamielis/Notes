Switch-VBRCloudTenantsQuotaRepositoryToSOBR
-------------------------------------------

### Synopsis
Switches tenant quotas on the cloud repository to a scale-out backup repository.

---

### Description

This cmdlet switches tenant quotas on the cloud repository to a scale-out backup repository. You can use this cmdlet if you want to move tenant backup data to a scale-out backup repository used as a cloud repository.
Consider the following:
- Migration of tenant data from and to object storage used as a cloud repository is not supported.
- Migration to a scale-out backup repository is not possible if at least one extent is in the maintenance mode.
- Names of folders with tenant backup data on the cloud repository must not contain special characters, for example: \/`~,!?#$&*|{}[];"<>.
- The cmdlet does not copy the actual backup data from an original cloud repository to a new cloud repository. Instead, it creates folders for tenant data on extents of the scale-out backup repository used as a cloud repository, copies backup metadata to these folders and prompts the user to copy backup files to these folders as well.
Note that either all folders or no folders that are being migrated must exist on the scale-out backup repository. If some tenant folders already exist on the scale-out backup repository, while other folders are missing, the migration process fill fail.
- During migration, tenant accounts will be automatically disabled. The service provider must enable the disabled accounts manually once the migration process is completed.
- If the tenant has multiple quotas assigned, backups on all quotas will be migrated to the scale-out backup repository, even if one of these quotas is already on a scale-out backup repository.
- All subtenants are migrated together with the tenant, it is not possible to migrate only specific subtenants.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example - Switching Tenant Quota on Cloud Repository to Scale-Out Backup Repository

$repository = Get-VBRBackupRepository -ScaleOut -Name "Veeam Scale-Out Backup Repository"
$tenant = Get-VBRCloudTenant -Name "ABC Company"
Switch-VBRCloudTenantsQuotaRepositoryToSOBR -ScaleOutBackupRepository $repository -Tenants $tenant
This example shows how to switch tenant quota on the cloud repository to a scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet with the ScaleOut parameter to specify the scale-out backup repository where you want to create the tenant quota. Save the result to the $repository variable.
2. Run the Get-VBRCloudTenant cmdlet to specify the tenant account for which you want to create cloud repository quota on the scale-out backup repository. Save the result to the $tenant variable.
3. Run the Switch-VBRCloudTenantsQuotaRepositoryToSOBR cmdlet. Specify the following settings:
- Set the $repository variable as the ScaleOutBackupRepository parameter value.
- Set the $tenant variable as the Tenant parameter value.
4. The cmdlet will prompt you to perform the following operations:
- Confirm that the specified tenant accounts will be disabled.
- Copy tenant backup files to the folders that the cmdlet has created on the scale-out backup repository, and then confirm that the backup files have been copied.
- Confirm that the cmdlet will update tenant backups and cloud repository settings for the tenant account.
- Confirm that the cmdlet will rescan the new cloud repository.

---

### Parameters
#### **Force**
Defines that the cmdlet will switch tenant quotas on the cloud repository to a scale-out backup repository without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ScaleOutBackupRepository**
Specifies the scale-out backup repository where you want to create cloud repository quota for a tenant account.
Accepts the VBRScaleOutBackupRepository object. To create this object, run the Get-VBRBackupRepository cmdlet and provide the ScaleOut parameter.

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Tenants**
Specifies the array of tenant accounts for which you want to create cloud repository quota on a scale-out backup repository.
Accepts the IVBRCloudTenant[] object. To create this object, run the Get-VBRCloudTenant cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[IVBRCloudTenant[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Switch-VBRCloudTenantsQuotaRepositoryToSOBR [-Force] -ScaleOutBackupRepository <VBRScaleOutBackupRepository> [-Tenants <IVBRCloudTenant[]>] [<CommonParameters>]
```
