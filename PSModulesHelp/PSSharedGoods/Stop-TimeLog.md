Stop-TimeLog
------------

### Synopsis
Stops the stopwatch and returns the elapsed time in a specified format.

---

### Description

The Stop-TimeLog function stops the provided stopwatch and returns the elapsed time in a specified format. The function can output the elapsed time as a single string or an array of days, hours, minutes, seconds, and milliseconds.

---

### Examples
> EXAMPLE 1

```PowerShell
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
# Perform some operations
Stop-TimeLog -Time $stopwatch
# Output: "0 days, 0 hours, 0 minutes, 5 seconds, 123 milliseconds"
```
> EXAMPLE 2

```PowerShell
$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
# Perform some operations
Stop-TimeLog -Time $stopwatch -Option Array
# Output: ["0 days", "0 hours", "0 minutes", "5 seconds", "123 milliseconds"]
```

---

### Parameters
#### **Time**
Specifies the stopwatch object to stop and retrieve the elapsed time from.

|Type         |Required|Position|PipelineInput |
|-------------|--------|--------|--------------|
|`[Stopwatch]`|false   |1       |true (ByValue)|

#### **Option**
Specifies the format in which the elapsed time should be returned. Valid values are 'OneLiner' (default) or 'Array'.
Valid Values:

* OneLiner
* Array

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Continue**
Indicates whether the stopwatch should continue running after retrieving the elapsed time.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Stop-TimeLog [[-Time] <Stopwatch>] [[-Option] <String>] [-Continue] [<CommonParameters>]
```
