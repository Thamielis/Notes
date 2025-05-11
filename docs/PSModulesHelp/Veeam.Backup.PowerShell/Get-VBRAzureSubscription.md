Get-VBRAzureSubscription
------------------------

### Synopsis
Returns subscriptions associated with a Microsoft Azure account.

---

### Description

This cmdlet returns subscriptions associated with a selected Microsoft Azure account.

---

### Examples
> Example 1

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
Get-VBRAzureSubscription -Account $account
This example shows how to get all subscriptions associated with an account.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager value as the Type parameter value. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value.
> Example 2

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account -Name "VeeamDirectRestore2Azure"
This example shows how to get a subscription by the subscription name.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager value as the Type parameter value. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Specify the Name parameter value. Save it to the $subscription variable.
> Example 3

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
Get-VBRAzureSubscription -Account $account | Where-Object Id -eq "f482cd54-454d-419f-9ec2-f388796091f9"
This example shows how to get a subscription by the subscription ID.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Set the ResourceManager value as the Type parameter value. Specify the Name parameter value. Save it to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Pass the result to the Where-Object cmdlet to select the subscriptions with the Id property that equals f482cd54-454d-419f-9ec2-f388796091f9.

---

### Parameters
#### **Account**
Specifies the account. The cmdlet will return subscriptions associated with this account.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[VBRAzureAccount]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies the array of IDs of the subscriptions you want to get.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|false   |named   |False        |

#### **Name**
Specifies the array of names of the subscriptions you want to get.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRAzureSubscription -Account <VBRAzureAccount> [-Id <Guid[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRAzureSubscription -Account <VBRAzureAccount> [-Name <String[]>] [<CommonParameters>]
```
