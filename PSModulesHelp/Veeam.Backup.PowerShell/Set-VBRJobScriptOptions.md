Set-VBRJobScriptOptions
-----------------------

### Synopsis
Modifies job script options.

---

### Description

This cmdlet modifies pre-job and post-job script settings for backup jobs and for replication jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameters values with new values.  The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRComputerBackupJob](Get-VBRComputerBackupJob)

* [Set-VBRComputerBackupJob](Set-VBRComputerBackupJob)

---

### Examples
> Modifying Script Options [Using Variable]

$job = Get-VBRComputerBackupJob -Name "Backup Job"
$scriptOptions = $job.ScriptOptions
$newScriptOptions = Set-VBRJobScriptOptions -JobScriptOptions $scriptOptions -Periodicity Days -Day Thursday
Set-VBRComputerBackupJob -Job $job -ScriptOptions $newScriptOptions
This example shows how to get the script options for a computer backup job, save them to a variable, then modify the script options and re-save them to the variable.
Perform the following steps:
1. Run the Get-VBRComputerBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Save the ScriptOptions property of the $job variable to the $scriptOptions variable.
3. Run the Set-VBRJobScriptOptions cmdlet. Specify the following settings:
- Set the $scriptOptions variable as the JobScriptOptions parameter value.
- Set the Days option for the Periodicity parameter.
- Specify the Day parameter value.
Save the result to the $newScriptOptions variable. 4. Run the Set-VBRComputerBackupJob cmdlet. Set the $job variable as the Job parameter value. Set the $newScriptOptions variable as the ScriptOptions parameter value.

---

### Parameters
#### **Day**
For the Days option. Specifies the days of the week when the script must run.
Valid Values:

* Sunday
* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[DayOfWeek[]]`|false   |named   |False        |

#### **Frequency**
For the Cycles option. Specifies the number of backup sessions after which the script must run.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |False        |

#### **JobScriptOptions**
Specifies the script options that you want to modify.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[VBRJobScriptOptions]`|true    |named   |False        |

#### **Periodicity**
Specifies the script run schedule:
* Cycles:  use this option to run scripts after the specified number of backup sessions.
* Days: use this option to run scripts on the selected days.
Use the Day and the Frequency parameters to set the values.
Valid Values:

* Cycles
* Days

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRPeriodicityType]`|false   |named   |False        |

#### **PostCommand**
For the PostScriptEnabled parameter. Specifies the path to the post-job script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PostScriptEnabled**
Defines that you want to run a script after the job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreCommand**
For the PreScriptEnabled parameter. Specifies the path to the pre-job script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PreScriptEnabled**
Defines that you want to run a script before the job.

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
Set-VBRJobScriptOptions [-Day {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Frequency <UInt32>] -JobScriptOptions <VBRJobScriptOptions> [-Periodicity {Cycles | Days}] [-PostCommand 
```
```PowerShell
<String>] [-PostScriptEnabled] [-PreCommand <String>] [-PreScriptEnabled] [<CommonParameters>]
```
