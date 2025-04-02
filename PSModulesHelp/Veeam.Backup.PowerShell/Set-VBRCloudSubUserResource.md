Set-VBRCloudSubUserResource
---------------------------

### Synopsis
Modifies quotas of cloud subuser resources settings.

---

### Description

This cmdlet modifies the VBRCloudSubUserResource object. This object contains the quota of the cloud user backup resources. Run the Set-VBRCloudSubUser cmdlet to apply the changes. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRCloudSubUser](Get-VBRCloudSubUser)

---

### Examples
> Example 1. Modifying Repository Friendly Name for Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Alpha"
$subuserresources = $subuser.Resources[0]
Set-VBRCloudSubUserResource -CloudSubUserResource $subuserresources -RepositoryFriendlyName "Alpha Cloud Repository"
This example shows how to modify the repository friendly name for a cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Get the existing subuser quota using the Resources property of the VBRCloudSubUserResource object saved to the $subuser variable. Save the result to the $subuserresources variable.
3. Run the Set-VBRCloudSubUserResource cmdlet. Set the $subuserresources variable as the CloudSubUserResource parameter value. Specify the RepositoryFriendlyName parameter value.
> Example 2. Modifying Quota for Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Alpha"
$subuserresources = $subuser.Resources[0]
Set-VBRCloudSubUserResource -CloudSubUserResource $subuserresources -Quota 30
This example shows how to modify the quota for a cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Get the existing subuser quota using the Resources property of the VBRCloudSubUserResource object saved to the $subuser variable. Save the result to the $subuserresources variable.
3. Run the Set-VBRCloudSubUserResource cmdlet. Set the $subuserresources variable as the CloudSubUserResource parameter value. Specify the Quota parameter value.
> Example 3. Setting Unlimited Disk Space for Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Alpha"
$subuserresources = $subuser.Resources[0]
Set-VBRCloudSubUserResource -CloudSubUserResource $subuserresources -Unlimited
This example shows how to set unlimited disk space to a cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Get the existing subuser quota using the Resources property of the VBRCloudSubUserResource object saved to the $subuser variable. Save the result to the $subuserresources variable.
3. Run the Set-VBRCloudSubUserResource cmdlet. Set the $subuserresources variable as the CloudSubUserResource parameter value. Provide the Unlimited parameter.

---

### Parameters
#### **CloudSubUserResource**
Specifies the quota of the subuser backup resources you want to modify. Accepts the VBRCloudSubTenantResource object. To get this object, run the Get-VBRCloudSubUser cmdlet.

|Type                       |Required|Position|PipelineInput                 |
|---------------------------|--------|--------|------------------------------|
|`[VBRCloudSubUserResource]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Quota**
Specifies the amount of space you want to give to the subuser on the selected backup repository. Permitted value: 1 to 2097151  (GB).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |False        |

#### **RepositoryFriendlyName**
Specifies the name you want to give to the subuser quota. This name will be displayed in the list of backup repositories at the subuser side.

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
Veeam.Backup.PowerShell.Infos.VBRCloudSubUserResource

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRCloudSubUserResource -CloudSubUserResource <VBRCloudSubUserResource> [-Quota <Int64>] [-RepositoryFriendlyName <String>] [<CommonParameters>]
```
```PowerShell
Set-VBRCloudSubUserResource -CloudSubUserResource <VBRCloudSubUserResource> [-RepositoryFriendlyName <String>] [-Unlimited] [<CommonParameters>]
```
