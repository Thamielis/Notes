Set-VBRApplicationGroup
-----------------------

### Synopsis
Modifies settings of application groups.

---

### Description

This cmdlet modifies settings of application groups.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

* [New-VBRSureBackupVM](New-VBRSureBackupVM)

* [Get-VBRApplicationGroup](Get-VBRApplicationGroup)

---

### Examples
> Example 1. Modifying VMs Added to Application Group

$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job
$vm = New-VBRSureBackupVM -VM $backupobject
$appgroup = Get-VBRApplicationGroup
Set-VBRApplicationGroup -ApplicationGroup $appgroup -VM $vm
This example shows how to add new VMs to the existing application group.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Save the result to the $backupobject variable.
3. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Save the result to the $vm variable.
4. Run the Get-VBRApplicationGroup cmdlet. Save the result to the $appgroup variable.
5. Run the Set-VBRApplicationGroup cmdlet. Set the $appgroup variable as the ApplicationGroup parameter value. Set the $vm variable as the VM parameter value.
> Example 2. Modifying Name of Application Group

$appgroup = Get-VBRApplicationGroup
Set-VBRApplicationGroup -ApplicationGroup $appgroup -Name "Additional Application Group"
This example shows how to modify a name of the application group added to the <%VBR%> infrastructure.
Perform the following steps:
1. Run the Get-VBRApplicationGroup cmdlet. Save the result to the $appgroup variable.
2. Run the Set-VBRApplicationGroup cmdlet. Set the $appgroup variable as the ApplicationGroup parameter value. Specify the Name parameter value.
> Example 3. Modifying Description of Application Group

$appgroup = Get-VBRApplicationGroup
Set-VBRApplicationGroup -ApplicationGroup $appgroup -Description "Application Group for Exchange verification"
This example shows how to modify a description of the application group added to the <%VBR%> infrastructure.
Perform the following steps:
1. Run the Get-VBRApplicationGroup cmdlet. Save the result to the $appgroup variable.
2. Run the Set-VBRApplicationGroup cmdlet. Set the $appgroup variable as the ApplicationGroup parameter value. Specify the Description parameter value.

---

### Parameters
#### **ApplicationGroup**
Specifies an application group. The cmdlet will modify this application group.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRApplicationGroup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Description**
Specifies a description of an application group. The cmdlet will create the application group with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies a name of an application group. The cmdlet will create the application group with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VM**
Specifies an array of VMs. The cmdlet will add these VMs to the application group.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[VBRSureBackupVM[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRApplicationGroup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRApplicationGroup -ApplicationGroup <VBRApplicationGroup> [-Description <String>] [-Name <String>] [-VM <VBRSureBackupVM[]>] [<CommonParameters>]
```
