Set-VBRCloudTenant
------------------

### Synopsis
Modifies settings for standalone tenant accounts.

---

### Description

This cmdlet modifies settings for simple cloud tenant accounts. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [New-VBRCloudTenantResource](New-VBRCloudTenantResource)

* [New-VBRCloudTenantReplicationResources](New-VBRCloudTenantReplicationResources)

---

### Examples
> Example 1. Adding Replication Resources to Tenant

$HwPlan = Get-VBRCloudHardwarePlan -Name "VMware Silver"
$options = New-VBRCloudTenantHwPlanOptions -HardwarePlan $HwPlan
$replicationresources = New-VBRCloudTenantReplicationResources -EnableNetworkFailoverResources -HardwarePlanOptions $options
$tenant = Get-VBRCloudTenant -Name "ABC Company"
Set-VBRCloudTenant -CloudTenant $tenant -ReplicationResources $replicationresources
This example shows how to add the replication resources to a tenant.

Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save the result to the $HwPlan variable.
2. Run the New-VBRCloudTenantHwPlanOptions cmdlet. Set the $HwPlan variable as the HardwarePlan parameter value. Save the result to the $options variable.
3. Run the New-VBRCloudTenantReplicationResources cmdlet. Provide the EnableNetworkFailoverResources parameter. Set the $options variable as the HardwarePlanOptions parameter value. Save the result to the $replicationresources variable.
4. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save it to the $tenant variable.
5. Run the Set-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value. Set the $replicationresources variable as the ReplicationResources parameter value.
> Example 2. Setting New Password to Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Set-VBRCloudTenant -CloudTenant $tenant -Password "Pass456"
This example shows how to set a new password to a tenant.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save it to the $tenant variable.
2. Run the Set-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value. Specify the Password parameter value.
> Example 3. Disabling Lease Expiration Setting for Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Set-VBRCloudTenant -CloudTenant $tenant -EnableLeaseExpiration: $false
This example shows how to disable lease expiration settings for the ABC company.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save it to the $tenant variable.
2. Run the Set-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value. Set the EnableLeaseExpiration parameter value to $false.
> Example 4. Changing Backup Repository Quota for Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$resources = $tenant.resources[0]
$newquota = Set-VBRCloudTenantResource -CloudTenantResource $resources -Quota 20
Set-VBRCloudTenant -CloudTenant $tenant -Resources $newquota
This example shows how to change the backup repository quota for a tenant.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save it to the $tenant variable.
2. Get the array of quotas assigned to the tenant. Select the first quota from the list. Save the result to the $resources variable.
3. Run the Set-VBRCloudTenantResource cmdlet. Set the $resources variable as the CloudTenantResource parameter value. Specify the Quota parameter value for the new quota. Save the result to the $newquota variable.
4. Run the Set-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value. Set the $newquota variable as the Resources parameter value.

---

### Parameters
#### **BackupProtectionPeriod**
Used to set the time period for the EnableBackupProtection parameter. Can be set to 1-99 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **CloudTenant**
Specifies the user account you want to modify. Accepts the VBRCloudTenant object.  To get this object, run the Get-VBRCloudTenant cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the user account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupProtection**
Enables protection for tenant's backups from complete removal.
With this option, tenant's deleted backups will be placed to the recycle bin on the service provider's side. The backups will be kept in the bin for the time period specified by the BackupProtectionPeriod parameter. When this period ends, the backups are removed from the cloud repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGatewayFailover**
Enables gateway pool failover option.  In case the gateway pool is down, Veeam Backup & Replication will route the data through the gateway that is not added to any gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableLeaseExpiration**
Enables lease expiration settings for the simple tenant account.  Use the LeaseExpirationDate parameter to set the lease expiration date.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableReplicationResorces**
Enables the replication resources option for the simple cloud tenant account. Note: If you set this parameter to the EnableReplicationResorces:$false option, the cmdlet will disable tenant access to replication resources.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableResources**
Enables the backup resources option for the vCD cloud tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableThrottling**
Enables the network throttling to set the bandwidth limitations. Use the ThrottlingValue and ThrottlingUnit parameters to set the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
For the EnableReplicationResorces parameter. Defines whether to remove replication resources from the cloud connect infrastructure. If you provide this parameter, the cmdlet will remove all replication resources from the cloud connect infrastructure.  Otherwise, the cmdlet will disable tenant access to replication resources.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayPool**
Specifies the gateway pool. Veeam Backup & Replication will route the data through the specified gateway pool. Accepts the VBRCloudGatewayPool[] object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCloudGatewayPool[]]`|false   |named   |False        |

#### **GatewaySelectionType**
Specifies the type of gateway, you want to assign to the tenant.
* StandaloneGateways - use this option to route the data through the gateway that is not added to the gateway pool.
* GatewayPool - use this option to route the data through the gateways, added to one gateway pool.
Valid Values:

* StandaloneGateways
* GatewayPool

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCloudGatewaySelectionType]`|false   |named   |False        |

