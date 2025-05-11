Add-VBRvCDCloudSubTenant
------------------------

### Synopsis
Creates vCD cloud subtenant accounts.

---

### Description

This cmdlet creates new vCD cloud subtenant accounts. NOTE: Before creating a vCD cloud subtenant account, you must perform the following:   · Add the vCD cloud tenant into your Veeam Backup & Replication infrastructure   · Create users in VMware vCloud Director. The vCD users must be granted the role, different from the administrator one.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [New-VBRCloudSubTenantResource](New-VBRCloudSubTenantResource)

---

### Examples
> Example 1

$vcduser = Find-VBRvCloudEntity -OrganizationUser -Name vCDUser
$vcdtenant = Get-VBRCloudTenant -Name "vCDTenant"
$parent = $vcdtenant.Resources[0]
$subRes = New-VBRCloudSubTenantResource -Parent $parent -RepositoryFriendlyName "Cloudrepository" -Quota 50
Add-VBRvCDCloudSubTenant -vCDOrganizationUser $vcduser -vCDTenant $vcdtenant -Resources $subres -Description "NewCloudSubTenant"
This example shows how to add a vCD cloud subtenant account to your Veeam Backup & Replication infrastructure. The subtenant quota is set to 50 GB.   1. Run Find-VBRvCloudEntity to get the necessary vCD user. Save the result to the $vcduser variable,   2. Run Get-VBRCloudTenant to get the necessary vCD tenant. Save the result to the $vcdtenant variable.   3. Get the parent resources. Use the Resources property of the VBRCloudTenantResource object saved to the $parent variable. Save the result to the $parent variable.   4. Run New-VBRCloudSubTenantResource with the $parent variable. Use the RepositoryFriendlyName parameter to specify the repository name and the Quota parameter to specify the allowed storage imitations.   5. Run Add-VBRvCDCloudSubTenant with the $vcduser, $vcdtenant and $subres variables.
> Example 2

$vcduser = Find-VBRvCloudEntity -OrganizationUser -Name vCDUser
$vcdtenant = Get-VBRCloudTenant -Name vCDTenant
$subRes = New-VBRCloudSubTenantResource -Parent $vcdtenant.Resources[0] -RepositoryFriendlyName "Cloudrepository" -Unlimited
Add-VBRvCDCloudSubTenant -vCDOrganizationUser $vcduser -vCDTenant $vcdtenant  -Resources $subres -Description "NewCloudSubTenant"
This example shows how to add a vCD cloud subtenant account to your Veeam Backup & Replication infrastructure. The subtenant quota is unlimited.   1. Run Find-VBRvCloudEntity to get the necessary vCD user. Save the result to the $vcduser variable.   2. Run Get-VBRCloudTenant to get the necessary vCD tenant. Save the result to the $vcdtenant variable.   3. Run New-VBRCloudSubTenantResource with the $vcdtenant variable. Use the Resources property of the VBRCloudTenantResource saved to the $vcdtenant variable. Use the RepositoryFriendlyName parameter to specify the repository name and the Quota parameter to specify the allowed storage imitations.   4. Run Add-VBRvCDCloudSubTenant with the $vcduser, $vcdtenant and $subres variables.

---

### Parameters
#### **Description**
Specifies a description of the vCD cloud subtenant accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Disabled**
Indicates that the subtenant is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Resources**
Specifies the array of backup resource quotas you want to allocate to the vCD cloud tenant accounts. NOTE: When you assign multiple resource quotas to one vCD cloud tenant account, the resource quotas must have unique Repository Friendly Names and they must use different repositories. Accepts the VBRCloudTenantResource type.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudSubTenantResource[]]`|true    |named   |False        |

#### **vCDOrganizationUser**
Specifies a vCD cloud user account that you want to add to the subtenant. Accepts the VBRvCloudOrganizationUser type.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRvCloudOrganizationUser]`|true    |named   |False        |

#### **vCDTenant**
Specifies a vCD cloud tenant account. Veeam Backup & Replication will check for the existing users on this tenant, to add them as the subtenant into the backup infrastructure. Accepts the VBRvCDCloudTenant type.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRvCDCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

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
Add-VBRvCDCloudSubTenant [-Description <String>] [-Disabled] -Resources <VBRCloudSubTenantResource[]> -vCDOrganizationUser <VBRvCloudOrganizationUser> -vCDTenant <VBRvCDCloudTenant> [<CommonParameters>]
```
