Invoke-DebugIt
--------------

### Synopsis
A more visually dynamic option for printing debug information.

---

### Description

Quick function to print custom debug information with complex formatting.

---

### Examples
> EXAMPLE 1

Invoke-DebugIt -msg "Count of returned records" -val "({0} -f $($records.count)) -color Green
Assuming that the number of records returned would be five, the following would be printed to
the screen. Count of returned records : 5
The message would be gray, and the number 5 would be Cyan, providing contrasting emphasis.

---

### Parameters
#### **Message**

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |1       |false        |msg<br/>m|

#### **Value**

|Type      |Required|Position|PipelineInput |Aliases  |
|----------|--------|--------|--------------|---------|
|`[Object]`|false   |2       |true (ByValue)|val<br/>v|

#### **Color**
Used when you need to categorize/differentiate, visually, types of values.
Default color is Cyan.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |c      |

#### **Force**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |f      |

#### **Console**
Used when you want to log to the console. Can be used when logging to file as well.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |con    |

#### **EvetLog**
Should we log to the console

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EventId**
Add an entry to the Application Event log

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Logfile**
Used to log output to file. Logged as CSV

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[String]`|false   |named   |false        |log<br/>l|

---

### Notes
Pretty easy to understand. Just give it a try :)

CHANGELOG:

ver 0.2
- Changed parameters to full name
- Added aliases to the parameters so older scripts would continue to function
- Added the ability to log to file
- Added -Console switch parameter for specifying output type
- Added logic for older scripts that are not console switch aware

ver 0.3
- Takes value from pipeline
- Added positional values to parameters
- Changed type accelerator from .NET [Boolean] to PowerShell [Bool]
- Added application event log, logging.

---

### Syntax
```PowerShell
Invoke-DebugIt [[-Message] <String>] [[-Value] <Object>] [-Color <String>] [-Force] [-Console] [-EvetLog] [-EventId <Int32>] [-Logfile <String>] [<CommonParameters>]
```
