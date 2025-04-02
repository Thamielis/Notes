New-VBRComputerWarningOptions
-----------------------------

### Synopsis
Defines notification settings for computers not processed by Veeam Agent jobs.

---

### Description

This cmdlet creates the VBRComputerWarningOptions object. This object defines notification settings for computers not processed by Veeam Agent jobs.

---

### Examples
> Defining Notifications Settings for Computers not Processed by Veeam Agent Jobs

```PowerShell
$warning = New-VBRComputerWarningOptions -Enable
This command enables notification settings for computers not processed by Veeam Agent jobs.
```

---

### Parameters
#### **Enable**
Defines that the notification for computers not processed by Veeam Agent jobs are enabled. If you want to disable these notifications, set this parameter to the $false value: Enable:$false.
Default: True.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WarningPolicy**
Specifies a number of days within which Veeam Agent must send notifications. When this period is exceeded, the cmdlet will send notifications if Veeam Agent job did not process machines within the specified period.
Permitted values: 1-999.
Default: 14

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

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
New-VBRComputerWarningOptions [-Enable] [-WarningPolicy <Int32>] [<CommonParameters>]
```
