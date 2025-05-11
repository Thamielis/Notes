Set-VBRCloudSubTenantResource
-----------------------------

### Synopsis
Modifies quotas of cloud subtenant resources settings.

---

### Description

This cmdlet modifies the VBRCloudSubTenantResource object. This object contains the quota of the tenant's backup resources. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged. Run the Set-VBRCloudSubTenant cmdlet to apply the changes.

---

### Related Links
* [Get-VBRCloudSubTenant](Get-VBRCloudSubTenant)

---

### Examples
> Example 1. Changing Repository Friendly Name for Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
$subtenantResources = $subtenant.Resources[0]
$NewResource = Set-VBRCloudSubTenantResource -CloudSubTenantResource $subtenantresource -RepositoryFriendlyName "Cloud repository for Alpha"
Set-VBRCloudSubTenant -SubTenant $subtenant -Resources $NewResource
This example shows how to modify the repository friendly name for a cloud subtenant and apply these settings to modify cloud subtenant account.

Perform the following steps:
1. Run the Get-VBRCloudSubtenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Get the existing subtenant quota using the Resources property of the VBRCloudSubTenantResource object saved to the $subtenant variable. Save the result to the $subtenantresources variable.
3. Run the Set-VBRCloudSubTenantResource cmdlet. Set the $SubtenantResource variable as the CloudSubTenantResource parameter value. Specify the RepositoryFriendlyName parameter value.
4. Run the Set-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value and $NewResource variable as the Resources parameter value.
> Example 2. Changing Quota for Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
$subtenantresources = $subtenant.Resources[0]
$NewResource = Set-VBRCloudSubTenantResource -CloudSubTenantResource $subtenantresources -Quota 30
Set-VBRCloudSubTenant -SubTenant $subtenant -Resources $NewResource
This example shows how to modify the quota for a cloud subtenant and apply these settings to modify cloud subtenant account.

Perform the following steps:
1. Run the Get-VBRCloudSubtenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Get the existing subtenant quota using the Resources property of the VBRCloudSubTenantResource object saved to the $subtenant variable. Save the result to the $subtenantresources variable.
3. Run the Set-VBRCloudSubTenantResource cmdlet. Set the $subtenantresources variable as the CloudSubTenantResource parameter value. Specify the Quota parameter value. Save the result to the $NewResource variable.
4. Run the Set-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value. Set the $NewResource variable as the Resources parameter value.
> Example 3. Changing Quota for Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
$subtenantresources = $subtenant.Resources[0]
$NewResource = Set-VBRCloudSubTenantResource -CloudSubTenantResource $subtenantresources -Unlimited
Set-VBRCloudSubTenant -SubTenant $subtenant -Resources $NewResource
This example shows how to set unlimited disk space to a cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubtenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Get the existing subtenant quota using the Resources property of the VBRCloudSubTenantResource object saved to the $subtenant variable. Save the result to the $subtenantresources variable.
3. Run the Set-VBRCloudSubTenantResource cmdlet. Set the $subtenantresources variable as the CloudSubTenantResource parameter value. Provide the Unlimited parameter.
4. Run the Set-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value. Set the $NewResource variable as the Resources parameter value.

---

### Parameters
#### **CloudSubTenantResource**
Specifies the quota of the subtenant backup resources you want to modify. Accepts the VBRCloudSubTenantResource object. To get this object, run the Get-VBRCloudSubtenant cmdlet.

|Type                         |Required|Position|PipelineInput                 |
|-----------------------------|--------|--------|------------------------------|
|`[VBRCloudSubTenantResource]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Quota**
Specifies the amount of space you want to give to the subtenant on the selected backup repository. Permitted value: 1 to 2097151  (GB).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |False        |

#### **RepositoryFriendlyName**
Specifies the name you want to give to the subtenant quota. This name will be displayed in the list of backup repositories at the subtenant side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Unlimited**
Defines that the quota of resources has unlimited disk space.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudSubTenantResource

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudSubTenantResource -CloudSubTenantResource <VBRCloudSubTenantResource> [-Quota <Int64>] [-RepositoryFriendlyName <String>] [<CommonParameters>]
```
```PowerShell
Set-VBRCloudSubTenantResource -CloudSubTenantResource <VBRCloudSubTenantResource> [-RepositoryFriendlyName <String>] [-Unlimited] [<CommonParameters>]
```
