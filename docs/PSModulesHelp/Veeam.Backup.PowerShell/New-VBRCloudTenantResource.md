New-VBRCloudTenantResource
--------------------------

### Synopsis
Creates the VBRCloudTenantResource object that contains backup resources.

---

### Description

This cmdlet creates a new VBRCloudTenantResource object. This object contains the backup resources settings and is used further to apply these settings to a cloud tenant account.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRWANAccelerator](Get-VBRWANAccelerator)

---

### Examples
> Example 1. Creating Object with Tenant Quota

$repo1 = Get-VBRBackupRepository -Name "Backups Vol2"
$standard1 = New-VBRCloudTenantResource -Repository $repo1 -RepositoryFriendlyName "Standard Tier Repository" -Quota 10
This example shows how to create an object containing backup resources with the following settings:
- The cloud repository is named Standard Tier Repository.
- The tenant quota is set to 10 GB.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repo1 variable.
2. Run the New-VBRCloudTenantResource cmdlet. Specify the following settings:
- Set the $repo1 variable as the Repository parameter value.
- Specify the RepositoryFriendlyName parameter value.
- Specify the Quota parameter value.
- Save the result to the $standard1 variable to be used with other cmdlets.
> Example 2. Creating Object with Tenant Quota and WAN Acceleration

$repo2 = Get-VBRBackupRepository -Name "Backups Vol2"
$wan = Get-VBRWANAccelerator -Name "WAN 1"
$golden2 = New-VBRCloudTenantResource -Repository $repo2 -RepositoryFriendlyName "Golden Tier Repository" -Quota 100 -EnableWanAccelerator -WanAccelerator $wan
This example shows how to create an object containing backup resources with the following settings:
- The cloud repository is named Golden Tier Repository.
- The tenant quota is set to 100 GB.
- The WAN acceleration is allowed.
Perform the following steps:
1. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $repo2 variable.
2. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save the result to the $wan variable.
3. Run the New-VBRCloudTenantResource cmdlet. Specify the following settings:
- Set the $repo2 variable as the Repository parameter value.
- Specify the RepositoryFriendlyName parameter value.
- Specify the Quota parameter value.
- Provide the EnableWanAccelerator parameter.
- Set the $wan variable as the WanAccelerator parameter value.
- Save the result to the $golden2 variable to be used with other cmdlets.

---

### Parameters
#### **EnableWanAccelerator**
Enables the option to use WAN accelerators for backup jobs to cloud repositories. Use the WanAccelerator parameter to set the WAN accelerator.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Quota**
Specifies the amount of space you want to allocate to the tenant on the selected backup repository. Permitted value: 1 to 2097151  (GB).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|true    |named   |False        |

#### **Repository**
Specifies the backup repository in your backup infrastructure you want to expose to the tenant. You can specify simple or scale-out backup repositories. You cannot specify cloud repositories or individual scale-out repositories extents. Accepts the CBackupRepository object. To get this object, run the Get-VBRBackupRepository cmdlet.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **RepositoryFriendlyName**
Specifies a friendly name for the cloud repository you want to present to the tenant. The name you enter will be displayed in the list of backup repositories at the tenant's side.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **WanAccelerator**
Specifies the WAN accelerator for the EnableWanAccelerator parameter. Accepts the CWanAccelerator object. To get this object, run the Get-VBRWANAccelerator cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCloudTenantResource [-EnableWanAccelerator] -Quota <Int64> -Repository <CBackupRepository> -RepositoryFriendlyName <String> [-WanAccelerator <CWanAccelerator>] [<CommonParameters>]
```
