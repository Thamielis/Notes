Set-VBRAdCloudTenant
--------------------

### Synopsis
Modifies Active Directory tenant accounts.

---

### Description

This cmdlet modifies Active Directory tenant accounts.

To modify settings, specify new values for the necessary parameters.  The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Modifying Active Directory Tenant Account

$tenant = Get-VBRCloudTenant -Name "tech\jane.doe"
Set-VBRAdCloudTenant -CloudTenant $tenant -EnableBackupProtection -BackupProtectionPeriod "10"
This example shows how to modify the jane.doe Active Directory tenant account. The cmdlet will enable the backup protection option to keep the tenant deleted backups on the on the service provider side for 14 days.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Set-VBRAdCloudTenant cmdlet. Specify the following settings:
- Set the $tenant variable as the CloudTenant parameter value.
- Provide the EnableBackupProtection parameter.
- Specify the BackupProtectionPeriod parameter value.

---

### Parameters
#### **BackupProtectionPeriod**
For the EnableBackupProtection parameter. Specifies the number of days to keep the tenant deleted backups on the service provider side. Permitted values: 1-99.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **CloudTenant**
Specifies an Active Directory tenant account that you want to modify. Accepts the VBRAdCloudTenant object. To create this object, run the Get-VBRCloudTenant cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRAdCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies the description of the simple tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DomainCredentials**
Specifies that the cmdlet will use the domain credentials to connect to the domain controller.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DomainPort**
Specifies a port number which will be used to connect to the domain.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **DomainUrl**
Specifies a URL of the domain controller. The cmdlet will connect to this domain controller to verify that the user, for whom you want to create a tenant account, exists in Active Directory and this user is available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DomainUsername**
Specifies a name of a user who has permissions to get a list of the users from the domain controller.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **DomainUserPassword**
Specifies a password of a user who has permissions to get a list of the users from the domain controller.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupProtection**
Prevents the tenant backups from complete removal. With this option, the tenant's deleted backups will be placed to the recycle bin on the service provider's side. The backups will be kept in the bin for the specified protection period. When this period ends, the backups are removed permanently. To specify the protection period, provide the BackupProtectionPeriod parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGatewayFailover**
Enables gateway pool failover option. In case the gateway pool is down, Veeam Backup & Replication will route the data through the gateway that is not added to any gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableLeaseExpiration**
Defines that an Active Directory tenant account must use lease expiration settings. Provide the LeaseExpirationDate parameter to set the lease expiration date.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableResources**
Defines that the cmdlet will assign cloud repository resources to the tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableThrottling**
Enables the network throttling to set the bandwidth limitations. Provide the ThrottlingValue and ThrottlingUnit parameters to set the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayPool**
Specifies the array of the gateway pools.  Veeam Backup & Replication will route the data through the specified gateway pool.  Accepts the VBRCloudGatewayPool[] object. To create this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCloudGatewayPool[]]`|false   |named   |False        |

#### **GatewaySelectionType**
Specifies the type of gateway, you want to assign to the vCD cloud tenant accounts:
* StandaloneGateways - use this option to route the data through the gateway that is not added to the gateway pool.
* GatewayPool - use this option to route the data through the gateway pool.
Valid Values:

* StandaloneGateways
* GatewayPool

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCloudGatewaySelectionType]`|false   |named   |False        |

#### **HashedPassword**
Defines that you submit the hashed password. The hashed passwords are stored in the Veeam backup database. Use this parameter, for example, to restore tenant accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **LeaseExpirationDate**
For the EnableLeaseExpiration option. Specifies the lease expiration date. Default: 23:59:59.9999999, 31.12.9999.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **MaxConcurrentTask**
Specifies the maximum number of tasks the tenant can process in parallel. The number of tasks is the number of VM disks processed by one job targeted at the cloud repository or cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Resources**
Specifies an array of backup resource quotas you want to allocate to the simple tenant account. You must set the Resources or the ReplicationResources parameter, or a combination of both, to create a tenant.  Note: When you assign multiple resource quotas to one tenant account, the resource quotas must have unique Repository Friendly Names and they must use different repositories. Accepts the VBRCloudTenantResource[] object. To create this object, run the New-VBRCloudTenantResource cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|false   |named   |False        |

#### **ThrottlingUnit**
For the EnableThrottling option. Specifies the measure units for the bandwidth value. You can select either of the following:
* MbitPerSec
* MbytePerSec
* KbytePerSec
Default: MbytePerSec.
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

#### **UseServiceAccount**
Defines that the cmdlet will use the account under which the Veeam Backup Service runs to connect to the domain controller.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAdCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAdCloudTenant [-BackupProtectionPeriod <Int32>] -CloudTenant <VBRAdCloudTenant> [-Description <String>] [-DomainCredentials <CCredentials>] [-DomainPort <Int32>] [-DomainUrl <String>] 
```
```PowerShell
[-EnableBackupProtection] [-EnableGatewayFailover] [-EnableLeaseExpiration] [-EnableResources] [-EnableThrottling] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | 
```
```PowerShell
GatewayPool}] [-HashedPassword] [-LeaseExpirationDate <DateTime>] [-MaxConcurrentTask <Int32>] [-PassThru] [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] 
```
```PowerShell
[-ThrottlingValue <Decimal>] [<CommonParameters>]
```
```PowerShell
Set-VBRAdCloudTenant [-BackupProtectionPeriod <Int32>] -CloudTenant <VBRAdCloudTenant> [-Description <String>] [-DomainPort <Int32>] [-DomainUrl <String>] [-DomainUsername <String>] [-DomainUserPassword 
```
```PowerShell
<String>] [-EnableBackupProtection] [-EnableGatewayFailover] [-EnableLeaseExpiration] [-EnableResources] [-EnableThrottling] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | 
```
```PowerShell
GatewayPool}] [-HashedPassword] [-LeaseExpirationDate <DateTime>] [-MaxConcurrentTask <Int32>] [-PassThru] [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] 
```
```PowerShell
[-ThrottlingValue <Decimal>] [<CommonParameters>]
```
```PowerShell
Set-VBRAdCloudTenant [-BackupProtectionPeriod <Int32>] -CloudTenant <VBRAdCloudTenant> [-Description <String>] [-DomainPort <Int32>] [-DomainUrl <String>] [-EnableBackupProtection] [-EnableGatewayFailover] 
```
```PowerShell
[-EnableLeaseExpiration] [-EnableResources] [-EnableThrottling] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] [-HashedPassword] [-LeaseExpirationDate 
```
```PowerShell
<DateTime>] [-MaxConcurrentTask <Int32>] [-PassThru] [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Decimal>] [-UseServiceAccount] 
```
```PowerShell
[<CommonParameters>]
```
