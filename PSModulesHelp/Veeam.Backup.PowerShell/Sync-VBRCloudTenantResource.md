Sync-VBRCloudTenantResource
---------------------------

### Synopsis
Refreshes information about current usage of backup resources by a cloud tenant.

---

### Description

This cmdlet updates the information about the cloud tenant's current usage of the backup resources. You can see the refreshed backup resource quotas in the user interface of Veeam Backup & Replication.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example - Refreshing Information about Tenant's Backup Resources

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$resources = $tenant.resources[0]
Sync-VBRCloudTenantResource -CloudTenantResource $resources
This example shows how to refresh the backup resource quota for the ABC Company tenant.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Use the resources parameter of the $tenant variable. Save the result to the $resources variable.
3. Run the Sync-VBRCloudTenantResource cmdlet. Set the $resources variable as the CloudTenantResource parameter value.

---

### Parameters
#### **CloudTenantResource**
Specifies backup resources of the cloud tenant account. The cmdlet will refresh information about current usage of these backup resources.
Accepts the VBRCloudTenantResource[] object. To get this object, run the Get-VBRCloudTenant cmdlet and use the resources parameter.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|true    |named   |False        |

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
Sync-VBRCloudTenantResource -CloudTenantResource <VBRCloudTenantResource[]> [<CommonParameters>]
```
