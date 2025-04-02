Add-VBRCopyJob
--------------

### Synopsis
Creates VM and file copy jobs.

---

### Description

This cmdlet creates a new job that copies the selected VMs to another location.
With a VM copy job, you can create a fully-functioning copy of a VM that will require no manual editing and adjustments. VM copying can be helpful if you want to move your datacenter, mirror your production environment to test lab storage, etc.
Note that when you create a copy job, you need to run it manually unless you enable a job schedule.
Run the Start-VBRJob cmdlet to start the created job.
Run the Set-VBRJobSchedule cmdlet to set schedule for the job.
Run the Copy-VBRJob cmdlet to create a copy of a job.
Note: The cmdlet will not run if the geographic location of the VMs added to the job and the job target host location do not match. If you still want to run the cmdlet, use the Force parameter.

---

### Examples
> Creating VM Copy Job

$machine = Find-VBRViEntity -Name "Serv49"
$repository = Get-VBRBackupRepository
Add-VBRCopyJob -Name "Copy02" -Type VDDK -Objects $machine -Repository $repository
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $machine variable.
2. Run the Get-VBRBackupRepository cmdlet. Save the result to the $repository variable.
3. Run the Add-VBRCopyJob cmdlet. Specify the following settings:
- Specify the Name parameter value.
- Set the VDDK option for the Type parameter.
- Set the $machine variable as the Objects parameter value.
- Set the $repository variable as the Repository parameter value.

---

### Parameters
#### **Description**
Specifies the description of the copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **FileName**
Specifies the string with the file name for the created VM copy (by default, a copied file is given the same name as the VM).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Folder**
Specifies the string with full path to the folder where the created VM copy should be stored.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **Force**
Defines that the cmdlet will create a VM copy job even if the geographic location of the VMs added to the job and the target host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the new copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **Objects**
Specifies an array of names for VMs that you want to copy.

|Type        |Required|Position|PipelineInput                 |Aliases|
|------------|--------|--------|------------------------------|-------|
|`[String[]]`|true    |named   |True (ByPropertyName, ByValue)|VM     |

#### **Repository**
Specifies the backup repository to which you want to place the copied VMs.
You cannot use scale-out backup repository as target to the VM copy job.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|true    |named   |False        |

#### **Server**
Specifies the host where the created copy should be stored.

|Type     |Required|Position|PipelineInput|Aliases              |
|---------|--------|--------|-------------|---------------------|
|`[CHost]`|true    |named   |False        |Host<br/>TargetServer|

#### **SourceServer**
Specifies the server where the target files for file copy job are located.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

#### **Type**
Specifies the string with the type of the created copy job which defines how VM data is retrieved:
* VDDK - Virtual Disk Development Kit (VMware vStorage API): used for VM backup jobs data.
* Files: used for file backup data.
* Backup: not supported (legacy mode).
* Hyper-V: not supported (legacy mode).
* VCB: not supported (legacy mode).
* NET: not supported (legacy mode).
Valid Values:

* NET
* VCB
* VDDK
* Files
* HyperV
* Backup
* Tape
* ObjectStorage
* Unknown

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ESourceType]`|true    |1       |False        |

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCopyJob [-Name] <String> [-Type] {NET | VCB | VDDK | Files | HyperV | Backup | Tape | ObjectStorage | Unknown} [-Description <String>] [-FileName <String>] -Folder <String> [-Force] -Objects <String[]> 
```
```PowerShell
-Server <CHost> -SourceServer <CHost> [<CommonParameters>]
```
```PowerShell
Add-VBRCopyJob [-Name] <String> [-Type] {NET | VCB | VDDK | Files | HyperV | Backup | Tape | ObjectStorage | Unknown} [-Description <String>] [-FileName <String>] [-Force] -Objects <String[]> -Repository 
```
```PowerShell
<CBackupRepository> [<CommonParameters>]
```
