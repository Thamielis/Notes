Sync-VBRCloudTenantReplicationResources
---------------------------------------

### Synopsis
Refreshes information about current usage of the replication resources by a cloud tenant.

---

### Description

This cmdlet updates the information about the cloud tenant's current usage of the replication resources. You can see the refreshed remaining replication resources in the user interface of Veeam Backup & Replication.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [Get-VBRCloudHardwarePlan](Get-VBRCloudHardwarePlan)

---

### Examples
> Example - Refreshing Information about Replication Resource Usage for Cloud Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Sync-VBRCloudTenantReplicationResources -Tenant $tenant
This example shows how to refresh the replication resource usage numbers for the ABC Company tenant.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Sync-VBRCloudTenantReplicationResources cmdlet. Set the $tenant variable as the Tenant parameter value.

---

### Parameters
#### **HvHardwarePlan**
[For Hyper-V environments] Specifies the hardware plan you want to refresh the replication resource usage numbers for.  Accepts the VBRHvCloudHardwarePlan object. To get this object, run the Get-VBRCloudHardwarePlan cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRHvCloudHardwarePlan]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Tenant**
Specifies the cloud tenant you want to refresh the replication resource usage numbers for.  Accepts the VBRCloudTenant object. To get this object, run the Get-VBRCloudTenant cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ViHardwarePlan**
[For VMware environments] Specifies the hardware plan you want to refresh the replication resource usage numbers for.  Accepts the VBRViCloudHardwarePlan object. To get this object, run the Get-VBRCloudHardwarePlan cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRViCloudHardwarePlan]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenant

Veeam.Backup.PowerShell.Infos.VBRViCloudHardwarePlan

Veeam.Backup.PowerShell.Infos.VBRHvCloudHardwarePlan

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Sync-VBRCloudTenantReplicationResources [-HvHardwarePlan <VBRHvCloudHardwarePlan>] [-ViHardwarePlan <VBRViCloudHardwarePlan>] [<CommonParameters>]
```
```PowerShell
Sync-VBRCloudTenantReplicationResources -Tenant <VBRCloudTenant> [<CommonParameters>]
```
