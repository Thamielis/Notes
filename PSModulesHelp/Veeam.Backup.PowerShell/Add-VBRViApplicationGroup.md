Add-VBRViApplicationGroup
-------------------------

### Synopsis
Creates VMware application groups for SureBackup jobs.

---

### Description

This cmdlet creates application groups for SureBackup jobs.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRJobObject](Get-VBRJobObject)

* [New-VBRSureBackupVM](New-VBRSureBackupVM)

---

### Examples
> Example 1. Creating Application Group

$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job
$vm = New-VBRSureBackupVM -VM $backupobject
Add-VBRViApplicationGroup -VM $vm
This example shows how to create an application group with default name and description.

Perform the following steps:

1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.   2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Save the result to the $job variable.   3. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Save the result to the $vm variable.   4. Run the Add-VBRViApplicationGroup cmdlet. Set the $vm variable as the VM parameter value.
> Example 2. Creating Application Group with Name

$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job
$vm = New-VBRSureBackupVM -VM $backupobject
Add-VBRViApplicationGroup -VM $vm -Name "Microsoft Exchange Appgroup"
This example shows how to create an application group with the Microsoft Exchange Appgroup name.

Perform the following steps:

1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.   2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Save the result to the $job variable.   3. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Save the result to the $vm variable.   4. Run the Add-VBRViApplicationGroup cmdlet. Set the $vm variable as the VM parameter value. Specify the Name parameter value.
> Example 3. Creating Application Group with Name and Description

$job = Get-VBRJob -Name "Exchange backup"
$backupobject = Get-VBRJobObject -Job $job
$vm = New-VBRSureBackupVM -VM $backupobject
Add-VBRViApplicationGroup -VM <VBRSureBackupVM[]> -Name "Microsoft Exchange Appgroup" -Description "Application group for Exchange-related VMs"
This example shows how to create an application group with the Microsoft Exchange Appgroup name and the Application group for Exchange-related VMs description.

Perform the following steps:

1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.   2. Run the Get-VBRJobObject cmdlet. Set the $job variable as the Job parameter value. Save the result to the $job variable.   3. Run the New-VBRSureBackupVM cmdlet. Set the $backupobject variable as the VM parameter value. Save the result to the $vm variable.   4. Run the Add-VBRViApplicationGroup cmdlet. Specify the following settings:      o Set the $vm variable as the VM parameter value.      o Specify the Name parameter value.      o Specify the Description parameter value.

---

### Parameters
#### **Description**
Specifies an array of VMs. The cmdlet will add these VMs to the application group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Name**
Specifies an array of VMs. The cmdlet will add these VMs to the application group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **VM**
Specifies an array of VMs. The cmdlet will add these VMs to the application group. Accepts the VBRSureBackupVM[] object. To get this object, run the New-VBRSureBackupVM cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRSureBackupVM[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSureBackupVM[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRViApplicationGroup [-Description <String>] [-Name <String>] [-VM <VBRSureBackupVM[]>] [<CommonParameters>]
```
