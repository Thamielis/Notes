New-VBRAmazonEC2Container
-------------------------

### Synopsis
Defines a scope of Amazon EC2 instances, EC2 tags or AWS datacenters for a protection group.

---

### Description

This cmdlet defines the VBRAmazonEC2Container object. This object contains a scope of Amazon EC2 instances,  EC2 tags or AWS datacenters.
Use this object to create a protection group with the Add-VBRProtectionGroup cmdlet. After you create a protection group, Veeam Backup & Replication will deploy Veeam Agent on EC2 instances added to the scope of the protection group.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

* [Get-VBRAmazonEC2VM](Get-VBRAmazonEC2VM)

---

### Examples
> Example 1. Defining Scope of Amazon EC2 Instances for Protection Group

$AWSaccount = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$AWSregion = Get-VBRAmazonEC2Region -Account $AWSaccount -RegionType Global -Name "eu-central-1"
$instances = Get-VBRAmazonEC2VM -Region $AWSregion
$container = New-VBRAmazonEC2Container -Region $AWSregion -Entity $instances
This example shows how to define the scope of Amazon EC2 instances to add them to a protection group.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $AWSaccount variable.
2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $AWSaccount variable as the Account parameter value. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $AWSregion variable.
3. Run the Get-VBRAmazonEC2VM cmdlet. Set the $AWSregion variable as the Region parameter value. Save the result to the $instances variable.
4. Run the New-VBRAmazonEC2Container cmdlet. Set the $AWSregion variable as the Region parameter value. Set the $instances variable as the Entity parameter value. Save the result to the $container variable.
> Example 2. Defining Scope of AWS Datacenters for Protection Group

$AWSaccount = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$datacenter = Get-VBRAmazonEC2Region -Account $AWSaccount -RegionType Global -Name "eu-central-1"
$container = New-VBRAmazonEC2Container -Region $AWSregion -Entity $datacenter
This example shows how to define the scope of Amazon EC2 datacenters to add them to a protection group.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $AWSaccount variable.
2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $AWSaccount variable as the Account parameter value. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $datacenter variable.
3. Run the New-VBRAmazonEC2Container cmdlet. Set the $AWSregion variable as the Region parameter value. Set the $datacenter variable as the Entity parameter value. Save the result to the $container variable.
> Example 3. Defining Scope of AWS Tags for Protection Group

$AWSaccount = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$AWSregion = Get-VBRAmazonEC2Region -Account $AWSaccount -RegionType Global -Name "eu-central-1"
$tag = New-VBRAmazonEC2Tag -Key "owner" -Value "vat"
$container = New-VBRAmazonEC2Container -Region $AWSregion -Entity $tag
This example shows how to define the to define the scope of Amazon EC2 tags to add them to a protection group.
Perform the following steps:
1. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $AWSaccount variable.
2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $AWSaccount variable as the Account parameter value. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $AWSregion variable.
3. Run the New-VBRAmazonEC2Tag cmdlet. Specify the Key and the Value parameter values. Save the result to the $tag variable.
4. Run the New-VBRAmazonEC2Container cmdlet. Set the $AWSregion variable as the Region parameter value. Set the $tag variable as the Entity parameter value. Save the result to the $container variable.

---

### Parameters
#### **AutoAssignIAMRole**
Defines that the cmdlet will automatically set the IAM role with the AmazonSSMManagedInstanceCore policy to the EC2 instances that you want to back up.
If you do not provide this parameter, you will have to set the IAM role manually.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Entity**
Specifies an array of the following entities that the cmdlet will add to a scope of a protection group:
* EC2 instances.
* EC2 tags.
* AWS datacenters.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **ExcludedEntity**
Specifies an array of the following entities that the cmdlet will exclude from a scope of a protection group:
* EC2 instances.
* EC2 tags.
* AWS datacenters.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **ExcludeEntities**
Defines that the cmdlet will exclude the following entities from a scope of a protection group:
* EC2 instances.
* EC2 tags.
* AWS datacenters.
Provide the ExcludedEntity parameter to specify the excluded entities.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Region**
Specifies AWS Regions in which you want to deploy Veeam Agent on cloud machines.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRAmazonEC2Region]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonEC2Region

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
New-VBRAmazonEC2Container [-AutoAssignIAMRole] -Entity <Object[]> [-ExcludedEntity <Object[]>] [-ExcludeEntities] -Region <VBRAmazonEC2Region> [<CommonParameters>]
```
