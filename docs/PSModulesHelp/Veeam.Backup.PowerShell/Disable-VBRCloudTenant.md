Disable-VBRCloudTenant
----------------------

### Synopsis
Disables cloud tenant accounts.

---

### Description

This cmdlet disables a cloud tenant account. When you disable a tenant account, the tenant cannot use their account resources. You can disable the cloud tenant accounts of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts
Run the Enable-VBRCloudTenant cmdlet to enable a disabled account.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example 1. Disabling vCD Cloud Tenant Account

$tenant = Get-VBRCloudTenant -Name "vCD Tenant"
Disable-VBRCloudTenant -CloudTenant $tenant
This example shows how to disable a vCD cloud tenant account.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter. Save the result to the $tenant variable.
2. Run the Disable-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value.
> Example 2. Disabling Several Cloud Tenant Accounts

$tenant = Get-VBRCloudTenant -Name "ABC Company Tenant", "vCD Tenant"
Disable-VBRCloudTenant -CloudTenant $tenant
This example shows how to disable several cloud tenant accounts.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Disable-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value.

---

### Parameters
#### **CloudTenant**
Specifies an array of tenant accounts that you want to disable. Accepts the VBRCloudTenant[] object. To get this object, run the Get-VBRCloudTenant cmdlet.

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
Disable-VBRCloudTenant -CloudTenant <IVBRCloudTenant[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
