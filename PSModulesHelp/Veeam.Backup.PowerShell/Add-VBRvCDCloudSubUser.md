Add-VBRvCDCloudSubUser
----------------------

### Synopsis
Creates vCD cloud subuser accounts.

---

### Description

This cmdlet creates vCD cloud subuser accounts from the tenant side.  You can use these accounts to back up Windows and Linux computers that are protected by Veeam Agent.  The backups of these machines will be stored on the cloud repository. NOTE: This cmdlet works for tenants only. Run the Add-VBRvCDCloudSubTenant cmdlet to create the vCD cloud subtenant on the provider side.

---

### Related Links
* [Get-VBRCloudProvider](Get-VBRCloudProvider)

* [Get-VBRvCDCloudOrganizationUser](Get-VBRvCDCloudOrganizationUser)

* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRCloudSubUserResource](New-VBRCloudSubUserResource)

---

### Examples
> Example - Creating vCD Cloud Subuser Account on Tenant Side

$provider = Get-VBRCloudProvider -Name "vCDProvider"
$user = Get-VBRvCDCloudOrganizationUser -Name "vCDCloudUser"
$rep = Get-VBRBackupRepository -Name "vCD Repository"
$resources = New-VBRCloudSubUserResource -CloudRepository $rep -RepositoryFriendlyName "StrawberryJam" -Quota 50
Add-VBRvCDCloudSubUser -CloudProvider $provider -vCDCloudOrganizationUser $user -Resources  $resources
This example shows how to create a vCD cloud subuser account on the tenant side.

Perform the following steps:
1. Run the Get-VBRCloudProvider cmdlet. Specify the Name parameter value. Save the result to the $provider variable.
2. Run the Get-VBRvCDCloudOrganizationUser cmdlet. Specify the Name parameter value. Save the result to the $user variable.
3. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $rep variable.
4. Run the New-VBRCloudSubUserResource cmdlet. Set the $rep variable as the CloudRepository parameter value. Specify the RepositoryFriendlyName and the Quota parameter values. Save the result to the $resources variable.
5. Run the Add-VBRvCDCloudSubUser cmdlet. Set the $provider variable as the CloudProvider parameter value. Set the $user variable as the vCDCloudOrganizationUser parameter value. Set the $resources variable as the Resources parameter value.

---

### Parameters
#### **CloudProvider**
Specifies a cloud provider. The resources of this provider will be a parent for the subuser. Accepts the VBRCloudProvider object. To get this object, run the Get-VBRCloudProvider cmdlet.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRCloudProvider]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies a description of vCD cloud subuser accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Disabled**
Defines that a vCD cloud subuser is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Resources**
Specifies the quota of the subtenant backup resources that you want to give to the subtenant. Accepts the VBRCloudTenantResource[] object. To create this object, run the New-VBRCloudSubUserResource cmdlet.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[VBRCloudSubUserResource[]]`|true    |named   |False        |

#### **vCDCloudOrganizationUser**
Specifies a vCD cloud user accounts that you want to add. Accepts the VBRvCDCloudOrganizationUser object. To get this object, run the Get-VBRvCDCloudOrganizationUser cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRvCDCloudOrganizationUser]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudProvider

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRvCDCloudSubUser -CloudProvider <VBRCloudProvider> [-Description <String>] [-Disabled] -Resources <VBRCloudSubUserResource[]> -vCDCloudOrganizationUser <VBRvCDCloudOrganizationUser> [<CommonParameters>]
```
