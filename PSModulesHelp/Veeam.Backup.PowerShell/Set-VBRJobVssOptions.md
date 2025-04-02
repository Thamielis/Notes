Set-VBRJobVssOptions
--------------------

### Synopsis
Applies custom VSS settings to a selected job.

---

### Description

This cmdlet applies a set of customized VSS settings to a selected job.

To apply the set of customized settings you need to first create a CVssOptions object. This object unifies all the VSS options you want to apply to the job.
Run the New-VBRJobVssOptions cmdlet to create the CVssOptions object.
Run the Set-VBRJobObjectVssOptions cmdlet to apply VSS settings to specific VMs in job.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [New-VBRJobVssOptions](New-VBRJobVssOptions)

* [Get-VBRCredentials](Get-VBRCredentials)

---

### Examples
> Example 1. Applying Custom VSS Options to Backup Job [Using Pipeline]

$options = New-VBRJobVssOptions
Get-VBRJob -Name "Backup Job 01" | Set-VBRJobVssOptions -Options $options
This example shows how to apply custom VSS options to the backup job named Backup Job 01.
Perform the following steps:
1. Run the New-VBRJobVssOptions cmdlet. Save the result to the $options variable.
2. Run the Get-VBRJob cmdlet. Specify the Name parameter value.
3. Pipe the cmdlet output to the Set-VBRJobVssOptions cmdlet. Set the $options variable as the Options parameter value.
> Example 2. Applying Custom VSS Options to Job [Using Variable]

$job = Get-VBRJob
$options = New-VBRJobVssOptions
Set-VBRJobVssOptions -Job $job -Options $options
This example shows how to apply custom VSS options to the job represented by the $job variable.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Save the result to the $job variable.
2. Run the New-VBRJobVssOptions cmdlet. Save the result to the $options variable.
3. Run the Set-VBRJobVssOptions cmdlet. Set the $job variable as the Job parameter value. Set the $options variable as the Options parameter value.

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the guest VM.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|true    |named   |False        |

#### **Job**
Specifies the job you want to edit.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |0       |True (ByPropertyName, ByValue)|

#### **Options**
Specifies the set of parameters you want to apply to the job.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[CGuestProcessingOptions]`|true    |1       |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRJobVssOptions [-Job] <CBackupJob[]> -Credentials <CCredentials> [<CommonParameters>]
```
```PowerShell
Set-VBRJobVssOptions [-Job] <CBackupJob[]> [-Options] <CGuestProcessingOptions> [<CommonParameters>]
```
