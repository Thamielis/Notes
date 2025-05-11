Start-VBRCloudTenantBackupEvacuation
------------------------------------

### Synopsis
Starts to migrate tenant data between performance extents.

---

### Description

This cmdlet allows to migrate backed-up tenant data between performance extents of a scale-out backup repository. The cmdlet will disable the tenant account while performing the migration from the source performance extent to the target performance extent. After the migration is completed, the cmdlet will enable the tenant account. If performance extents consist of repositories with Fast Clone enabled, the migration process uses Fast Clone technology.  The backed-up data is not hydrated on relocating.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRRepositoryExtent](Get-VBRRepositoryExtent)

* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Migrating Tenant Data Between Performance Extents

$scaleoutrepository = Get-VBRBackupRepository -Name "Veeam Performance Scale-Out Repository"
$source = Get-VBRRepositoryExtent -Repository $scaleoutrepository
$target = Get-VBRRepositoryExtent -Repository $scaleoutrepository
$tenant = Get-VBRCloudTenant -Name "ABC Company"
Start-VBRCloudTenantBackupEvacuation -SourceExtent $source[0] -TargetExtent $target[1] -Tenant $tenant
This example shows how to mirgate the ABC Company tenant data between performance extents of a scale-out backup repository.

Perform the following steps:
1. Get the source and target performance extents.
- Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $scaleoutrepository variable.
- Run the Get-VBRRepositoryExtent cmdlet. Specify the Repository parameter value. Save the result to the $source variable.
- Run the Get-VBRRepositoryExtent cmdlet. Specify the Repository parameter value. Save the result to the $target variable.
The Get-VBRRepositoryExtent cmdlet will return an array of extents. Mind the ordinal number of the necessary extent (in our example, it is the first and the second extents in the array).
2. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
3. Run the Start-VBRCloudTenantBackupEvacuation cmdlet. Specify the following settings:
- Set the $source variable as the SourceExtent parameter value.
- Set the $target variable as the TargetExtent parameter value.
- Set the $tenant variable as the Tenant parameter value.

---

### Parameters
#### **SourceExtent**
Specifies the source performance extent from which you want to migrate the tenant data. Accepts the VBRRepositoryExtent object. To create this object, run the Get-VBRRepositoryExtent cmdlet.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRRepositoryExtent]`|true    |named   |True (ByPropertyName, ByValue)|

#### **TargetExtent**
Specifies the target performance extent to which you want to migrate the tenant data. Accepts the VBRRepositoryExtent object. To create this object, run the Get-VBRRepositoryExtent cmdlet.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRRepositoryExtent]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Tenant**
Specifies the tenant which data you want to migrate. Accepts the IVBRCloudTenant object. To create this object, run the Get-VBRCloudTenant cmdlet.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRRepositoryExtent

Veeam.Backup.PowerShell.Infos.IVBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRCloudTenantBackupEvacuation -SourceExtent <VBRRepositoryExtent> -TargetExtent <VBRRepositoryExtent> -Tenant <IVBRCloudTenant> [<CommonParameters>]
```
