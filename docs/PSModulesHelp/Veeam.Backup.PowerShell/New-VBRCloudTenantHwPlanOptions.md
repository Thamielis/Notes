New-VBRCloudTenantHwPlanOptions
-------------------------------

### Synopsis
Creates the VBRCloudTenantHwPlanOptions objects that contains hardware plan options.

---

### Description

This cmdlet creates a VBRCloudTenantHwPlanOptions object that contains a hardware plan. This object is used in New-VBRCloudTenantReplicationResources to specify the hardware plan options. You can also enable WAN acceleration and set a target WAN accelerator. Note that the tenant who plan to use the WAN acceleration must configure a source WAN accelerator on their side.

---

### Related Links
* [Get-VBRCloudHardwarePlan](Get-VBRCloudHardwarePlan)

* [Get-VBRWANAccelerator](Get-VBRWANAccelerator)

---

### Examples
> Example 1. Creating Hardware Plan Options Without WAN Acceleration

$HwPlan = Get-VBRCloudHardwarePlan -Name "VMware Silver"
$options = New-VBRCloudTenantHwPlanOptions -HardwarePlan $HwPlan
This example shows how to create a hardware plan options object without WAN acceleration.

Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Specify the Name parameter value. Save it to the $HwPlan variable.
2. Run the New-VBRCloudTenantHwPlanOptions cmdlet. Set the $HwPlan variable as the HardwarePlan parameter value. Save the result to the $options variable for further use.
> Example 2. Enabling WAN Acceleration for VMware Hardware Plan

$HwPlan = Get-VBRCloudHardwarePlan -Platform VMWare -Name "VMware Silver"
$wan = Get-VBRWANAccelerator -Name "Columbus WAN"
$options = New-VBRCloudTenantHwPlanOptions -HardwarePlan $HwPlan -EnableWanAcceleration -WanAccelerator $wan
This example shows how to enable WAN acceleration for a VMware hardware plan.

Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Set the VMWare option for the Platform parameter. Specify the Name parameter value. Save it to the $HwPlan variable.
2. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save it to the $wan variable.
3. Run the New-VBRCloudTenantHwPlanOptions using the saved variables. Specify the following settings:
- Set the $HwPlan variable as the HardwarePlan parameter value.
- Provide the EnableWanAcceleration parameter.
- Set the $wan variable as the WanAccelerator parameter value.
- Save the result to the $options variable for further use.
> Example 3. Enabling WAN Acceleration for VMware Hardware Plan

$HwPlan = Get-VBRCloudHardwarePlan -Platform HyperV -Name "Hyper-V Silver"
$wan = Get-VBRWANAccelerator -Name "Columbus WAN"
$options = New-VBRCloudTenantHwPlanOptions -HardwarePlan $HwPlan -EnableWanAcceleration -WanAccelerator $wan
This example shows how to enable WAN acceleration for a Hyper-V hardware plan.

Perform the following steps:
1. Run the Get-VBRCloudHardwarePlan cmdlet. Set the HyperV option for the Platform parameter. Specify the Name parameter value. Save it to the $HwPlan variable.
2. Run the Get-VBRWANAccelerator cmdlet. Specify the Name parameter value. Save it to the $wan variable.
3. Run the New-VBRCloudTenantHwPlanOptions using the saved variables. Specify the following settings:
- Set the $HwPlan variable as the HardwarePlan parameter value.
- Provide the EnableWanAcceleration parameter.
- Set the $wan variable as the WanAccelerator parameter value.
- Save the result to the $options variable for further use.

---

### Parameters
#### **EnableWanAcceleration**
Enables the option to use WAN accelerators for backup jobs to cloud repositories. Use the WanAccelerator parameter to set the WAN accelerator.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **HardwarePlan**
Specifies the hardware plan from which you want to enable the WAN acceleration. Accepts the VBRHvCloudHardwarePlan or VBRViCloudHardwarePlan objects. To get this object, run the Get-VBRCloudHardwarePlan cmdlet.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRCloudHardwarePlan]`|true    |named   |True (ByPropertyName, ByValue)|

#### **WanAccelerator**
Specifies the WAN accelerator you want to assign to the tenant hardware plan. Accepts the CWanAccelerator object.  To get this object, run the Get-VBRWANAccelerator cmdlet.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CWanAccelerator]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudHardwarePlan

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
New-VBRCloudTenantHwPlanOptions [-EnableWanAcceleration] -HardwarePlan <VBRCloudHardwarePlan> [-WanAccelerator <CWanAccelerator>] [<CommonParameters>]
```
