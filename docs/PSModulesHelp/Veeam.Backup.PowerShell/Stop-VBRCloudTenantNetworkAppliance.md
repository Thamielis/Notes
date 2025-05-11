Stop-VBRCloudTenantNetworkAppliance
-----------------------------------

### Synopsis
Disables network extension appliances.

---

### Description

This cmdlet disables network extension appliances from the Service Provider side after a permanent failover.

---

### Related Links
* [Get-VBRCloudTenantNetworkAppliance](Get-VBRCloudTenantNetworkAppliance)

* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example - Disabling Network Extension Appliances of Selected Tenant

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$appliance = Get-VBRCloudTenantNetworkAppliance -Tenant $tenant
Stop-VBRCloudTenantNetworkAppliance -Appliance $appliance
This example shows how to disable network extension appliances of the ABC Company tenant.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudTenantNetworkAppliance cmdlet. Set the $tenant variable as the Tenant parameter value. Save the result to the $appliance variable.
3. Run the Stop-VBRCloudTenantNetworkAppliance cmdlet. Set the $appliance variable as the Appliance parameter value.

---

### Parameters
#### **Appliance**
Specifies an array of network extension appliances that you want to disable.  Accepts the VBRCloudTenantNetworkAppliance[] object. To get this object, run the Get-VBRCloudTenantNetworkAppliance cmdlet.

|Type                                |Required|Position|PipelineInput |
|------------------------------------|--------|--------|--------------|
|`[VBRCloudTenantNetworkAppliance[]]`|true    |named   |True (ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenantNetworkAppliance[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Stop-VBRCloudTenantNetworkAppliance -Appliance <VBRCloudTenantNetworkAppliance[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
