Get-VBRCloudTenantNetworkAppliance
----------------------------------

### Synopsis
Returns network extension appliances.

---

### Description

This cmdlet returns network extension appliances. You can get the network extension appliance for the cloud tenants of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example 1. Getting All Network Appliances

```PowerShell
Get-VBRCloudTenantNetworkAppliance
This command returns all tenant network appliances.
```
> Example 2. Getting Network Appliances for Selected Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Get-VBRCloudTenantNetworkAppliance -Tenant $tenant
This example shows how to return network appliances of a selected tenant.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save it to the $tenant variable.
2. Run the Get-VBRCloudTenantNetworkAppliance cmdlet. Set the $tenant variable as the Tenant parameter value.
> Example 3. Getting Network Appliances for Selected Host

$server = Get-VBRServer -Name "srv01.tech.local"
Get-VBRCloudTenantNetworkAppliance -Server $server
This example shows how to return network appliances deployed on a selected host.

Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the host to the $server variable.
2. Run the Get-VBRCloudTenantNetworkAppliance cmdlet. Set the $server variable as the Server parameter value.

---

### Parameters
#### **Name**
Specifies the array of names of the appliance.  The cmdlet will return appliances with these names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Server**
Specifies an array of hosts. The cmdlet will return appliances that uses these hosts. Accepts the CHost[] object.  To get this object, run the Get-VBRServer cmdlet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |named   |False        |

#### **Tenant**
Specifies an array of tenants. The cmdlet will return appliances assigned to these tenants. Accepts the VBRCloudTenant[] object.  To get this object, run the Get-VBRCloudTenant cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudTenant[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudTenantNetworkAppliance [-Name <String[]>] [-Server <Object[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRCloudTenantNetworkAppliance [-Name <String[]>] [-Tenant <IVBRCloudTenant[]>] [<CommonParameters>]
```
