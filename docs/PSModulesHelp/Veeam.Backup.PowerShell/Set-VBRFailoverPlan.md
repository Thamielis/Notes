Set-VBRFailoverPlan
-------------------

### Synopsis
Modifies a selected failover plan or cloud failover plan.

---

### Description

This cmdlet modifies settings of an existing failover plan or cloud failover plan.

---

### Examples
> Example 1

$MSExchangeServer03 = Find-VBRViEntity -Name "MS Exchange Server 03"
$MSExchangePlan = Get-VBRFailoverPlan -Name "MS Exchange Group Failover"
$MSExchangeGroup = $MSExchangePlan.FailoverObject
$MSExchangeGroup += $MSExchangeServer03
Set-VBRFailoverPlan -FailoverPlan $MSExchangePlan -FailoverPlanObject $MSExchangeGroup -Description "Failover plan for the mail servers group: UPDATED"
This example shows how to add one more server to the MS Exchange Group Failover failover plan.

Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $MSExchangeServer03 variable.
2. Run the Get-VBRFailoverPlan cmdlet. Specify the Name parameter value. Save the result to the $MSExchangePlan variable.
3. Get the FailoverObject parameter of the $MSExchangePlan variable. Save the array to the $MSExchangeGroup variable.
4. Add the new failover plan object to the array.
5. Run the Set-VBRFailoverPlan cmdlet. Set the $MSExchangePlan variable as the FailoverPlan parameter value. Set the $MSExchangeGroup variable as the FailoverPlanObject parameter value. Specify the Description parameter value.
> Example 2

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$failoverplan = Get-VBRFailoverPlan -Tenant $tenant -Name "ABC Company Failover Plan"
Set-VBRFailoverPlan -FailoverPlan $failoverplan -PrefailoverCommand "C:\Users\Administrator\TriggerEmailNotification.cmd"
[Cloud provider] This example shows how to add a pre-failover script to the ABC Company Failover Plan tenant failover plan.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRFailoverPlan cmdlet. Set the $tenant variable as the Tenant parameter value. Specify the Name parameter value. Save the failover plan to the $failoverplan variable.
3. Run the Set-VBRFailoverPlan cmdlet. Set the $failoverplan variable as the FailoverPlan parameter value. Specify the PrefailoverCommand parameter value.

---

### Parameters
#### **Description**
Specifies the new description you want to apply to the failover plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnablePostFailoverScript**
Enables the option to run a script after failing over to replicas is complete.
Use the PostfailoverCommand parameter to set the path to the script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnablePreFailoverScript**
Enables the option to run a script before failing over to replicas.
Use the PrefailoverCommand parameter to set the path to the script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EnablePublicIpRule**
Enables the failover plan to use the public IP rules configured in the VBRFailoverPlanObject or VBRCloudFailoverPlanObject objects.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FailoverPlan**
Specifies the failover plan or cloud failover plan you want to modify.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRFailoverPlan]`|true    |named   |True (ByPropertyName, ByValue)|

#### **FailoverPlanObject**
Specifies the array of VMs or cloud VMs you want to add to the failover plan.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[VBRFailoverPlanObject[]]`|false   |named   |False        |

#### **Name**
Specifies the new name you want to assign to the failover plan.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PostfailoverCommand**
Specifies the path to the script you want to automatically run after failing over to replicas is complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PrefailoverCommand**
Specifies the path to the script you want to automatically run before failing over to replicas.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFailoverPlan

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRFailoverPlan [-Description <String>] [-EnablePostFailoverScript] [-EnablePreFailoverScript] [-EnablePublicIpRule] -FailoverPlan <VBRFailoverPlan> [-FailoverPlanObject <VBRFailoverPlanObject[]>] [-Name 
```
```PowerShell
<String>] [-PassThru] [-PostfailoverCommand <String>] [-PrefailoverCommand <String>] [<CommonParameters>]
```
