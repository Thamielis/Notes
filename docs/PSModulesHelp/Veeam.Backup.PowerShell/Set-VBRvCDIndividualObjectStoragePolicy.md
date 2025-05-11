Set-VBRvCDIndividualObjectStoragePolicy
---------------------------------------

### Synopsis
Modifying the Cloud Director storage policies for vApps or VMs.

---

### Description

This cmdlet modifies the Cloud Director storage policies for vApps or VMs.

---

### Related Links
* [Find-VBRvCloudEntity](Find-VBRvCloudEntity)

* [New-VBRvCDIndividualObjectStoragePolicy](New-VBRvCDIndividualObjectStoragePolicy)

---

### Examples
> Example 1. Modifying VApp Storage Policy

$vapp = Find-VBRvCloudEntity -VApp -Name "Atlanta05"
$policy = Find-VBRvCloudEntity -StorageProfile
$vpolicy = New-VBRvCDIndividualObjectStoragePolicy -VApp $vapp[0] -StoragePolicy $policy[0]
$newpolicy = Find-VBRvCloudEntity -StorageProfile -Name "Virginia vApp"
Set-VBRvCDIndividualObjectStoragePolicy -Policy $vpolicy -StoragePolicy $newpolicy
This example shows how to apply the Virginia vApp policy for the Atlanta05 policy.

Perform the following steps:
1. Define the settings of Cloud Director storage policies for vApps.
- Run the Find-VBRvCloudEntity cmdlet. Specify the Name and VApp parameters. Save the result to the $vapp variable.
- Run the Find-VBRvCloudEntity cmdlet. Provide the StorageProfile parameter. Save the result to the $policy variable.
- Run the New-VBRvCDIndividualObjectStoragePolicy cmdlet. Specify the VApp and the StoragePolicy parameters. Save the result to the $vpolicy variable.
2. Run the Find-VBRvCloudEntity cmdlet. Specify the StoragePolicy and the Name parameters. Save the result to the $newpolicy variable.
3. Run the Set-VBRvCDIndividualObjectStoragePolicy cmdlet. Set the $vpolicy variable as the Policy parameter value. Set the $newpolicy variable as the StoragePolicy parameter value.
> Example 2. Modifying VM Storage Policy

$vapp = Find-VBRvCloudEntity -VM -Name "Admin05"
$policy = Find-VBRvCloudEntity -StorageProfile
$vmpolicy = New-VBRvCDIndividualObjectStoragePolicy -VM $vapp[0] -StoragePolicy $policy[0]
$newpolicy = Find-VBRvCloudEntity -StorageProfile -Name "Virginia vApp"
Set-VBRvCDIndividualObjectStoragePolicy -Policy $vmpolicy -StoragePolicy $newpolicy
This example shows how to apply the Virginia vApp policy for the Admin05 VM.

Perform the following steps:
1. Define the settings of Cloud Director storage policies for vApps.
- Run the Find-VBRvCloudEntity cmdlet. Specify the Name and VApp parameters. Save the result to the $vapp variable.
- Run the Find-VBRvCloudEntity cmdlet. Provide the StorageProfile parameter. Save the result to the $policy variable.
- Run the New-VBRvCDIndividualObjectStoragePolicy cmdlet. Specify the VM and the StoragePolicy parameters. Save the result to the $vmpolicy variable.
2. Run the Find-VBRvCloudEntity cmdlet. Specify the StoragePolicy and the Name parameters. Save the result to the $newpolicy variable.
3. Run the Set-VBRvCDIndividualObjectStoragePolicy cmdlet. Set the $vmpolicy variable as the Policy parameter value. Set the $newpolicy variable as the StoragePolicy parameter value.

---

### Parameters
#### **Policy**
Specifies the  Cloud Director storage policies for vApps or VMs.
The cmdlet will modify this policy.

|Type                                   |Required|Position|PipelineInput                 |
|---------------------------------------|--------|--------|------------------------------|
|`[VBRvCDIndividualObjectStoragePolicy]`|true    |named   |True (ByPropertyName, ByValue)|

#### **StoragePolicy**
Specifies the storage policy.
The cmdlet will modify a storage policy according to this policy settings.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[CVcdOrgVdcStorageProfile]`|false   |named   |False        |

#### **VApp**
Specifies the vApp for which you want to modify a storage policy.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|false   |named   |False        |

#### **VM**
Specifies the VM for which you want to modify a storage policy.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CVcdVappItem]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRvCDIndividualObjectStoragePolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRvCDIndividualObjectStoragePolicy -Policy <VBRvCDIndividualObjectStoragePolicy> [-StoragePolicy <CVcdOrgVdcStorageProfile>] [-VApp <CVcdVappItem>] [<CommonParameters>]
```
```PowerShell
Set-VBRvCDIndividualObjectStoragePolicy -Policy <VBRvCDIndividualObjectStoragePolicy> [-StoragePolicy <CVcdOrgVdcStorageProfile>] [-VM <CVcdVappItem>] [<CommonParameters>]
```
