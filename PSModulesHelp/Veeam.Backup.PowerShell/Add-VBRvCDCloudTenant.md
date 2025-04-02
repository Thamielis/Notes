Add-VBRvCDCloudTenant
---------------------

### Synopsis
Creates VMware Cloud Director tenant accounts.

---

### Description

This cmdlet creates vCD cloud tenant accounts.

To set up replica resources for vCD cloud tenant accounts, you must perform the following steps:
1. Create the Organization vCD in your VMware vCloud Director.
2. Allocate the required Organization vCD the vCD cloud tenant account.
Run the New-VBRvCDOrganizationvDCOptions cmdlet to specify the Organization vDC that you want to allocate to the vCD cloud tenant. Run the New-VBRvCDReplicationResource cmdlet to specify the replication resource settings.

Important! You cannot specify the name and the password for vCD cloud tenant accounts.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

* [New-VBRvCDOrganizationvDCOptions](New-VBRvCDOrganizationvDCOptions)

* [New-VBRvCDReplicationResource](New-VBRvCDReplicationResource)

---

### Examples
> Creating vCD Cloud Tenant Account with Replication Resources

$orgvdc = Find-VBRvCloudEntity -OrganizationVdc -Name "VDC 01"
$dco = New-VBRvCDOrganizationvDCOptions -OrganizationvDC $orgvcd
$org = Find-VBRvCloudEntity -Organization -Name "Organization 05"
$replicas = New-VBRvCDReplicationResource -OrganizationvDCOptions $dco
Add-VBRvCDCloudTenant -vCDOrganization $org -vCDReplicationResource $replicas
This example shows how to create a vCD cloud tenant account with the replication resources.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Provide the OrganizationVdc parameter. Specify the Name parameter value. Save the result to the $orgvdc variable.
2. Run the New-VBRvCDOrganizationvDCOptions cmdlet. Set the $orgvdc variable as the OrganizationvDC parameter value. Save the result to the $dco variable.
3. Run the Find-VBRvCloudEntity cmdlet. Provide the Organization parameter. Specify the Name parameter value. Save the result to the $org variable.
4. Run the New-VBRvCDReplicationResource cmdlet. Set the $dco variable as the OrganizationvDCOptions parameter value. Save the result to the $replicas variable.
5. Run the Add-VBRvCDCloudTenant cmdlet. Set the $org variable as the vCDOrganization parameter value. Set the $replicas variable as the vCDReplicationResource parameter value.

---

### Parameters
#### **BackupProtectionPeriod**
For the EnableBackupProtection parameter. Specifies the number of days to keep the tenant's deleted backups on the service provider side. Can be set to 1-99.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Description**
Specifies a description of the vCD cloud tenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupProtection**
Enables protection for the tenant's backups from complete removal. If you provide this parameter, the tenant's deleted backups will be placed to the recycle bin on the service provider's side.  The backups will be kept in the bin for the specified protection period.  When this period ends, the backups are removed permanently. To specify the protection period, use the BackupProtectionPeriod parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableGatewayFailover**
Enables the gateway pool failover option.  In case the gateway pool is down, Veeam Backup & Replication will transfer data through a gateway, that is not added to any gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableLeaseExpiration**
Defines that a vCD cloud tenant account must use lease expiration settings. Use the LeaseExpirationDate parameter to set the lease expiration date.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnableThrottling**
Enables network throttling to set the bandwidth limitations. Use the ThrottlingValue and ThrottlingUnit parameters to set the maximum value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GatewayPool**
Specifies a gateway pool. Veeam Backup & Replication will route data through the specified gateway pool. Accepts the VBRCloudGatewayPool[] object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRCloudGatewayPool[]]`|false   |named   |False        |

#### **GatewaySelectionType**
Specifies the type of the cloud gateway that you want to assign to vCD cloud tenant accounts.
* StandaloneGateways - use this option to transfer data through a cloud gateway that is not added to a cloud gateway pool.
* GatewayPool - use this option to transfer data through a cloud gateway pool.
Valid Values:

* StandaloneGateways
* GatewayPool

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[VBRCloudGatewaySelectionType]`|false   |named   |False        |

#### **MaxConcurrentTask**
Specifies the maximum number of tasks that the vCD cloud tenant account can process in parallel. The number of tasks is the number of VM disks processed by one job targeted at the cloud repository or cloud host.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Resources**
Specifies an array of backup resource quotas that you want to allocate to the vCD cloud tenant accounts. NOTE:
* You must set the Resources or the vCDReplicationResource parameter, or a combination of both, to create a vCD cloud tenant account.
* When you assign multiple resource quotas to one vCD cloud tenant account, the resource quotas must have unique Repository Friendly Names and they must use different repositories.
Accepts the VBRCloudTenantResource[] object. To get this object, run the New-VBRCloudTenantResource cmdlet.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRCloudTenantResource[]]`|false   |named   |False        |

#### **ThrottlingUnit**
For the EnableThrottling option. Specifies measure units for the bandwidth value. You can select either of the following:
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

#### **vCDOrganization**
Specifies the vCD organization. NOTE: you must configure the vCD Cloud organization in vCloud Director beforehand. Accepts the CVcdOrganizationItem object. To get this object, run the Find-VBRvCloudEntity cmdlet.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[CVcdOrganizationItem]`|true    |named   |False        |

#### **vCDReplicationResource**
Specifies vDC replication resources, that you want to allocate to the vCD cloud tenant accounts. Accepts the VBRvCDReplicationResource object. To get this object, run the New-VBRvCDReplicationResource cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCDReplicationResource]`|false   |named   |False        |

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
Add-VBRvCDCloudTenant [-BackupProtectionPeriod <Int32>] [-Description <String>] [-EnableBackupProtection] [-EnableGatewayFailover] [-EnableLeaseExpiration] [-EnableThrottling] [-GatewayPool 
```
```PowerShell
<VBRCloudGatewayPool[]>] [-GatewaySelectionType {StandaloneGateways | GatewayPool}] [-MaxConcurrentTask <Int32>] [-Resources <VBRCloudTenantResource[]>] [-ThrottlingUnit {MbitPerSec | MbytePerSec | 
```
```PowerShell
KbytePerSec}] [-ThrottlingValue <Decimal>] -vCDOrganization <CVcdOrganizationItem> [-vCDReplicationResource <VBRvCDReplicationResource>] [<CommonParameters>]
```
