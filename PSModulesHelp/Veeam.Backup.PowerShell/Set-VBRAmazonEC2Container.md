Set-VBRAmazonEC2Container
-------------------------

### Synopsis
Modifiesa scope of Amazon EC2 instances, EC2 tags or AWS datacenters for a protection group.

---

### Description

Modifies a scope of Amazon EC2 instances, EC2 tags or AWS datacenters for a protection group.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRAmazonAccount](Get-VBRAmazonAccount)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

* [New-VBRAmazonEC2Container](New-VBRAmazonEC2Container)

* [Get-VBRAmazonEC2Region](Get-VBRAmazonEC2Region)

---

### Examples
> Modifying Scope of AWS Datacenters for Protection Group

$AWSaccount = Get-VBRAmazonAccount -Id "936edf7c-7cf3-4dbd-9895-c7485ef4bb2c"
$datacenter = Get-VBRAmazonEC2Region -Account $AWSaccount -RegionType Global -Name "eu-central-1"
$container = New-VBRAmazonEC2Container -Region $AWSregion -Entity $datacenter
$DCNew = Get-VBRAmazonEC2Region -Account $AWSaccount -RegionType Global -Name "eu-north-1"
Set-VBRAmazonEC2Container -Container $container -Entity $DCNew
This example shows how to modify the scope of AWS datacenters. The cmdlet will change the datacenter from eu-central-1 to eu-north-1.
Perform the following steps:
1. Define the AWS datacenter protection scope:
a. Run the Get-VBRAmazonAccount cmdlet. Specify the Id parameter value. Save the result to the $AWSaccount variable.
b. Run the Get-VBRAmazonEC2Region cmdlet. Set the $AWSaccount variable as the Account parameter value. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $datacenter variable.
c. Run the New-VBRAmazonEC2Container cmdlet. Set the $AWSregion variable as the Region parameter value. Set the $datacenter variable as the Entity parameter value. Save the result to the $container variable.
2. Run the Get-VBRAmazonEC2Region cmdlet. Set the $AWSaccount variable as the Account parameter value. Set the Global value as the RegionType parameter value. Specify the Name parameter value. Save the result to the $DCNew variable.
3. Run the Set-VBRAmazonEC2Container cmdlet. Set the $container variable as the Container parameter value. Set the $DCNew variable as the Entity parameter value.

---

### Parameters
#### **AutoAssignIAMRole**
Defines that the cmdlet will automatically set the IAM role with the AmazonSSMManagedInstanceCore policy to the EC2 instances that you want to back up.
If you do not provide this parameter, you will have to set the IAM role manually.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Container**
Specifies a scope of the following entities that you want to modify:
* EC2 instances.
* EC2 tags.
* AWS datacenters.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRAmazonEC2Container]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Entity**
Specifies an array of the following entities that the cmdlet till add to a scope of a protection group:
* EC2 instances.
* EC2 tags.
* AWS datacenters.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **ExcludedEntity**
Specifies the following entities that you do not want  to add to a protection group:
* EC2 instances.
* EC2 tags.
* AWS datacenters.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[Object[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **ExcludeEntities**
Defines that the cmdlet will exclude EC2 instances from a scope of a protection group.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Region**
Specifies AWS Regions in which you want to deploy Veeam Agent on cloud machines.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[VBRAmazonEC2Region]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRAmazonEC2Container

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
Set-VBRAmazonEC2Container [-AutoAssignIAMRole] -Container <VBRAmazonEC2Container> [-Entity <Object[]>] [-ExcludedEntity <Object[]>] [-ExcludeEntities] [-Region <VBRAmazonEC2Region>] [<CommonParameters>]
```
