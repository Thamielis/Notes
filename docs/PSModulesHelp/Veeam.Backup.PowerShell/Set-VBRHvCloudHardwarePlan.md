Set-VBRHvCloudHardwarePlan
--------------------------

### Synopsis
Modifies Hyper-V hardware plans.

---

### Description

This cmdlet modifies settings of an existing hardware plan. To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRServer](Get-VBRServer)

* [Get-VBRCloudHardwarePlan](Get-VBRCloudHardwarePlan)

---

### Examples
> Example 1. Modifying Hardware Plan to Add Ability to Use 2 Networks

$hardwareplan = Get-VBRCloudHardwarePlan -Name "Hyper-V Gold"
Set-VBRHvCloudHardwarePlan -HardwarePlan $hardwareplan -NumberOfNetWithInternet 2
This example shows how to add the ability to use 2 networks with access to the Internet to a hardware plan named Hyper-V Gold.
Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save it to the $hardwareplan variable.
2. Run the Set-VBRHvCloudHardwarePlan cmdlet. Set the $hardwareplan variable as the HardwarePlan parameter value. Specify the NumberOfNetWithInternet parameter value.
> Example 2. Modifying CPU and Memory Quotas of Hardware Plan

$hardwareplan = Get-VBRCloudHardwarePlan -Name "Hyper-V Silver"
Set-VBRHvCloudHardwarePlan -HardwarePlan $hardwareplan -CPU 5000 -Memory 4000
This example shows how to modify the CPU and memory quotas of a hardware plan named "Hyper-V Silver".
Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save it to the $hardwareplan variable.
2. Run the Set-VBRHvCloudHardwarePlan cmdlet. Set the $hardwareplan variable as the HardwarePlan parameter value. Specify the CPU and the Memory parameter values.
> Example 3. Modifying Hardware Plan to Add More Cloud Storage

$hardwareplan = Get-VBRCloudHardwarePlan -Name "Hyper-V Silver"
$cloudstorage = $hardwareplan.Datastore
$cloudstorage = $newcloudstorage
Set-VBRHvCloudHardwarePlan -HardwarePlan $hardwareplan -Datastore $cloudstorage
This example shows how to add one more cloud storage to a hardware plan named "Hyper-V Silver".
Perform the following steps:
1. Pre-configure a new cloud storage. For details, see the New-VBRHvCloudHWPlanDatastore cmdlet. Save the result to the $newcloudstorage variable.
2. Run the Get-VBRCloudHardwarePlan cmdlet. Save the result to the $hardwareplan variable.
3. Get the array of cloud storage objects that are currently used in the hardware plan. Save the array to the $cloudstorage variable.
4. Add a new cloud storage object to the array.
5. Run the Set-VBRHvCloudHardwarePlan cmdlet. Set the $hardwareplan variable as the HardwarePlan parameter value and the $cloudstorage variable as the Datastore parameter value.

---

### Parameters
#### **CPU**
Specifies the quote of CPU resources you want to assign to the hardware plan (MHz).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Datastore**
Specifies the array of the datastores that will be used for storing user data. Accepts the VBRHvCloudHardwarePlanDatastore[] object.  To get this object, run the New-VBRHvCloudHWPlanDatastore cmdlet.

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRHvCloudHardwarePlanDatastore[]]`|false   |named   |False        |

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
|`[VBRHvCloudHardwarePlan]`|true    |named   |True (ByPropertyName, ByValue)|

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
Specifies the Hyper-V host. The resources of this host will be exposed to the user by the hardware plan. Accepts the CHost object or string (name of server). To get this object, run the Get-VBRServer cmdlet.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **UnlimitedCPU**
Defines that the quota of CPU resources is unlimited. If you provide this parameter, the tenant will be able to use all CPU resources of the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UnlimitedMemory**
Defines that the quota of CPU memory is unlimited. If you provide this parameter, the tenant will be able to use all memory resources of the host.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRHvCloudHardwarePlan

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRHvCloudHardwarePlan [-CPU <Int32>] [-Datastore <VBRHvCloudHardwarePlanDatastore[]>] [-Description <String>] [-Force] -HardwarePlan <VBRHvCloudHardwarePlan> [-Memory <Int32>] [-Name <String>] 
```
```PowerShell
[-NumberOfNetWithInternet <Int32>] [-NumberOfNetWithoutInternet <Int32>] [-Server <CHost>] [-UnlimitedCPU] [-UnlimitedMemory] [<CommonParameters>]
```
