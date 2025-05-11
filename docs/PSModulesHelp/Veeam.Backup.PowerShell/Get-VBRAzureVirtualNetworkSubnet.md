Get-VBRAzureVirtualNetworkSubnet
--------------------------------

### Synopsis
Returns Microsoft Azure virtual network subnets available for a subscription.

---

### Description

This cmdlet returns virtual network subnets available for a Microsoft Azure subscription.
NOTE: This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$network = Get-VBRAzureVirtualNetwork -Subscription $subscription -Name "VeeamInternalNetwork"
Get-VBRAzureVirtualNetworkSubnet -Network $network
This example shows how to get all virtual network subnets associated with a subscription.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value. Save it to the $network variable.
4. Run the Get-VBRAzureVirtualNetworkSubnet cmdlet. Set the $network variable as the Network parameter value.
> Example 2

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$network = Get-VBRAzureVirtualNetwork -Subscription $subscription -Name "VeeamInternalNetwork"
Get-VBRAzureVirtualNetworkSubnet -Network $network -Name "VeeamInternalSubnet"
This example shows how to get a virtual network subnet by the subnet name.

1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureVirtualNetwork cmdlet. Set the $subscription variable as the Subscription parameter value. Save it to the $network variable.
4. Run the Get-VBRAzureVirtualNetworkSubnet cmdlet. Set the $network variable as the Network parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the array of names.
The cmdlet will return virtual networks that match the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Network**
Specifies the virtual network.
The cmdlet will return subnets of this virtual network.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRAzureVirtualNetwork]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureVirtualNetwork

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureVirtualNetworkSubnet [-Name <String[]>] -Network <VBRAzureVirtualNetwork> [<CommonParameters>]
```
