Add-VBRAdCloudTenant
--------------------

### Synopsis
Creates Active Directory tenant accounts.

---

### Description

This cmdlet creates Active Directory tenant accounts.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRCloudTenantResource](New-VBRCloudTenantResource)

---

### Examples
> Adding Active Directory Tenant Account

$repository = Get-VBRBackupRepository -Name "SilverRepository"
$backupresources = New-VBRCloudTenantResource -Repository $repository -RepositoryFriendlyName "Standard Tier Repository" -Quota 10
Add-VBRAdCloudTenant -Name "tech\jane.doe" -Domain "tech.local" -DomainUrl "users.tech.local" -DomainUsername "Administrator" -DomainUserPassword "SecurePa$$" -Resources $backupresources
This example shows how to create the jane.doe Active Directory tenant account with the following settings:
- The backup resources option is enabled.
- The user is located on the tech.local domain controller.
- The URL of the domain controller is dc01.tech.local.
- Veeam Backup & Replication uses the Administrator user and the SecurePa$$ password to verify that the jane.doe user is added to the dc01.tech.local domain.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the New-VBRCloudTenantResource cmdlet. Specify the Repository, RepositoryFriendlyName and the Quota parameter values. Save the result to the $backupresources variable.
3. Run the Add-VBRaDCloudTenant cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Specify the Domain parameter value.
- Specify the DomainUrl parameter value.
- Specify the DomainUsername parameter value.
- Specify the DomainUserPassword parameter value.
- Set the $backupresources variable as the Resources parameter value.

---

### Parameters
#### **BackupProtectionPeriod**
For the EnableBackupProtection parameter. Specifies the number of days to keep the tenant's deleted backups on the service provider side. Can be set to 1-99.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies the description of the simple tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Domain**
Specifies a domain name where an Active Directory user is located.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **DomainCredentials**
Specifies the credentials that the cmdlet will use to connect to the domain controller. Accepts the CCredentials object. To get this object, run the Get-VBRCredentials cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **DomainPort**
Specifies a port number which will be used to connect to the domain.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **DomainUrl**
Specifies a URL of the Domain Controller. The cmdlet will connect to this domain controller to verify that the user, for whom you want to create a tenant account, exists in Active Directory and this user is available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

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
Prevents the tenant's backups from complete removal. With this option, the tenant's deleted backups will be placed to the recycle bin on the service provider's side. The backups will be kept in the bin for the specified protection period. When this period ends, the backups are removed permanently. To specify the protection period, provide the BackupProtectionPeriod parameter.

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

#### **EnableThrottling**
Enables the network throttling to set the bandwidth limitations. Provide the ThrottlingValue and ThrottlingUnit parameters to set the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayPool**
Specifies the gateway pool. Veeam Backup & Replication will route the data through the specified gateway pool.  Accepts the VBRCloudGatewayPool[] object. To create this object, run the Get-VBRCloudGatewayPool cmdlet.

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

#### **Name**
Specifies an Active Directory user for which you want to create a tenant account. The cmdlet will create a tenant account with this user.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Resources**
Specifies an array of backup resource quotas you want to allocate to the simple tenant account. You must set the Resources or the ReplicationResources parameter, or a combination of both, to create a tenant.  Note: When you assign multiple resource quotas to one tenant account, the resource quotas must have unique Repository Friendly Names and they must use different repositories.  Accepts the VBRCloudTenantResource[] object. To create this object, run the New-VBRCloudTenantResource cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|false   |named   |False        |

#### **ThrottlingUnit**
For the EnableThrottling option.
Specifies the measure units for the bandwidth value. You can select either of the following:
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
Defines that the cmdlet will use the service account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Add-VBRAdCloudTenant [-BackupProtectionPeriod <Int32>] [-Description <String>] -Domain <String> [-DomainCredentials <CCredentials>] [-DomainPort <Int32>] -DomainUrl <String> [-EnableBackupProtection] 
```
```PowerShell
[-EnableGatewayFailover] [-EnableLeaseExpiration] [-EnableThrottling] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] [-LeaseExpirationDate <DateTime>] 
```
```PowerShell
[-MaxConcurrentTask <Int32>] -Name <String> [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Decimal>] [<CommonParameters>]
```
```PowerShell
Add-VBRAdCloudTenant [-BackupProtectionPeriod <Int32>] [-Description <String>] -Domain <String> [-DomainPort <Int32>] -DomainUrl <String> [-DomainUsername <String>] [-DomainUserPassword <String>] 
```
```PowerShell
[-EnableBackupProtection] [-EnableGatewayFailover] [-EnableLeaseExpiration] [-EnableThrottling] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] 
```
```PowerShell
[-LeaseExpirationDate <DateTime>] [-MaxConcurrentTask <Int32>] -Name <String> [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Decimal>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Add-VBRAdCloudTenant [-BackupProtectionPeriod <Int32>] [-Description <String>] -Domain <String> [-DomainPort <Int32>] -DomainUrl <String> [-EnableBackupProtection] [-EnableGatewayFailover] 
```
```PowerShell
[-EnableLeaseExpiration] [-EnableThrottling] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] [-LeaseExpirationDate <DateTime>] [-MaxConcurrentTask <Int32>] 
```
```PowerShell
-Name <String> [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Decimal>] [-UseServiceAccount] [<CommonParameters>]
```
