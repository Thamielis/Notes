Set-VBRSimpleRetentionPolicy
----------------------------

### Synopsis
Modifies a retention policy for backup copy jobs that process backups stored on external repositories.

---

### Description

This cmdlet modifies a retention policy for backup copy jobs that process backups stored on external repositories.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRRetentionPolicy](Get-VBRRetentionPolicy)

---

### Examples
> Modifying Retention Policy for Backup Copy Job

$job = Get-VBRJob -Name "EC2 BCJ 01"
$policy = Get-VBRRetentionPolicy -Job $job
Set-VBRSimpleRetentionPolicy -RetentionPolicy $policy -RestorePoints 5
This example shows how to modify a retention policy for a backup copy job. The target backup repository will keep the last 5 restore points.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRRetentionPolicy cmdlet. Set the $job variable as the Job parameter value. Save the result to the $policy variable.
3. Run the Set-VBRSimpleRetentionPolicy cmdlet. Set the $policy variable as the RetentionPolicy parameter value. Specify the RestorePoints parameter value.

---

### Parameters
#### **RestorePoints**
Specifies a number of restore points.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies a retention policy for a backup copy job.
The cmdlet will modify this policy.

|Type                        |Required|Position|PipelineInput |
|----------------------------|--------|--------|--------------|
|`[VBRSimpleRetentionPolicy]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRSimpleRetentionPolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRSimpleRetentionPolicy [-RestorePoints <Int32>] -RetentionPolicy <VBRSimpleRetentionPolicy> [<CommonParameters>]
```
