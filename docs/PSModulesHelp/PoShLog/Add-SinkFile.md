Add-SinkFile
------------

### Synopsis
Write log events to the specified file

---

### Description

Write log events to the specified file

---

### Examples
> EXAMPLE 1

```PowerShell
New-Logger | Add-SinkFile -Path "C:\Logs\test.log" | Start-Logger
```
> EXAMPLE 2

```PowerShell
New-Logger | Add-SinkFile -Path "C:\Logs\test-.txt" -RollingInterval Hour -OutputTemplate '{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] {Message:lj}{NewLine}{Exception} {Properties:j}{NewLine}' | Start-Logger
```
> EXAMPLE 3

```PowerShell
New-Logger | Add-SinkFile -Path 'C:\Data\Log\test.log' -Formatter (Get-JsonFormatter) | Start-Logger
```

---

### Parameters
#### **LoggerConfig**
Instance of LoggerConfiguration

|Type                   |Required|Position|PipelineInput |
|-----------------------|--------|--------|--------------|
|`[LoggerConfiguration]`|true    |named   |true (ByValue)|

#### **Path**
Path to the file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Formatter**
A formatter, such as JsonFormatter(See Get-JsonFormatter), to convert the log events into text for the file. If control of regular text formatting is required, use Default parameter set.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ITextFormatter]`|true    |named   |false        |

#### **RestrictedToMinimumLevel**
The minimum level for events passed through the sink. Ignored when LevelSwitch is specified.
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|false   |named   |false        |

#### **OutputTemplate**
A message template describing the format used to write to the sink.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FormatProvider**
Supplies culture-specific formatting information, or null.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[IFormatProvider]`|false   |named   |false        |

#### **FileSizeLimitBytes**
The approximate maximum size, in bytes, to which a log file will be allowed to grow. For unrestricted growth, pass null. The default is 1 GB. To avoid writing partial events, the last event within the limit will be written in full even if it exceeds the limit.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **LevelSwitch**
A switch allowing the pass-through minimum level to be changed at runtime.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[LoggingLevelSwitch]`|false   |named   |false        |

#### **Buffered**
Indicates if flushing to the output file can be buffered or not. The default is false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Shared**
Allow the log file to be shared by multiple processes. The default is false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FlushToDiskInterval**
If provided, a full disk flush will be performed periodically at the specified interval.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **RollingInterval**
The interval at which logging will roll over to a new file.
Valid Values:

* Infinite
* Year
* Month
* Day
* Hour
* Minute

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[RollingInterval]`|false   |named   |false        |

#### **RollOnFileSizeLimit**
If true, a new file will be created when the file size limit is reached. Filenames will have a number appended in the format _NNN, with the first filename given no number.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RetainedFileCountLimit**
The maximum number of log files that will be retained, including the current log file. For unlimited retention, pass null. The default is 31.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |named   |false        |

#### **Encoding**
Character encoding used to write the text file. The default is UTF-8 without BOM.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Encoding]`|false   |named   |false        |

#### **Hooks**
Optionally enables hooking into log file lifecycle events.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[FileLifecycleHooks]`|false   |named   |false        |

---

### Inputs
Instance of LoggerConfiguration

---

### Outputs
* LoggerConfiguration object allowing method chaining

---

### Syntax
```PowerShell
Add-SinkFile -LoggerConfig <LoggerConfiguration> -Path <String> [-RestrictedToMinimumLevel {Verbose | Debug | Information | Warning | Error | Fatal}] [-OutputTemplate <String>] [-FormatProvider <IFormatProvider>] [-FileSizeLimitBytes <Nullable`1>] [-LevelSwitch <LoggingLevelSwitch>] [-Buffered] [-Shared] [-FlushToDiskInterval <Nullable`1>] [-RollingInterval {Infinite | Year | Month | Day | Hour | Minute}] [-RollOnFileSizeLimit] [-RetainedFileCountLimit <Nullable`1>] [-Encoding <Encoding>] [-Hooks <FileLifecycleHooks>] [<CommonParameters>]
```
```PowerShell
Add-SinkFile -LoggerConfig <LoggerConfiguration> -Path <String> -Formatter <ITextFormatter> [-RestrictedToMinimumLevel {Verbose | Debug | Information | Warning | Error | Fatal}] [-OutputTemplate <String>] [-FileSizeLimitBytes <Nullable`1>] [-LevelSwitch <LoggingLevelSwitch>] [-Buffered] [-Shared] [-FlushToDiskInterval <Nullable`1>] [-RollingInterval {Infinite | Year | Month | Day | Hour | Minute}] [-RollOnFileSizeLimit] [-RetainedFileCountLimit <Nullable`1>] [-Encoding <Encoding>] [-Hooks <FileLifecycleHooks>] [<CommonParameters>]
```
