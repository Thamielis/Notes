New-VBRAzureContainer
---------------------

### Synopsis
Defines a scope of Azure VMs, Azure tags or Azure Availability Zone for a protection group.

---

### Description

This cmdlet defines the VBRAzureContainer object. This object contains a scope of Azure VMs, Azure tags or Azure Availability Zone for a protection group.
Use this object to create a protection group with the Add-VBRProtectionGroup cmdlet. After you create a protection group, Veeam Backup & Replication will deploy Veeam Agent on Azure VMs, Azure tags or Azure Availability Zone added to the scope of the protection group.

---

### Related Links
* [Get-VBRAzureAccount](Get-VBRAzureAccount)

* [Get-VBRAzureSubscription](Get-VBRAzureSubscription)

* [Get-VBRAzureLocation](Get-VBRAzureLocation)

* [Get-VBRAzureVM](Get-VBRAzureVM)

---

### Examples
> Defining Scope of Azure VMs for Protection Group

$account = Get-VBRAzureAccount -Type ResourceManager -Name "AzureRM@tech.com"
$subscription = Get-VBRAzureSubscription -Account $account
$location = Get-VBRAzureLocation -Subscription $subscription
$VMs = Get-VBRAzureVM -Subscription $subscription -Location $location
$scope = New-VBRAzureContainer -Subscription $subscription -Location $location -Entity $VMs
This example shows how to define the scope of Azure VMs to add them to a protection group.
Perform the following steps:
1. Run the Get-VBRAzureAccount cmdlet. Specify the Type and the Name parameter values. Save the result to the $account variable.
2. Run the Get-VBRAzureSubscription cmdlet. Set the $account variable as the Account parameter value. Save the result to the $subscription variable.
3. Run the Get-VBRAzureLocation cmdlet. Set the $subscription variable as the Subscription parameter value. Save the result to the $location variable.
4. Run the Get-VBRAzureVM cmdlet.  Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Save the result to the $VMs variable.
5. Run the New-VBRAzureContainer cmdlet. Set the $subscription variable as the Subscription parameter value. Set the $location variable as the Location parameter value. Set the $VMs variable as the Entity parameter value. Save the result to the $scope variable.

---

### Parameters
#### **Entity**
Specifies an array of the following entities that the cmdlet till add to a scope of a protection group:
* Azure VMs.
* Azure tags.
* Azure Availability Zone.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
|`[VBRAzureLocation]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Subscription**
Specifies subscriptions associated with a Microsoft Azure account.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[VBRAzureSubscription]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
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
New-VBRAzureContainer -Entity <Object[]> [-ExcludedEntity <Object[]>] [-ExcludeEntities] -Location <VBRAzureLocation> -Subscription <VBRAzureSubscription> [<CommonParameters>]
```
