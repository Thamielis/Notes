Get-VBRAzureVM
--------------

### Synopsis
Returns Azure VMs.

---

### Description

This cmdlet returns Azure VMs.

---

### Related Links
* [Get-VBRAzureAccount](Get-VBRAzureAccount)

* [Get-VBRAzureSubscription](Get-VBRAzureSubscription)

* [Get-VBRAzureLocation](Get-VBRAzureLocation)

---

### Examples
> Getting Azure VMs

$account = Get-VBRAzureAccount -Type ResourceManager -Name "AzureRM@tech.com"
$subscription = Get-VBRAzureSubscription -Account $account
$location = Get-VBRAzureLocation -Subscription $subscription
$VMs = Get-VBRAzureVM -Subscription $subscription -Location $location
This example shows how to get Azure VMs.
Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Type and the Name parameter values. Save the result to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Save the result to the $subscription variable.
3. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Save the result to the $location variable.
4. Run the Get-VBRAzureVM cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Save the result to the $VMs variable.

---

### Parameters
#### **Location**
Specifies Microsoft Azure region.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAzureLocation]`|true    |named   |False        |

#### **Subscription**
Specifies subscriptions associated with a Microsoft Azure account.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[VBRAzureSubscription]`|true    |named   |False        |

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
Get-VBRAzureVM -Location <VBRAzureLocation> -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
