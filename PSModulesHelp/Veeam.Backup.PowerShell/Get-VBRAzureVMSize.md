Get-VBRAzureVMSize
------------------

### Synopsis
Returns Microsoft Azure VM configuration options available for a subscription.

---

### Description

This cmdlet returns VM configuration options available for a for a Microsoft Azure subscription.

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$location = Get-VBRAzureLocation -Subscription $subscription -Name "australiaeast"
Get-VBRAzureVMSize -Subscription $subscription -Location $location
This example shows how to get all VM configuration options available for a subscription.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save it to the $location variable.
4. Run the Get-VBRAzureVMSize cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value.
> Example 2

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
$location = Get-VBRAzureLocation -Subscription $subscription -Name "australiaeast"
Get-VBRAzureVMSize -Subscription $subscription -Location $location -Name "Standard_G3"
This example shows how to get a VM configuration by the VM configuration name.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value. Save it to the $location variable.
4. Run the Get-VBRAzureVMSize cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Specify the Name parameter value.

---

### Parameters
#### **Location**
Specifies the geographic location of the data center.

|Type                |Required|Position|PipelineInput        |
|--------------------|--------|--------|---------------------|
|`[VBRAzureLocation]`|true    |named   |True (ByPropertyName)|

#### **Name**
Specifies the array of names.
The cmdlet will return VM configuration options that match the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Subscription**
Specifies the subscription.
The cmdlet will return VM configuration options associated with this subscription.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRAzureSubscription]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureSubscription

Veeam.Backup.PowerShell.Infos.VBRAzureLocation

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureVMSize -Location <VBRAzureLocation> [-Name <String[]>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
