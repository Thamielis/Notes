Get-VBRAzureStorageAccount
--------------------------

### Synopsis
Returns Microsoft Azure storage accounts available for a subscription.

---

### Description

This cmdlet returns storage accounts available for a Microsoft Azure subscription.

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureStorageAccount -Subscription $subscription
This example shows how to get all storage accounts associated with a subscription.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureStorageAccount cmdlet. Set the $subscription variable as the Subscription parameter value.
> Example 2

$account = Get-VBRAzureAccount -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
Get-VBRAzureStorageAccount -Subscription $subscription -Name "VeeamDirectRestore2AzureStorage"
This example shows how to get a storage account by the storage account name.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
3. Run the Get-VBRAzureStorageAccount cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value.

---

### Parameters
#### **Name**
Specifies the array of names.
The cmdlet will return storage accounts that match the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Subscription**
Specifies the subscription.
The cmdlet will return storage accounts associated with this subscription.

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
Get-VBRAzureStorageAccount [-Name <String[]>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
