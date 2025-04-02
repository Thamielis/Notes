New-VBRCloudSubTenantResource
-----------------------------

### Synopsis
Creates quotas of cloud subtenant resources.

---

### Description

This cmdlet creates a new VBRCloudSubTenantResource object. This object contains a quota of the tenant backup resources. The subtenant quota is a part of subtenant account. To assign the quota to a subtenant, run the Add-VBRCloudSubTenant cmdlet and use the created VBRCloudSubTenantResource object.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [New-VBRCloudTenantResource](New-VBRCloudTenantResource)

---

### Examples
> Example 1. Creating Quota of Resources for Subtenant with Limited Disk Space

$parent = Get-VBRCloudTenant -Name "ABC Company"
$parentresources = $parent.Resources[0]
$subtenantquota = New-VBRCloudSubtenantResource -Parent $parentresource -RepositoryFriendlyName "ABC Cloud Repository" -Quota 10
This example shows how to create a quota of resources for a subtenant with a limited disk space.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $parent variable.
2. Get the parent resources using the Resources property of the VBRCloudTenantResource object saved to the $parent variable. Save the result to the $parentresources variable.
3. Run the New-VBRCloudSubtenantResource cmdlet. Specify the following settings:
- Set the $parentresources variable as the Parent parameter value.
- Specify the RepositoryFriendlyName parameter value.
- Specify the Quota parameter value.
- Save the result to the $subtenantquota variable for future use.
> Example 2. Creating Quota of Resources for Subtenant with Unlimited Disk Space

$parent = Get-VBRCloudTenant -Name "ABC Company"
$parentresource = $parent.Resources[0]
$subtenantquota = New-VBRCloudSubtenantResource -Parent $parentresource -RepositoryFriendlyName "ABC Cloud Repository" -Unlimited
This example shows how to create a quota of resources for a subtenant with unlimited disk space.

Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $parent variable.
2. Get the parent resources using the Resources property of the VBRCloudTenantResource object saved to the $parent variable. Save the result to the $parentresources variable.
3. Run the New-VBRCloudSubtenantResource cmdlet. Specify the following settings:
- Set the $parentresources variable as the Parent parameter value.
- Specify the RepositoryFriendlyName parameter value.
- Provide the Unlimited parameter.
- Save the result to the $subtenantquota variable for future use.

---

### Parameters
#### **Parent**
Specifies the backup resources of the cloud tenant. The disk space available under the tenant account will be used as parent resources for creating the subtenant quota. Use the Quota or the Unlimited parameter to indicate the amount of disk space you want to give to a subtenant. Accepts the VBRCloudTenantResource object. To get this object, run the Get-VBRCloudTenant cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRCloudTenantResource]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Quota**
Specifies the amount of space you want to give to the subtenant on the selected backup repository. Permitted value: 1 to 2097151  (GB).

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |named   |True (ByPropertyName)|

#### **RepositoryFriendlyName**
Specifies the name you want to give to the subtenant quota. This name will be displayed in the list of backup repositories at the subtenant's side.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |True (ByPropertyName)|

#### **Unlimited**
Defines that the quota of resources has unlimited disk space. With unlimited quota, the subtenant will be able to use all disk space allocated to the parent.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|true    |named   |True (ByPropertyName)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenantResource

System.String

System.Int64

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCloudSubTenantResource -Parent <VBRCloudTenantResource> -Quota <Int64> -RepositoryFriendlyName <String> [<CommonParameters>]
```
```PowerShell
New-VBRCloudSubTenantResource -Parent <VBRCloudTenantResource> -RepositoryFriendlyName <String> -Unlimited [<CommonParameters>]
```
