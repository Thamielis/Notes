Set-LoggingCapabilities
-----------------------

### Synopsis
Sets up logging capabilities by managing log files.

---

### Description

This function sets up logging capabilities by creating the necessary directories and managing the number of log files based on the specified maximum.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-LoggingCapabilities -LogPath "C:\Logs\log.log" -ScriptPath "C:\Scripts\script.ps1" -LogMaximum 10 -ShowTime -TimeFormat "yyyy-MM-dd HH:mm:ss" -ParameterPSDefaultParameterValues $Script:PSDefaultParameterValues
```
> EXAMPLE 2

```PowerShell
Set-LoggingCapabilities -LogPath "C:\Logs\log.log" -ScriptPath "C:\Scripts\script.ps1" -LogMaximum 10 -ShowTime -TimeFormat "yyyy-MM-dd HH:mm:ss"
```

---

### Parameters
#### **LogPath**
The path where the log files will be stored.

|Type      |Required|Position|PipelineInput|Aliases                                             |
|----------|--------|--------|-------------|----------------------------------------------------|
|`[String]`|false   |1       |false        |Path<br/>Log<br/>Folder<br/>LiteralPath<br/>FilePath|

#### **ScriptPath**
The path of the script that generates the logs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **LogMaximum**
The maximum number of log files to keep. Older files will be deleted if this limit is exceeded.

|Type     |Required|Position|PipelineInput|Aliases|
|---------|--------|--------|-------------|-------|
|`[Int32]`|false   |3       |false        |Maximum|

#### **ShowTime**
Switch to include timestamps in the log entries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TimeFormat**
The format of the timestamps in the log entries.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **ParameterPSDefaultParameterValues**
The hashtable of default parameter values for the Write-Color function.
If this parameter is not provided, the function will create a new hashtable.
This will only work properly if the function is nested as private function in another module.
It's advised to provide the hashtable from the parent function for this to work always.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |5       |false        |

---

### Notes
This function is used in:
- CleanupMonster
- PasswordSolution
- SharePointEssentials

And many other scripts.

---

### Syntax
```PowerShell
Set-LoggingCapabilities [[-LogPath] <String>] [[-ScriptPath] <String>] [[-LogMaximum] <Int32>] [-ShowTime] [[-TimeFormat] <String>] [[-ParameterPSDefaultParameterValues] <IDictionary>] [<CommonParameters>]
```
