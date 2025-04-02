Get-VBRAzureLocation
--------------------

### Synopsis
Returns geographic locations of Microsoft Azure datacenters available for a subscription.

---

### Description

This cmdlet returns geographic locations of Microsoft Azure datacenters available for a selected subscription.
NOTE: This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureLocation -Subscription $subscription
This example shows how to get all locations associated with a subscription.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value.
> Example 2

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureLocation -Subscription $subscription -Name "australiaeast"
This example shows how to get a location by the location name.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the array of names.
The cmdlet will return locations that match the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Subscription**
Specifies the subscription.
The cmdlet will return locations available for this subscription.

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
Get-VBRAzureLocation [-Name <String[]>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
