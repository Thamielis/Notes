Convert-TimeToDays
------------------

### Synopsis
Converts the time span between two dates into the number of days.

---

### Description

This function calculates the number of days between two given dates. It allows for flexibility in handling different date formats and provides an option to ignore specific dates.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-TimeToDays -StartTime (Get-Date).AddDays(-5) -EndTime (Get-Date)
# Calculates the number of days between 5 days ago and today.
```
> EXAMPLE 2

```PowerShell
Convert-TimeToDays -StartTime '2022-01-01' -EndTime '2022-01-10' -Ignore '*2022*'
# Calculates the number of days between January 1, 2022, and January 10, 2022, ignoring any dates containing '2022'.
```

---

### Parameters
#### **StartTime**
Specifies the start date and time of the time span.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **EndTime**
Specifies the end date and time of the time span.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Ignore**
Specifies a pattern to ignore specific dates. Default is '*1601*'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
Convert-TimeToDays [[-StartTime] <Object>] [[-EndTime] <Object>] [[-Ignore] <String>] [<CommonParameters>]
```
