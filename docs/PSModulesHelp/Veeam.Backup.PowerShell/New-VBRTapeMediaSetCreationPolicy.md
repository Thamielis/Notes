New-VBRTapeMediaSetCreationPolicy
---------------------------------

### Synopsis
Defines a set of rules for creating media sets.

---

### Description

This cmdlet creates a new VBRTapeMediaSetCreationPolicy object.

This object contains the set of rules for creating media sets. You can apply these settings when configuring media sets.

---

### Related Links
* [New-VBRDailyOptions](New-VBRDailyOptions)

---

### Examples
> Example 1 Creating Media Set Creation Rules - New Media Set for Every Backup Session

```PowerShell
New-VBRTapeMediaSetCreationPolicy -Type Always
This command defines media set creation rules. A new media set will be created for every backup session.
```
> Example 2 Creating Media Set Creation Rules - New Media Set Every Sunday

$dailyoptions = New-VBRDailyOptions -DayOfWeek Sunday -Period 22:00 -Type SelectedDays
New-VBRTapeMediaSetCreationPolicy -DailyOptions $dailyoptions -Type Daily
This example shows how to define media set creation rules. This cmdlet will create a new media set every Sunday at 22:00.

Perform the following steps:
1. Run the New-VBRDailyOptions cmdlet. Specify the DayOfWeek, Period and the Type parameter values. Save the result to the $dailyoptions variable.
2. Run the New-VBRTapeMediaSetCreationPolicy cmdlet. Set the $dailyoptions variable as the DailyOptions parameter value. Set the Daily option for the Type parameter.

---

### Parameters
#### **DailyOptions**
Specifies the schedule settings you want to apply to the media set. Accepts the VBRDailyOptions object. Default: Selected Days, 18 hours, Saturday.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[VBRDailyOptions]`|false   |named   |False        |

#### **Type**
Specifies the type of policy for creating media sets:
* Never: new media sets are not created. All data archived to tape is written to the same media set.
* Always: new media set is created for each tape job session.
* Daily: new media set is created on particular days. Use the DailyOptions parameter to set days on which you want the media sets to be created.
* Monthly: not supported.
Default: Never.
Valid Values:

* Never
* Always
* Daily
* Monthly

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRTapeMediaSetCreationPolicyType]`|false   |named   |False        |

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
New-VBRTapeMediaSetCreationPolicy [-DailyOptions <VBRDailyOptions>] [-Type {Never | Always | Daily | Monthly}] [<CommonParameters>]
```
