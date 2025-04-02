Enable-VBRCloudTenant
---------------------

### Synopsis
Enables disabled cloud tenant accounts.

---

### Description

This cmdlet enables selected cloud tenant accounts that were previously disabled. You can enable the cloud tenants accounts of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts
Run the Disable-VBRCloudTenant cmdlet to disable the tenant account.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example 1. Enabling vCD Cloud Tenant Account

$tenant = Get-VBRCloudTenant -Name "vCD Tenant"
Enable-VBRCloudTenant -CloudTenant $tenant
This example shows how to enable a vCD cloud tenant account.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter. Save the result to the $tenant variable.
2. Run the Enable-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value.
> Example 2. Enabling Several Cloud Tenant Accounts

$cloudtenants = Get-VBRCloudTenant -Name "ABC Company Tenant", "vCD Tenant"
Enable-VBRCloudTenant -CloudTenant $cloudtenants
This example shows how to enable several cloud tenant accounts.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter. Save the result to the $cloudtenants variable.
2. Run the Enable-VBRCloudTenant cmdlet. Set the $cloudtenants variable as the CloudTenant parameter value.

---

### Parameters
#### **CloudTenant**
Specifies an array of the tenant accounts you want to enable. Accepts the VBRCloudTenant[] object. To get this object, run the Get-VBRCloudTenant cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.IVBRCloudTenant[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRCloudTenant -CloudTenant <IVBRCloudTenant[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
