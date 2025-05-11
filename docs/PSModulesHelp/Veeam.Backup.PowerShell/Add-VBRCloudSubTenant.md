Add-VBRCloudSubTenant
---------------------

### Synopsis
Creates cloud subtenant accounts.

---

### Description

This cmdlet creates a new cloud subtenant account.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [New-VBRCloudSubTenantResource](New-VBRCloudSubTenantResource)

* [Set-VBRCloudSubTenant](Set-VBRCloudSubTenant)

---

### Examples
> Example - Creating Cloud Subtenant Account

$parent = Get-VBRCloudTenant -Name "ABC Company"
$parentresource = $parent.Resources[0]
$subtenantquota = New-VBRCloudSubtenantResource -Parent $parentresource -RepositoryFriendlyName "ABC Cloud Repository" -Unlimited
$tenant = Get-VBRCloudTenant -Name "Alpha"
Add-VBRCloudSubTenant -Tenant $tenant -Name "Alpha" -Password "Pass123" -Resources $subtenantquota
This example shows how to create a cloud subtenant account.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $parent variable.
2. Get the parent resources using the Resources property of the VBRCloudTenantResource object saved to the $parent variable. Save the result to the $parentresource variable.
3. Run the New-VBRCloudSubTenantResource cmdlet for details. Set the $parentresource variable as the Parent parameter value. Specify the RepositoryFriendlyName parameter value. Provide the Unlimited parameter. Save the result to the $subtenantquota variable.
4. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
5. Run the Add-VBRCloudSubTenant cmdlet. Specify the following settings:
- Set the $tenant variable as the Tenant parameter value.
- Specify the Name and the Password parameter values.
- Set the $subtenantquota variable as the Resources parameter value.

---

### Parameters
#### **Description**
Specifies the description of the cloud subtenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Disabled**
Defines that the cloud subtenant is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HashedPassword**
Defines that you submit the hashed password.  The hashed passwords are stored in Veeam backup database. Use this parameter, for example, to restore subtenant accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the subtenant account. The subtenant name must meet the following requirements:
* The maximum length of the subtenant name is 128 characters. It is recommended that you create short subtenant names to avoid problems with long paths to backup files on the cloud repository.
* The subtenant name may contain space characters.
* The subtenant name must not contain the following characters: \/:*?\"<>|=; as well as Unicode characters.
* The subtenant name must not end with the period character [.].

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Password**
Specifies the password you want to set to the subtenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Resources**
Specifies the quota of the subtenant backup resources you want to give to the subtenant. Accepts the VBRCloudSubTenantResource[] object. To get this object, run the New-VBRCloudSubtenantResource cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudSubTenantResource[]]`|true    |named   |False        |

#### **Tenant**
Specifies the cloud tenant. The resources of this tenant will be parent for the subtenant. Accepts the VBRCloudTenant object. To get this object, run the Get-VBRCloudTenant cmdlet.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCloudSubTenant [-Description <String>] [-Disabled] [-HashedPassword] -Name <String> -Password <String> -Resources <VBRCloudSubTenantResource[]> -Tenant <VBRCloudTenant> [<CommonParameters>]
```
