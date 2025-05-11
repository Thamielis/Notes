Get-VBRAzureResourceGroup
-------------------------

### Synopsis
Returns Microsoft Azure resource groups available for a subscription.

---

### Description

This cmdlet returns resource groups available for a selected subscription.

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureResourceGroup -Subscription $subscription
This example shows how to get all resource groups associated with a subscription.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureResourceGroup cmdlet. Set the $subscription variable as the Subscription parameter value.
> Example 2

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureResourceGroup -Subscription $subscription -Name "VeeamResourceGroup"
This example shows how to get a resource group by the resource group name.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureResourceGroup cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value.

---

### Parameters
#### **Location**
Specifies geographical locations of Microsoft Azure datacenters available for a resource group.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAzureLocation]`|false   |named   |False        |

#### **Name**
Specifies the array of names.
The cmdlet will return resource groups that match the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Subscription**
Specifies the subscription.
The cmdlet will return resource groups associated with this subscription.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRAzureSubscription]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureSubscription

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureResourceGroup [-Location <VBRAzureLocation>] [-Name <String[]>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
