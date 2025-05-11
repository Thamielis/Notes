Set-VBRCloudSubTenant
---------------------

### Synopsis
Modifies settings of cloud subtenant accounts.

---

### Description

This cmdlet modifies the settings for the cloud subtenant accounts of the following types:
- Simple cloud tenant accounts
- vCD cloud tenant accounts
To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

NOTE:
You cannot modify the following settings:
- The cloud subuser name. After the subuser account is created, the name becomes a part of system information and cannot be changed.
- For Agent Management subusers: user name and resources.

---

### Related Links
* [Get-VBRCloudSubTenant](Get-VBRCloudSubTenant)

* [Set-VBRCloudSubTenantResource](Set-VBRCloudSubTenantResource)

---

### Examples
> Example 1. Changing Password for Selected Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
Set-VBRCloudSubTenant -SubTenant $subtenant -Password "Pass12345"
This example shows how to modify the password for a selected cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubtenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Run the Set-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value. Specify the Password parameter value.
> Example 2. Disabling Selected Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
Set-VBRCloudSubTenant -SubTenant $subtenant -Disabled
This example shows how to disable a selected cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubtenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Run the Set-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value. Provide the Disabled parameter.
> Example 3. Modifying Resource Quota for Selected Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
$subtenantresources = $subtenant.Resources[0]
$newresources = Set-VBRCloudSubTenantResource -CloudSubTenantResource $subtenantresources -Quota 20
Set-VBRCloudSubTenant -SubTenant $subtenant -Resources $newresources
This example shows how to modify the quota of resources for a selected cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubtenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Get the existing quota of the subtenant. Use the Resources property of the VBRCloudSubTenantResource object saved to the $subtenant variable. Save the result to the $subtenantresources variable.
3. Run the Set-VBRCloudSubTenantResource cmdlet. Set the $subtenantresources variable as the CloudSubTenantResource parameter value. Specify the Quota parameter value. Save the result to the $newresources variable.
4. Run the Set-VBRCloudSubTenant cmdlet to apply changes. Set the $subtenant variable as the SubTenant parameter value. Set the $newresources variable as the Resources parameter value.

---

### Parameters
#### **Description**
Specifies the description of the cloud subtenant account.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Disabled**
Defines if the cloud subtenant is disabled.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HashedPassword**
Defines that you submit the hashed password. The hashed passwords are stored in Veeam backup database.  Use this parameter, for example, to restore subtenant accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Password**
Specifies the password you want to set to the subtenant account. Note: This parameter is available for the vCD cloud tenant accounts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Resources**
Specifies the quota of the subtenant backup resources you want to give to the subtenant. Accepts the VBRCloudSubTenantResource[] object. To get this object, run the Set-VBRCloudSubTenantResource cmdlet.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[VBRCloudSubTenantResource[]]`|false   |named   |False        |

#### **SubTenant**
Specifies the cloud subtenant you want to modify. Accepts the VBRCloudSubTenant object. To get this object, run the Get-VBRCloudSubtenant cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[IVBRCloudSubTenant]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudSubTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudSubTenant [-Description <String>] [-Disabled] [-HashedPassword] [-PassThru] [-Password <String>] [-Resources <VBRCloudSubTenantResource[]>] -SubTenant <IVBRCloudSubTenant> [<CommonParameters>]
```
