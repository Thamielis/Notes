Add-VBRCloudTenant
------------------

### Synopsis
Creates standalone tenant accounts.

---

### Description

This cmdlet creates new simple cloud tenant accounts.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRCloudTenantResource](New-VBRCloudTenantResource)

* [New-VBRCloudTenantReplicationResources](New-VBRCloudTenantReplicationResources)

---

### Examples
> Example 1. Creating Cloud Tenant Account

$repository = Get-VBRBackupRepository -Name "SilverRepository"
$backupresources = New-VBRCloudTenantResource -Repository $repository -RepositoryFriendlyName "Standard Tier Repository" -Quota 10
Add-VBRCloudTenant -Name "ABC Company" -Description "User account for ABC company" -EnableLeaseExpiration -LeaseExpirationDate "12/30/2024" -Password "Pass123" -Resources $backupresources
This example shows how to create a simple cloud tenant account. The cmdlet will create the tenant with the following settings:
- Backup resources option enabled
- Lease expiration settings enabled
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the New-VBRCloudTenantResource cmdlet. Set the $repository variable as the Repository parameter value. Specify the RepositoryFriendlyName and Quota parameter values. Save the result to the $backupresources variable.
3. Run the Add-VBRCloudTenant cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Description parameter value.
- Provide the EnableLeaseExpiration parameter.
- Specify the LeaseExpirationDate parameter value.
- Specify the Password parameter value.
- Set the $backupresources variable as the Resources parameter value.
> Example 2. Creating Cloud Tenant Account with Backup and Replication Resources

$repository = Get-VBRBackupRepository -Name "SilverRepository"
$backupresources = New-VBRCloudTenantResource -Repository $repository -RepositoryFriendlyName "Standard Tier Repository" -Quota 10
$replicationresources = New-VBRCloudTenantReplicationResources -EnableNetworkFailoverResources
Add-VBRCloudTenant -Name "ABC Company" -Description "User account for ABC company" -Password "Pass123" -Resources $backupresources -ReplicationResources $replicationresources
This example shows how to create a simple cloud tenant account with backup and replication resources.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the New-VBRCloudTenantResource cmdlet. Set the $repository variable as the Repository parameter value. Specify the RepositoryFriendlyName and the Quota parameter values. Save the result to the $backupresources variable.
3. Run the New-VBRCloudTenantReplicationResources cmdlet. Provide the EnableNetworkFailoverResources parameter. Save the result to the $replicationresources variable.
4. Run the Add-VBRCloudTenant cmdlet. Specify the following settings:
- Specify the Name and the Description parameter values.
- Specify the Password parameter value.
- Set the $backupresources variable as Resources parameter value.
- Set the $replicationresources variable as ReplicationResources parameter value.

---

### Parameters
#### **BackupProtectionPeriod**
For the EnableBackupProtection parameter. Specifies the number of days to keep the tenant`s deleted backups on the service provider side. Can be set to 1-99 days.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies the description of the tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupProtection**
Enables protection for the tenant's backups from complete removal. If you provide this parameter, the tenant's deleted backups will be placed to the recycle bin on the service provider's side.  The backups will be kept in the bin for the specified protection period. When this period ends, the backups are removed permanently. To specify the protection period, use the BackupProtectionPeriod parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGatewayFailover**
Enables gateway pool failover option. In case the gateway pool is down, Veeam Backup & Replication will route the data through the gateway that is not added to any gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableLeaseExpiration**
Enables lease expiration settings for the simple tenant account. Use LeaseExpirationDate parameter to set the lease expiration date.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableThrottling**
Enables the network throttling to set the bandwidth limitations. Use the ThrottlingValue and ThrottlingUnit parameters to set the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayPool**
Specifies the gateway pool. Veeam Backup & Replication will route the data through the specified gateway pool. Accepts the VBRCloudGatewayPool[] object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCloudGatewayPool[]]`|false   |named   |False        |

#### **GatewaySelectionType**
Specifies the type of gateway, you want to assign to the vCD cloud tenant accounts.
* StandaloneGateways - use this option to route the data through the gateway that is not added to the gateway pool.
* GatewayPool - use this option to route the data through the gateway pool.
Valid Values:

* StandaloneGateways
* GatewayPool

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCloudGatewaySelectionType]`|false   |named   |False        |

#### **HashedPassword**
Defines that you submit the hashed password. The hashed passwords are stored in Veeam backup database.  Use this parameter, for example, to restore tenant accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LeaseExpirationDate**
For the EnableLeaseExpiration option. Specifies the lease expiration date. Default: 23:59:59.9999999, 31.12.9999.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **MaxConcurrentTask**
Specifies the maximum number of tasks the tenant can process in parallel.  The number of tasks is the number of VM disks processed by one job targeted at the cloud repository or cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies the name that you want to assign to the simple tenant account. The tenant name must meet the following requirements:
* The maximum length of the tenant name is 128 characters. It is recommended that you create short tenant names to avoid problems with long paths to backup files on the cloud repository.
* The tenant name may contain space characters.
* The tenant name must not contain the following characters: \/:*?\"<>|=; as well as Unicode characters.
* The tenant name must not end with the period character [.].

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to set to the tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **ReplicationResources**
Allocates replication resources to the tenant. You must set the Resources or the ReplicationResources parameter, or a combination of both, to create a tenant. Accepts the VBRCloudTenantReplicationResources object. To get this object, run the New-VBRCloudTenantReplicationResources cmdlet.

|Type                                  |Required|Position|PipelineInput|
|--------------------------------------|--------|--------|-------------|
|`[VBRCloudTenantReplicationResources]`|false   |named   |False        |

#### **Resources**
Specifies the array of backup resource quotas you want to allocate to the simple tenant account. You must set the Resources or the ReplicationResources parameter, or a combination of both, to create a tenant. NOTE: When you assign multiple resources settings to one tenant account, the resources must have unique Repository Friendly Names and they must use different repositories. Accepts the VBRCloudTenantResource[] object. To get this object, run the New-VBRCloudTenantResource cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|false   |named   |False        |

#### **ThrottlingUnit**
For the EnableThrottling option. Specifies the measure units for the bandwidth value. You can select either of the following: MbitPerSec, MbytePerSec, KbytePerSec. Default: MbytePerSec.
Valid Values:

* MbitPerSec
* MbytePerSec
* KbytePerSec

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSpeedUnit]`|false   |named   |False        |

#### **ThrottlingValue**
For the EnableThrottling option. Specifies the maximum bandwidth value in Mbps for transferring the tenant data to the SP side.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Decimal]`|false   |named   |False        |

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
Add-VBRCloudTenant [-BackupProtectionPeriod <Int32>] [-Description <String>] [-EnableBackupProtection] [-EnableGatewayFailover] [-EnableLeaseExpiration] [-EnableThrottling] [-GatewayPool 
```
```PowerShell
<VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] [-HashedPassword] [-LeaseExpirationDate <DateTime>] [-MaxConcurrentTask <Int32>] -Name <String> -Password <String> 
```
```PowerShell
[-ReplicationResources <VBRCloudTenantReplicationResources>] [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Decimal>] [<CommonParameters>]
```
