New-VBRSyntheticFullOptions
---------------------------

### Synopsis
Creates a synthetic full backup schedule for Veeam Agent backup jobs.

---

### Description

This cmdlet creates the VBRSyntheticFullOptions object. This object contains a synthetic full backup schedule for Veeam Agent backup jobs. With this cmdlet, you can schedule a job to create synthetic full backups periodically.

---

### Examples
> Creating Synthetic Full Backup Schedule for Veeam Agent Backup Job

```PowerShell
New-VBRSyntheticFullOptions -Enable -Days Friday
This command creates a synthetic full backup schedule. Per these settings, the Veeam Agent backup job will create synthetic full backups Fridays.
```

---

### Parameters
#### **Days**
Specifies the days of the week when the Veeam Agent backup job will create synthetic full backups.
Default: Saturday.
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

#### **Enable**
Enables the option for the Veeam Agent backup job to create synthetic full backups.

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
New-VBRSyntheticFullOptions [-Days {Sunday | Monday | Tuesday | Wednesday | Thursday | Friday | Saturday}] [-Enable] [<CommonParameters>]
```
