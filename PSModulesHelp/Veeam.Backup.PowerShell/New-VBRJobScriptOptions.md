New-VBRJobScriptOptions
-----------------------

### Synopsis
Creates new job script options.

---

### Description

This cmdlet creates the VBRJobScriptOptions object. This object contains pre-job and post-job script settings for backup jobs and replication jobs.  You can use this object later to apply these settings to a job.

---

### Examples
> Configuring Script Settings

$scriptoptions = New-VBRJobScriptOptions -PreScriptEnabled -PreCommand "C:\scripts\pre-script.bat" -PostScriptEnabled -PostCommand "C:\scripts\pre-script.bat" -Periodicity Day -Day Monday
This example shows how to configure script settings with the following option:
- A script runs before job and after job.
- Scripts run on Mondays.
1. Perform the following steps:
- Run the New-VBRJobScriptOptions cmdlet. Specify the following settings:
- Provide the PreScriptEnabled parameter.
- Specify the PreCommand parameter value.
- Provide the PostScriptEnabled parameter.
- Specify the PostCommand parameter value.
- Set the Days option for the Periodicity parameter.
- Specify the Day parameter value.
Save the result to the $scriptoptions variable.

---

### Parameters
#### **Day**
Specifies the value for the Periodicity parameter (the Days mode).
Specifies the days of week when the script will run. Default: Saturday
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
Specifies the value for the Periodicity parameter (the Cycles mode).
The number of job runs after which the script must run. Default: 1 backup session

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |False        |

#### **Periodicity**
Specifies the script run mode:
* Cycles: use this option to run the script after a set number of job runs.
* Days: use this option to run the script on set days.
Use the Day and the Frequency parameters to set the values.
Valid Values:

* Cycles
* Days

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[VBRPeriodicityType]`|false   |named   |False        |

#### **PostCommand**
Specifies the path to the post-job script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PostScriptEnabled**
Defines that the cmdlet will run a script after the job. Use the PostCommand parameter to set the path to the script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PreCommand**
Specifies the path to the pre-job script.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **PreScriptEnabled**
Defines that the cmdlet will run a script before the job. Use the PreCommand parameter to set the path to the script.

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
New-VBRJobScriptOptions [-Day {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Frequency <UInt32>] [-Periodicity {Cycles | Days}] [-PostCommand <String>] [-PostScriptEnabled] 
```
```PowerShell
[-PreCommand <String>] [-PreScriptEnabled] [<CommonParameters>]
```
