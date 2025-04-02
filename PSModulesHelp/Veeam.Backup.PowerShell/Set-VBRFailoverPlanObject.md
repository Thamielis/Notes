Set-VBRFailoverPlanObject
-------------------------

### Synopsis
Modifies the VBRFailoverPlanObject object.

---

### Description

This cmdlet modifies VMs added to a failover plan.
Run the Set-VBRCloudFailoverPlanObject cmdlet to modify VMs in cloud failover plans.

---

### Examples
> Example 1

$MSExchange01 = Find-VBRViEntity -Name "MSExchange01" | New-VBRFailoverPlanObject -BootDelay 0
$MSExchange01 | Set-VBRFailoverPlanObject -BootDelay 120
This example shows how to set a new boot delay value for the server that was earlier assigned to the $MSExchange01 variable.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootDelay parameter value. Save the result to the $MSExchange01 variable to be used with other cmdlets.
2. Pipe the $MSExchange01 variable output to the Set-VBRFailoverPlanObject cmdlet. Specify the BootDelay parameter values.
> Example 2

$MSExchange01 = Find-VBRViEntity -Name "MSExchange01" | New-VBRFailoverPlanObject -BootDelay 0
$MSExchange01 = Set-VBRFailoverPlanObject -Object $MSExchange01 -BootDelay 120
This example shows how to set a new boot delay value for the server that was earlier assigned to the $MSExchange01 variable.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Pipe the cmdlet output to the New-VBRFailoverPlanObject cmdlet. Specify the BootDelay parameter value. Save the result to the $MSExchange01 variable to be used with other cmdlets.
2. Run the Set-VBRFailoverPlanObject cmdlet. Set the $MSExchange01 variable as the Object parameter value. Specify the BootDelay parameter values. Save the result to the $MSExchange01 variable to be used with other cmdlets.

---

### Parameters
#### **BootDelay**
Specifies the new value for the delay time for the VM.
The delay time is set in seconds.
Default: 60 sec.
If you set boot delay to 0 to a number of VMs, these VMs will start simultaneously.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **BootOrder**
Specifies the new value for the order number by which the VM will boot.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **Object**
Specifies the VM you want modify.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRFailoverPlanObject]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFailoverPlanObject

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRFailoverPlanObject [-BootDelay <Int32>] [-BootOrder <Int32>] -Object <VBRFailoverPlanObject> [<CommonParameters>]
```