#### **HashedPassword**
Defines that you submit the hashed password. The hashed passwords are stored in Veeam backup database. Use this parameter, for example, to restore user accounts or to edit objects returned by Get-VBRCloudTenant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LeaseExpirationDate**
For EnableLeaseExpiration parameter. Specifies the lease expiration date. Default: 23:59:59.9999999, 31.12.9999.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **MaxConcurrentTask**
Specifies the maximum number of tasks the tenant can process in parallel.  The number of tasks is the number of VM disks processed by one job targeted at the cloud repository or cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the tenant account. The user name must meet the following requirements:
* The maximum length of the user name is 128 characters. It is recommended that you create short user names to avoid problems with long paths to backup files on the cloud repository.
* The user name may contain space characters.
* The user name must not contain the following characters: \/:*?\"<>|=; as well as Unicode characters.
* The user name must not end with the period character [.].

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password you want to set to the tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ReplicationResources**
Specifies the array of backup resource quotas you want to allocate to the simple cloud tenant account. Note:
When you assign multiple backup resource quotas to one tenant account, the resource quotas must have unique Repository Friendly Names and they must use different repositories. Accepts the VBRCloudTenantReplicationResources object. To get this object, run the New-VBRCloudTenantResource cmdlet.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRCloudTenantReplicationResources]`|false   |named   |False        |

#### **Resources**
Specifies the array of backup resource quotas you want to allocate to the simple cloud tenant account. Note: When you assign multiple backup resource quotas to one tenant account, the resource quotas must have unique Repository Friendly Names and they must use different repositories. Accepts the VBRCloudTenantResource[] object. To get this object, run the New-VBRCloudTenantResource cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|false   |named   |False        |

#### **ThrottlingUnit**
Used to set the value for the EnableThrottling parameter. Specifies the measure units for the ThrottlingValue parameter: MbitPerSec, MbytePerSec, KbytePerSec. Default: MbytePerSec.
Valid Values:

* MbitPerSec
* MbytePerSec
* KbytePerSec

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSpeedUnit]`|false   |named   |False        |

#### **ThrottlingValue**
Used to set the value for the EnableThrottling parameter. Specifies the maximum bandwidth value in Mbps for transferring the tenant data to the SP side.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Decimal]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudTenant [-BackupProtectionPeriod <Int32>] -CloudTenant <VBRCloudTenant> [-Description <String>] [-EnableBackupProtection] [-EnableGatewayFailover] [-EnableLeaseExpiration] 
```
```PowerShell
[-EnableReplicationResorces] [-EnableResources] [-EnableThrottling] [-Force] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] [-HashedPassword] 
```
```PowerShell
[-LeaseExpirationDate <DateTime>] [-MaxConcurrentTask <Int32>] [-Name <String>] [-PassThru] [-Password <String>] [-ReplicationResources <VBRCloudTenantReplicationResources>] [-Resources 
```
```PowerShell
<VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Decimal>] [<CommonParameters>]
```
