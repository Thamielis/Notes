Set-VBRCloudTenantResource
--------------------------

### Synopsis
Modifies tenants backup resources settings.

---

### Description

This cmdlet modifies the VBRCloudTenantResource object containing the backup resources for a tenant. To modify settings, specify new values for the necessary parameters.  The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRWANAccelerator](Get-VBRWANAccelerator)

* [Set-VBRCloudTenant](Set-VBRCloudTenant)

---

### Examples
> Example 1. Changing Backup Repository Quota of Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$resources = $tenant.resources[0]
$newquota = Set-VBRCloudTenantResource -CloudTenantResource $resources -Quota 20
Set-VBRCloudTenant -CloudTenant $tenant -Resource $newquota
This example shows how to change the backup repository quota of a tenant.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save it to the $tenant variable.
2. Get the array of quotas assigned to the tenant. Select the first quota from the list. Save the result to the $resources variable.
3. Run the Set-VBRCloudTenantResource cmdlet. Set the $resources variable as the CloudTenantResource parameter value. Specify the Quota parameter value. Save the result to the $newquota variable.
4. Run the Set-VBRCloudTenant cmdlet to apply the new resources to the tenant. Set the $tenant variable as the CloudTenant parameter value. Set the $newquota variable as the Resource parameter value.
> Example 2. Enabling WAN Acceleration for Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$resources = $tenant.resources[0]
$wan = Get-VBRWANAccelerator -Name "Columbus WAN"
$newresources = Set-VBRCloudTenantResource -CloudTenantResource $resources -EnableWanAccelerator -WanAccelerator $wan
Set-VBRCloudTenant -CloudTenant $tenant -Resource $newresources
This example shows how to enable WAN acceleration for a tenant.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save it to the $tenant variable.
2. Get the array of resources assigned to the tenant. Select the first item from the list. Save the result to the $resources variable.
3. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save it to the $wan variable.
4. Run the Set-VBRCloudTenantResource cmdlet. Set the $resources variable as the CloudTenantResource parameter value. Provide the EnableWanAccelerator parameter. Set the $wan variable as the WanAccelerator parameter value.  Save the results to the $newresources variable.
5. Run the Set-VBRCloudTenant cmdlet to apply the new resources to the tenant. Set the $tenant variable as the CloudTenant parameter value. Set the $newresources variable as the Resource parameter value.

---

### Parameters
#### **CloudTenantResource**
Specifies the cloud account tenant quota settings you want to modify. Accepts the VBRCloudTenantResource object. To get this object, run the Get-VBRCloudTenant cmdlet and use the resources parameter.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource]`|true    |named   |False        |

#### **EnableWanAccelerator**
Enables the option to use WAN accelerators for backup jobs to cloud repositories. Use the WanAccelerator parameter to set the WAN accelerator.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Quota**
Specifies the amount of space you want to allocate to the tenant on the selected backup repository. Permitted value: 1 to 2097151  (GB).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |False        |

#### **Repository**
Specifies the backup repository in your backup infrastructure you want to expose to the tenant. You can specify simple or scale-out backup repositories. You cannot specify cloud repositories or individual scale-out repositories extents. Accepts the CBackupRepository object. To get this object, run the Get-VBRCloudTenant cmdlet and use the resources parameter.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **RepositoryFriendlyName**
Specifies a friendly name for the cloud repository you want to present to the user. The name you enter will be displayed in the list of backup repositories at user's side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **WanAccelerator**
Specifies the WAN accelerator for the EnableWanAccelerator parameter. Accepts the CWanAccelerator object. To get this object, run the Get-VBRWANAccelerator cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

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
Set-VBRCloudTenantResource -CloudTenantResource <VBRCloudTenantResource> [-EnableWanAccelerator] [-Quota <Int64>] [-Repository <CBackupRepository>] [-RepositoryFriendlyName <String>] [-WanAccelerator 
```
```PowerShell
<CWanAccelerator>] [<CommonParameters>]
```
