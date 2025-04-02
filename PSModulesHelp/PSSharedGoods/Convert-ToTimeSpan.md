Convert-ToTimeSpan
------------------

### Synopsis
Calculates the time span between two given DateTime values.

---

### Description

This function calculates the time span between two specified DateTime values. It takes a start time and an end time as input parameters and returns the TimeSpan object representing the duration between them.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-ToTimeSpan -StartTime (Get-Date).AddDays(-5) -EndTime (Get-Date)
# Calculates the time span between 5 days ago and today.
```
> EXAMPLE 2

```PowerShell
Convert-ToTimeSpan -StartTime '2022-01-01' -EndTime '2022-01-10'
# Calculates the time span between January 1, 2022, and January 10, 2022.
```

---

### Parameters
#### **StartTime**
Specifies the start DateTime value. If not provided, the current date and time will be used as the default.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |1       |false        |

#### **EndTime**
Specifies the end DateTime value.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |2       |false        |

---

### Syntax
```PowerShell
Convert-ToTimeSpan [[-StartTime] <DateTime>] [[-EndTime] <DateTime>] [<CommonParameters>]
```
