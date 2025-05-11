Set-VBRViCloudHardwarePlan
--------------------------

### Synopsis
Modifies VMware hardware plans.

---

### Description

This cmdlet modifies settings of an existing hardware plan. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCloudHardwarePlan](Get-VBRCloudHardwarePlan)

* [New-VBRViCloudHWPlanDatastore](New-VBRViCloudHWPlanDatastore)

---

### Examples
> Example 1. Modifying Hardware Plan to Add Ability to Use Several Networks

$hardwareplan = Get-VBRCloudHardwarePlan -Name "VMware Gold"
Set-VBRViCloudHardwarePlan -HardwarePlan $hardwareplan -NumberOfNetWithInternet 2
This example shows how to add the ability to use 2 networks with access to the Internet to a hardware plan named VMware Gold.
Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save the result to the $hardwareplan variable.
2. Run the Set-VBRViCloudHardwarePlan cmdlet. Set the $hardwareplan variable as the HardwarePlan parameter value. Specify the NumberOfNetWithInternet parameter value.
> Example 2. Modifying CPU and Memory Quotas of Hardware Plan

$hardwareplan = Get-VBRCloudHardwarePlan -Name "VMware Silver"
Set-VBRViCloudHardwarePlan -HardwarePlan $hardwareplan -CPU 5000 -Memory 4000
This example shows how to modify the CPU and memory quotas of a hardware plan named VMware Gold.
Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save the result to the $hardwareplan variable.
2. Run the Set-VBRViCloudHardwarePlan cmdlet. Set the $hardwareplan variable as the HardwarePlan parameter value. Specify the CPU and the Memory parameter values.
> Example 3. Modifying Harware Plan to Add More Cloud Storage

$hardwareplan = Get-VBRCloudHardwarePlan -Name "VMware Silver"
$cloudstorage = $hardwareplan.Datastore
$cloudstorage += $newcloudstorage
Set-VBRViCloudHardwarePlan -HardwarePlan $hardwareplan -Datastore $cloudstorage
This example shows how to add one more cloud storage to a hardware plan named "VMware Silver".
Perform the following steps:
1. Pre-configure the new cloud storage. For details, see the New-VBRViCloudHWPlanDatastore cmdlet. Save the storage to the $newcloudstorage variable.
2. Run the Get-VBRCloudHardwarePlan cmdlet. Save the result to the $hardwareplan variable.
3. Get the array of cloud storage objects that are currently used in the hardware plan. Save the array to the $cloudstorage variable.
4. Add a new cloud storage object to the array.
5. Run the Set-VBRViCloudHardwarePlan cmdlet. Set the $hardwareplan variable as the HardwarePlan parameter value and the $cloudstorage variable as the Datastore parameter value.

---

### Parameters
#### **CPU**
Specifies the quote of CPU resources you want to assign to the hardware plan (MHz).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Datastore**
Specifies the array of the datastores that will be used for storing user data. Accepts the VBRViCloudHardwarePlanDatastore[] object.  To get this object, run the New-VBRViCloudHWPlanDatastore cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRViCloudHardwarePlanDatastore[]]`|false   |named   |False        |

#### **Description**
Specifies the description of the hardware plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will modify the hardware plan without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HardwarePlan**
Specifies the hardware plan you want to modify. Accepts the VBRHvCloudHardwarePlan object. To get this object, run the Get-VBRCloudHardwarePlan cmdlet.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRViCloudHardwarePlan]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Memory**
Specifies the quote of memory resources you want to assign to the hardware plan (Mb).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the hardware plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **NumberOfNetWithInternet**
Specifies the number of networks with access to the Internet that you want to assign to the hardware plan.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **NumberOfNetWithoutInternet**
Specifies the number of networks without access to the Internet that you want to assign to the hardware plan.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Server**
Specifies the ESX(i) host or cluster. The resources of this host or cluster will be exposed to the user by the hardware plan. Accepts the CHost (standalone host) or CViClusterItem (cluster) object. To get this object, run the Get-VBRServer cmdlet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **UnlimitedCPU**
Defines that the quota of CPU resources is unlimited.
If you provide this parameter, the tenant will be able to use all CPU resources of the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UnlimitedMemory**
Defines that the quota of CPU memory is unlimited.
If you provide this parameter, the tenant will be able to use all memory resources of the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRViCloudHardwarePlan

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRViCloudHardwarePlan [-CPU <Int32>] [-Datastore <VBRViCloudHardwarePlanDatastore[]>] [-Description <String>] [-Force] -HardwarePlan <VBRViCloudHardwarePlan> [-Memory <Int32>] [-Name <String>] 
```
```PowerShell
[-NumberOfNetWithInternet <Int32>] [-NumberOfNetWithoutInternet <Int32>] [-Server <Object>] [-UnlimitedCPU] [-UnlimitedMemory] [<CommonParameters>]
```
