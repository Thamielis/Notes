Set-VBRGFSRetentionPolicy
-------------------------

### Synopsis
Modifies GFS retention settings for Veeam Agent backup copy jobs.

---

### Description

This cmdlet modifies GFS retention settings for Veeam Agent backup copy jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRJob](Get-VBRJob)

* [Get-VBRRetentionPolicy](Get-VBRRetentionPolicy)

---

### Examples
> Modifying GFS Retention Policy for Backup Copy Job

$job = Get-VBRJob -Name "EC2 BCJ 01"
$policy = Get-VBRRetentionPolicy -Job $job
Set-VBRGFSRetentionPolicy -RetentionPolicy $policy -RestorePoints 5 -GFSWeeklyBackups 8 -GFSMonthlyBackups 4 -GFSYearlyBackups 9
This example shows how to modify a GFS retention policy for a backup copy job. The cmdlet will change the GFS retention policy with the following settings:
- The number of regular backups is set to 5.
- The number of weekly backups is set to 8.
- The number of monthly backups is set to 4.
- The number of yearly backups is set to 9.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Get-VBRRetentionPolicy cmdlet. Set the $job variable as the Job parameter value. Save the result to the $policy variable.
3. Run the Set-VBRGFSRetentionPolicy cmdlet. Specify the following settings:
- Set the $policy variable as the RetentionPolicy parameter value.
- Specify the RestorePoints parameter value.
- Specify the GFSWeeklyBackups parameter value.
- Specify the GFSMonthlyBackups parameter value.
- Specify the GFSYearlyBackups parameter value.

---

### Parameters
#### **GFSMonthlyBackups**
Specifies the number of monthly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **GFSQuarterlyBackups**
Specifies the number of quarterly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **GFSWeeklyBackups**
Specifies the number of weekly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **GFSYearlyBackups**
Specifies the number of yearly backups that you want to keep on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RestorePoints**
Specifies the number of restore points that you want to keep in the backup chain on the target backup repository.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPolicy**
Specifies the GFS retention policy that you want to modify.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRGFSRetentionPolicy]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRGFSRetentionPolicy

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRGFSRetentionPolicy [-GFSMonthlyBackups <Int32>] [-GFSQuarterlyBackups <Int32>] [-GFSWeeklyBackups <Int32>] [-GFSYearlyBackups <Int32>] [-RestorePoints <Int32>] -RetentionPolicy <VBRGFSRetentionPolicy> 
```
```PowerShell
[<CommonParameters>]
```
