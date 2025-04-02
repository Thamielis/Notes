New-VBRJobVssOptions
--------------------

### Synopsis
Returns default set of VSS options for job or VM in job.

---

### Description

This cmdlet returns the CVssOptions object. This object contains default VSS settings for backup jobs, replication jobs or selected VMs. Use an appropriate parameter set for each case.
You can modify the settings and use this object to change the VSS settings of a job or VM. Run the Set-VBRJobVssOptions cmdlet to apply the VSS settings to a job.
Tip: Save the object to a variable when you customize settings: this variable can be used in several jobs.

---

### Examples
> Getting CVssOptions Object for Backup Job

$o = New-VBRJobVssOptions
$o.Enabled = $true
$o.GuestFSIndexingType = "Everyfolders"
$o.TransactionLogsTruncation = "Always"
This example shows how to get the CVssOptions object with customized VSS settings for a backup job.
Perform the following steps:
1. Run the New-VBRJobVssOptions cmdlet. Save the result to the $o variable.
2. Modify the VSS settings. Specify the following settings:
- Provide the $true value for the Enabled property of the $o variable.
- Provide the Everyfolders value for the GuestFSIndexingType property of the $o variable.
- Provide the Always value for the TransactionLogsTruncation property of the $o variable.

---

### Parameters
#### **ForJob**
Defines that the cmdlet will return the list of the default VSS settings for backup, replication or copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForObject**
Defines that the cmdlet will return the list of the default VSS settings for VMs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ForReplicaJob**
Defines that the cmdlet will return the list of the default VSS settings for replication job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
New-VBRJobVssOptions [-ForJob] [<CommonParameters>]
```
```PowerShell
New-VBRJobVssOptions [-ForObject] [<CommonParameters>]
```
```PowerShell
New-VBRJobVssOptions [-ForReplicaJob] [<CommonParameters>]
```
