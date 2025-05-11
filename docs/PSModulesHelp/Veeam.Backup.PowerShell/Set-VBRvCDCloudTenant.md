Set-VBRvCDCloudTenant
---------------------

### Synopsis
Modifies VMware Cloud Director tenant accounts.

---

### Description

This cmdlet modifies vCD cloud tenant account settings. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [Get-VBRCloudGatewayPool](Get-VBRCloudGatewayPool)

* [New-VBRvCDReplicationResource](New-VBRvCDReplicationResource)

---

### Examples
> Example - Modifying vCD Cloud Tenant Account

$tenant = Get-VBRCloudTenant -Name vCDTenant
$pool= Get-VBRCloudGatewayPool
Set-VBRvCDCloudTenant -vCDCloudTenant $tenant -GatewaySelectionType GatewayPool -GatewayPool $pool -EnableThrottling -ThrottlingValue 90 -ThrottlingUnit MbitPerSec
This example shows how to modify a vCD cloud tenant account. The cmdlet enables the following options:
- Route the data through a cloud gateway pool
- Enable network throttling
- The maximum bandwidth value is set to 50 Mbps
Perform the following steps: 1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudGatewayPool cmdlet. Save the result to the $pool variable.
3. Run the Set-VBRvCDCloudTenant cmdlet. Specify the following settings:
- Set the $tenant variable as the vCDCloudTenant parameter value.
- Set the GatewayPool option for the GatewaySelectionType parameter.
- Set the $pool variable as the GatewayPool parameter value.
- Provide the EnableThrottling parameter.
- Specify the ThrottlingValue parameter value.
- Set the MbitPerSec value as the ThrottlingUnit parameter value.

---

### Parameters
#### **BackupProtectionPeriod**
For the EnableBackupProtection parameter. Specifies the number of days to keep the vCD cloud tenant's deleted backups on the service provider side. Can be set to 1-99.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies a description of vCD cloud tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupProtection**
Enables protection for the tenant's backups from complete removal. If you provide this parameter, the tenant's deleted backups will be placed to the recycle bin on the service provider's side.  The backups will be kept in the bin for the specified protection period.  When this period ends, the backups are removed permanently. To specify the protection period, use the BackupProtectionPeriod parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGatewayFailover**
Enables the gateway pool failover option. In case the gateway pool is down, Veeam Backup & Replication will route the data through the gateway that is not added to any gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableLeaseExpiration**
Enables lease expiration settings for the vCD cloud tenant account. Use the LeaseExpirationDate parameter to set the lease expiration date.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableResources**
Enables the backup resources option for the vCD cloud tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableThrottling**
Enables network throttling to set the bandwidth limitations. Use the ThrottlingValue and ThrottlingUnit parameters to set the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnablevCDReplicationResources**
Enables vDC replication resources that you want to allocate to the vCD cloud tenant accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify vCD cloud tenant accounts even if the geographic location of the repositories where VM backups reside and the target repository location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayPool**
Specifies a gateway pool. Veeam Backup & Replication will route the data through the specified gateway pool. Accepts the VBRCloudGatewayPool[] object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCloudGatewayPool[]]`|false   |named   |False        |

#### **GatewaySelectionType**
Specifies the type of gateway that you want to assign to the vCD cloud tenant accounts:
* StandaloneGateways - use this option to route the data through the gateway that is not added to the gateway pool.
* GatewayPool - use this option to route the data through the gateway pool.
Valid Values:

* StandaloneGateways
* GatewayPool

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCloudGatewaySelectionType]`|false   |named   |False        |

#### **LeaseExpirationDate**
For the EnableLeaseExpiration parameter. Specifies the lease expiration date. Default: 23:59:59.9999999, 31.12.9999.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |False        |

#### **MaxConcurrentTask**
Specifies the maximum number of tasks that the vCD cloud tenant accounts can process in parallel. The number of tasks is the number of VM disks processed by one job targeted at the cloud repository or cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Resources**
Specifies the array of backup resource quotas that you want to allocate to the vCD cloud tenant account. Note: When you assign multiple backup resource quotas to one tenant account, the resource quotas must have unique Repository Friendly Names and they must use different repositories. Accepts the VBRCloudTenantResource[] object. To get this object, run the New-VBRCloudTenantResource cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|false   |named   |False        |

#### **ThrottlingUnit**
For the EnableThrottling option. Specifies the measure units for the bandwidth value. You can select either of the following:
* MbitPerSec
* MbytePerSec
* KbytePerSec
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

#### **vCDCloudTenant**
Specifies a vCD cloud tenant account that you want to modify. Accepts the VBRvCDCloudTenant object. To get this object, run the Get-VBRCloudTenant cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRvCDCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

#### **vCDReplicationResource**
Specifies vDC replication resources that you want to allocate to the vCD cloud tenant accounts. Accepts the VBRvCDReplicationResource object. To get this object, run the New-VBRvCDReplicationResource cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDReplicationResource]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRvCDCloudTenant [-BackupProtectionPeriod <Int32>] [-Description <String>] [-EnableBackupProtection] [-EnableGatewayFailover] [-EnableLeaseExpiration] [-EnableResources] [-EnableThrottling] 
```
```PowerShell
[-EnablevCDReplicationResources] [-Force] [-GatewayPool <VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] [-LeaseExpirationDate <DateTime>] [-MaxConcurrentTask <Int32>] 
```
```PowerShell
[-PassThru] [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | KbytePerSec}] [-ThrottlingValue <Decimal>] -vCDCloudTenant <VBRvCDCloudTenant> [-vCDReplicationResource 
```
```PowerShell
<VBRvCDReplicationResource>] [<CommonParameters>]
```
