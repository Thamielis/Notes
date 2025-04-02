New-VBRvCDIndividualObjectStoragePolicy
---------------------------------------

### Synopsis
Defines Cloud Director storage policies for vApps or VMs.

---

### Description

This cmdlet creates the VBRvCDIndividualObjectStoragePolicy object.
This object defines the settings of Cloud Director storage policies for vApps or VMs.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

---

### Examples
> Example 1. Defining VApp Storage Policy

$vapp = Find-VBRvCloudEntity -VApp -Name "Atlanta05"
$policy = Find-VBRvCloudEntity -StorageProfile
$vpolicy = New-VBRvCDIndividualObjectStoragePolicy -VApp $vapp[0] -StoragePolicy $policy[0]
This example shows how to define a storage policy for the Atlanta05 VApp.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Specify the Name and VApp parameters. Save the result to the $vapp variable.
2. Run the Find-VBRvCloudEntity cmdlet. Provide the StorageProfile parameter. Save the result to the $policy variable.
3. Run the New-VBRvCDIndividualObjectStoragePolicy cmdlet. Set the $vapp variable as the VApp parameter value. Set the $policy variable as the StoragePolicy parameter value. Save the result to the $vpolicy variable.
> Example 2. Defining VM Storage Policy

$vapp = Find-VBRvCloudEntity -VM -Name "Admin05"
$policy = Find-VBRvCloudEntity -StorageProfile
$vmpolicy = New-VBRvCDIndividualObjectStoragePolicy -VM $vapp[0] -StoragePolicy $policy[0]
This example shows how to define a storage policy for the Admin05 VM.

Perform the following steps:
1. Run the Find-VBRvCloudEntity cmdlet. Specify the Name and VM parameters. Save the result to the $vapp variable.
2. Run the Find-VBRvCloudEntity cmdlet. Provide the StorageProfile parameter. Save the result to the $policy variable.
3. Run the New-VBRvCDIndividualObjectStoragePolicy cmdlet. Set the $vapp variable as the VM parameter value. Set the $policy variable as the StoragePolicy parameter value. Save the result to the $vmpolicy variable.

---

### Parameters
#### **StoragePolicy**
Specifies the storage policy.
The cmdlet will define a storage policy according to this policy settings.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|true    |named   |False        |

#### **VApp**
Specifies the vApp for which you want to define a storage policy.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|true    |named   |False        |

#### **VM**
Specifies the VM for which you want to define a storage policy.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|true    |named   |False        |

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
New-VBRvCDIndividualObjectStoragePolicy -StoragePolicy <CVcdOrgVdcStorageProfile> -VApp <CVcdVappItem> [<CommonParameters>]
```
```PowerShell
New-VBRvCDIndividualObjectStoragePolicy -StoragePolicy <CVcdOrgVdcStorageProfile> -VM <CVcdVappItem> [<CommonParameters>]
```
