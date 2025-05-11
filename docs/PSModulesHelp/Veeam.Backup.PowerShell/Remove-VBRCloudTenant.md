Remove-VBRCloudTenant
---------------------

### Synopsis
Removes cloud tenant accounts.

---

### Description

This cmdlet removes cloud tenant accounts. You can remove the accounts of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts
The tenant account is removed permanently from Veeam Backup & Replication. The service provider cannot undo this operation. When you remove a cloud tenant account that was using WAN accelerators, the WAN accelerators' cache is cleared automatically.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

---

### Examples
> Example 1. Removing All Cloud Tenant Accounts

$cloudtenants = Get-VBRCloudTenant
Remove-VBRCloudTenant -CloudTenant $cloudtenants
This example shows how to remove all cloud tenant accounts registered in Veeam Backup & Replication.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Save the result to the $cloudtenants variable.
2. Run the Remove-VBRCloudTenant cmdlet. Set the $cloudtenants variable as the CloudTenant parameter value.
> Example 2. Removing vCD Cloud Tenant Account

$vCDtenant = Get-VBRCloudTenant -Name "vCD Tenant"
Remove-VBRCloudTenant -CloudTenant $vCDtenant
This example shows how to remove a vCD cloud tenant account.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet.  Specify the Name parameter value. Save the result to the $vCDtenant variable.
2. Run the Remove-VBRCloudTenant cmdlet. Set the $vCDtenant variable as the CloudTenant parameter value.
> Example 3. Removing All Cloud Tenant Accounts by Repository

$repository = Get-VBRBackupRepository -Name "Backups Vol2"
$tenant = Get-VBRCloudTenant -Repository $repository
Remove-VBRCloudTenant -CloudTenant $tenant
This example shows how to remove all cloud tenant accounts by specifying their backup repository.

Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repository variable.
2. Run the Get-VBRCloudTenant cmdlet. Set the $repository variable as the Repository parameter value. Save the result to the $tenant variable.
3. Run the Remove-VBRCloudTenant cmdlet. Set the $tenant variable as the CloudTenant parameter value.

---

### Parameters
#### **CloudTenant**
Specifies an array of tenant accounts that you want to remove. Accepts the VBRCloudTenant[] object. To get this object, run the Get-VBRCloudTenant cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **IncludeBackups**
Defines that the cmdlet will remove all tenant backups.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Remove-VBRCloudTenant -CloudTenant <IVBRCloudTenant[]> [-IncludeBackups] [-Confirm] [-WhatIf] [<CommonParameters>]
```
