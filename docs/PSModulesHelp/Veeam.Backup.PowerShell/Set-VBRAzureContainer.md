Set-VBRAzureContainer
---------------------

### Synopsis
Modifies a scope of Azure VMs, Azure tags or Azure Availability Zone for a protection group.

---

### Description

This cmdlet modifies a scope of Azure VMs, Azure tags or Azure Availability Zone for a protection group.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRAzureAccount](Get-VBRAzureAccount)

* [Get-VBRAzureSubscription](Get-VBRAzureSubscription)

* [Get-VBRAzureLocation](Get-VBRAzureLocation)

* [New-VBRAzureContainer](New-VBRAzureContainer)

* [Get-VBRAzureVM](Get-VBRAzureVM)

---

### Examples
> Modifying Scope of Azure Entities for Protection Group

$account = Get-VBRAzureAccount -Type ResourceManager -Name "AzureRM@tech.com"
$subscription = Get-VBRAzureSubscription -Account $account
$location = Get-VBRAzureLocation -Subscription $subscription
$scope = New-VBRAzureContainer -Subscription $subscription -Location $location -Entity $location
$VMs = Get-VBRAzureVM -Subscription $subscription -Location $location
$VMScope = Set-VBRAzureContainer -Container $scope -Entity $VMs
This example shows how to modify the scope of Azure entities. The cmdlet will include Azure VMs into scope instead of Azure Availability Zone.
Perform the following steps:
1. Define the Azure Availability Zone protection scope:
a. Run the Get-VBRAzureAccount cmdlet. Specify the Type and the Name parameter values. Save the result to the $account variable.
b. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Save the result to the $subscription variable.
c. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Save the result to the $location variable.
d. Run the New-VBRAzureContainer cmdlet. Specify the Subscription, Location and Entity parameter values. Save the result to the $scope variable.
2. Run the Get-VBRAzureVM cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Save the result to the $VMs variable.
3. Run the Set-VBRAzureContainer cmdlet. Set the $scope variable as the Container parameter value. Set the $VMs variable as the Entity parameter value. Save the result to the $VMScope variable.

---

### Parameters
#### **Container**
Specifies a scope of the following entities that you want to modify:
* Azure VMs.
* Azure tags.
* Azure Availability Zone.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRAzureContainer]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Entity**
Specifies an array of the following entities that the cmdlet till add to a scope of a protection group:
* Azure VMs.
* Azure tags.
* Azure Availability Zone.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **ExcludedEntity**
Specifies an array of the following entities that the cmdlet will exclude from a scope of a protection group:
* Azure VMs.
* Azure tags.
* Azure Availability Zone.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **ExcludeEntities**
Specifies an array of the following entities that the cmdlet will exclude from a scope of a protection group:
* Azure VMs.
* Azure tags.
* Azure Availability Zone.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Location**
Specifies Microsoft Azure region.

|Type                |Required|Position|PipelineInput                 |
|--------------------|--------|--------|------------------------------|
|`[VBRAzureLocation]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Subscription**
Specifies subscriptions associated with a Microsoft Azure account.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRAzureSubscription]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAzureContainer

Veeam.Backup.PowerShell.Infos.VBRAzureSubscription

Veeam.Backup.PowerShell.Infos.VBRAzureLocation

System.Object[]

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRAzureContainer -Container <VBRAzureContainer> [-Entity <Object[]>] [-ExcludedEntity <Object[]>] [-ExcludeEntities] [-Location <VBRAzureLocation>] [-Subscription <VBRAzureSubscription>] 
```
```PowerShell
[<CommonParameters>]
```
