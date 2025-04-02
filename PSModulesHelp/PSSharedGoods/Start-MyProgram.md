Start-MyProgram
---------------

### Synopsis
Starts a program with specified arguments and logs the output.

---

### Description

This function starts a program with the provided arguments and logs the output using a specified logger. If no logger is provided, it returns the output as a string.

---

### Examples
> EXAMPLE 1

```PowerShell
Start-MyProgram -Program "C:\Program.exe" -CmdArgList @("-arg1", "-arg2") -LoggerParameters @{"LogPath"="C:\Logs"; "LogLevel"="Info"}
Starts the program "C:\Program.exe" with arguments "-arg1" and "-arg2" and logs the output using a logger with log path "C:\Logs" and log level "Info".
```
> EXAMPLE 2

```PowerShell
Start-MyProgram -Program "C:\AnotherProgram.exe" -CmdArgList @("-input", "file.txt")
Starts the program "C:\AnotherProgram.exe" with argument "-input file.txt" and returns the output as a string.
```

---

### Parameters
#### **Program**
The path to the program to be executed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **CmdArgList**
An array of arguments to be passed to the program.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **LoggerParameters**
A dictionary containing parameters for the logger.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |3       |false        |

---

### Syntax
```PowerShell
Start-MyProgram [[-Program] <String>] [[-CmdArgList] <String[]>] [[-LoggerParameters] <IDictionary>] [<CommonParameters>]
```
