Get-VBRAzureNetworkSecurityGroup
--------------------------------

### Synopsis
Returns Microsoft Azure security groups.

---

### Description

This cmdlet returns Microsoft Azure security groups.
NOTE: This cmdlet does not support Microsoft Azure accounts with the Azure Service Manager type of a subscription (ASM, also known as a "classic" type subscription).

---

### Related Links
* [Get-VBRAzureAccount](Get-VBRAzureAccount)

* [Get-VBRAzureSubscription](Get-VBRAzureSubscription)

---

### Examples
> Example 1. Getting All Microsoft Azure Security Groups

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account
Get-VBRAzureNetworkSecurityGroup -Subscription $subscription
This example shows how to get all security groups that are available in Microsoft Azure.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Type and Name parameter values. Save the result to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Save the result to the $subscription variable.
3. Run the Get-VBRAzureNetworkSecurityGroup cmdlet. Set the $subscription variable as the Subscription parameter value.
> Example 2. Getting Microsoft Azure Security Groups by ID

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account
Get-VBRAzureNetworkSecurityGroup -Subscription $subscription -ID "374e0811-161e-4878-bc05-2ecba95fe4bd"
This example shows how to get the 374e0811-161e-4878-bc05-2ecba95fe4bd Microsoft Azure security group.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Type and Name parameter values. Save the result to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Save the result to the $subscription variable.
3. Run the Get-VBRAzureNetworkSecurityGroup cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the ID parameter value.
> Example 3. Getting Microsoft Azure Security Groups by Name

$account = Get-VBRAzureAccount -Type ResourceManager -Name "RestoreToAzureRM@Veeam.com"
$subscription = Get-VBRAzureSubscription -Account $account
Get-VBRAzureNetworkSecurityGroup -Subscription $subscription -Name "Security Group 2000"
This example shows how to get the Security Group 2000 Microsoft Azure security group.

Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Type and Name parameter values. Save the result to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Save the result to the $subscription variable.
3. Run the Get-VBRAzureNetworkSecurityGroup cmdlet. Set the $subscription variable as the Subscription parameter value. Specify the Name parameter value.

---

### Parameters
#### **Id**
Specifies Microsoft Azure security groups ID.
The cmdlet will return security groups with the specified ID.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Location**
Specifies a geographical location of the network security group.
Accepts the VBRAzureLocation object. To get this object, run the Get-VBRAzureLocation cmdlet.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRAzureLocation]`|false   |named   |False        |

#### **Name**
Specifies an array of Microsoft Azure security groups names.
The cmdlet will return security groups with the specified names.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Subscription**
Specifies subscriptions associated with a Microsoft Azure account.
Accepts the VBRAzureSubscription object.
To create this object, run the Get-VBRAzureSubscription cmdlet.

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
Get-VBRAzureNetworkSecurityGroup [-Id <String>] [-Location <VBRAzureLocation>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
```PowerShell
Get-VBRAzureNetworkSecurityGroup [-Location <VBRAzureLocation>] [-Name <String[]>] -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
