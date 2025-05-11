Set-VBRComputerWarningOptions
-----------------------------

### Synopsis
Modifies notification settings for computers not processed by Veeam Agent jobs.

---

### Description

This cmdlet modifies notification settings for computers not processed by Veeam Agent jobs.
Note: To modify settings, specify new values for the necessary parameters. The cmdlet will overwrite the previous parameter values with new values. The parameters that you omit will remain unchanged.

---

### Examples
> Modifying Notifications Settings for Computers not Processed by Veeam Agent Jobs

```PowerShell
$warning = New-VBRComputerWarningOptions -WarningPolicy 15
This command modifies a warning time period of notifications settings for computers not processed by Veeam Agent jobs.
The cmdlet will send notifications in 15 if the Veeam Agent job did not process machines within the specified period.
```

---

### Parameters
#### **Enable**
Defines that the notification for computers not processed by Veeam Agent jobs are enabled. If you want to disable these notifications, set this parameter to the $false value: Enable:$false.
Default: True.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WarningOptions**
Specifies notification settings that you want to modify.

|Type                         |Required|Position|PipelineInput |
|-----------------------------|--------|--------|--------------|
|`[VBRComputerWarningOptions]`|true    |named   |True (ByValue)|

#### **WarningPolicy**
Specifies a number of days within which Veeam Agent must send notifications. When this period is exceeded, the cmdlet will send notifications if Veeam Agent jobs did not process machines within the specified period.
Permitted values: 1-999.
Default: 14

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRComputerWarningOptions

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRComputerWarningOptions [-Enable] -WarningOptions <VBRComputerWarningOptions> [-WarningPolicy <Int32>] [<CommonParameters>]
```
