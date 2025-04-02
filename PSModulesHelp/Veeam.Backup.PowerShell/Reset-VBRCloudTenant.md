Reset-VBRCloudTenant
--------------------

### Synopsis
Resets licenses for cloud account tenants.

---

### Description

This cmdlet resets cloud account tenant license. You can reset the license for the cloud tenant accounts of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example 1. Resetting License for Simple Cloud Tenant

$simpletenant = Get-VBRCloudTenant -Name "ABC Company"
Reset-VBRCloudTenant -CloudTenant $simpletenant
This example shows how to reset a license for the simple cloud tenant.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $simpletenant variable.
2. Run the Reset-VBRCloudTenant cmdlet. Set the $simpletenant variable as the CloudTenant parameter value.
> Example 2. Resetting License for vCD Cloud Tenant

$CloudUsers = Get-VBRCloudTenant -Name "CloudUser*"
Reset-VBRCloudTenant -CloudTenant $CloudUsers
This example shows how to reset a license for the vCD cloud tenant account.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $CloudUsers variable.
2. Run the Reset-VBRCloudTenant cmdlet. Set the $CloudUsers variable as the CloudTenant parameter value.

---

### Parameters
#### **CloudTenant**
Specifies the array of tenant accounts for which you want to reset the tenant license. Accepts the VBRCloudTenant[] object. To get this object, run the Get-VBRCloudTenant cmdlet.

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
Reset-VBRCloudTenant -CloudTenant <IVBRCloudTenant[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
