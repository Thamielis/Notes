Get-VBRAzureCloudService
------------------------

### Synopsis
Returns Microsoft Azure cloud services available for a subscription.

---

### Description

This cmdlet returns the Microsoft Azure cloud services available for a selected subscription.
You can get the cloud services only for Microsoft Azure Classic accounts.
NOTE: This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Type Classic -Name "RestoreToAzure@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureCloudService -Subscription $subscription -Name "VeeamCloudService"
This example shows how to get a cloud service by the cloud service name.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Set the Classic value as the Type parameter value. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureCloudService cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
The array on names of cloud services.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Subscription**
Specifies the subscription. The cmdlet will return cloud services associated with this subscription.

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
Get-VBRAzureCloudService [-Name <String[]>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
