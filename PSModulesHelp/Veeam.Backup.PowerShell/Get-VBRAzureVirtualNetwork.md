Get-VBRAzureVirtualNetwork
--------------------------

### Synopsis
Returns Microsoft Azure virtual networks available for a subscription.

---

### Description

This cmdlet returns virtual networks available for a Microsoft Azure subscription.
NOTE: This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureVirtualNetwork -Subscription $subscription
This example shows how to get all virtual networks associated with a subscription.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value.
> Example 2

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureVirtualNetwork -Subscription $subscription -Name "VeeamInternalNetwork"
This example shows how to get a virtual network by the virtual network name.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value.

---

### Parameters
#### **Location**
Specifies geographical locations of Microsoft Azure datacenters available for the virtual network.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAzureLocation]`|false   |named   |False        |

#### **Name**
Specifies the array of names.
The cmdlet will return virtual networks that match the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Subscription**
Specifies the subscription.
The cmdlet will return virtual networks associated with this subscription.

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
Get-VBRAzureVirtualNetwork [-Location <VBRAzureLocation>] [-Name <String[]>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
