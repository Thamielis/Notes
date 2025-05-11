New-VBRTapeMediaPoolRetentionPolicy
-----------------------------------

### Synopsis
Defines retention settings of a media pool.

---

### Description

This cmdlet creates the VBRTapeMediaPoolRetentionPolicy object. This object contains the retention settings of media pool.

Retention policy sets overwrite protection rules. The rules are set to media pool and are applied to all tapes belonging to this media pool. After the retention period ends, the tape is queued for overwriting.

---

### Examples
> Example 1 Creating Retention Period Rule for Media Pool

$newretention = New-VBRTapeMediaPoolRetentionPolicy -Type Period -Period Days -Value 14
This command defines media pool retention rules and saves the result to the $newretention variable. The retention rules contain the following settings:
- The new retention settings are assigned to the '$newretention' variable.
- The Type is set to 'Period', the Period is set to 'Days', and the Value is set to '14'.
> Example 2 Switching Off Data Retention for Media Pool

```PowerShell
$noretention = New-VBRTapeMediaPoolRetentionPolicy -Type Cyclic
This command defines media pool retention rules and saves the result to the $noretention variable. The Type is set to Cyclic.
```

---

### Parameters
#### **Period**
Specifies the data retention period. Use this parameter to indicate the time period for the Type parameter: - None: data is not protected. Tapes are overwritten according to the tape rotation settings.
* Days: indicates that the data retention period is measured in days. Use the Value parameter to indicate the number of days to protect the data.
* Weeks: indicates that the data retention period is measured in  weeks. Use the Value parameter to indicate the number of weeks to protect the data.
* Months: indicates that the data retention period is measured in months. Use the Value parameter to indicate the number of months to protect the data.
Valid Values:

* None
* Days
* Weeks
* Months

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRTapeMediaPoolPeriod]`|false   |named   |False        |

#### **Type**
Specifies the data retention type: - Never: the data is never overwritten. This option sets a lifelong protection for tapes.
* Period: the data is protected for an indicated period. Use the Period and the Value parameters to indicate the period settings.
* Cyclic: the data is not protected. The tapes are overwritten according to the tape rotation settings.
Valid Values:

* Never
* Period
* Cyclic

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[VBRTapeMediaPoolRetentionType]`|false   |named   |False        |

#### **Value**
Sets the number of days, weeks or month to protect the data.  You can enter value between 1 and 999. Use this parameter to indicate the value if you set the Period parameter to Days, Weeks or Months.

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
New-VBRTapeMediaPoolRetentionPolicy [-Period {None | Days | Weeks | Months}] [-Type {Never | Period | Cyclic}] [-Value <Int32>] [<CommonParameters>]
```
