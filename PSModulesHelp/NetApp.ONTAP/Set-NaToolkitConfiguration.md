Set-NaToolkitConfiguration
--------------------------

### Synopsis
Set the basic Data ONTAP PowerShell Toolkit configuration.

---

### Description

Set the basic Data ONTAP PowerShell Toolkit configuration.  Used to set the debug level of the PowerShell Toolkit.  The new debug level will take effect after PowerShell is restarted.

---

### Related Links
* [Get-NaToolkitConfiguration](Get-NaToolkitConfiguration)

---

### Examples
> Example 1

Set-NaToolkitConfiguration -DebugLevel DEBUG
Set the debug level to DEBUG.

Log
---
{DataONTAP.PowerShell: DEBUG, DataONTAP.C.PowerShell: DEBUG, DataONTAP.HostUtilities: DEBUG, NetApp.Ontapi: DEBUG}

> Example 2

Set-NaToolkitConfiguration -DebugLevel DEBUG -LogToFile C:\Temp\DataONTAP.Powershell.Log
Set logger to level DEBUG and store a copy of log output in C:\Temp\DataONTAP.Powershell.Log

Log
---
{DataONTAP.PowerShell: DEBUG, DataONTAP.C.PowerShell: DEBUG, DataONTAP.HostUtilities: DEBUG, NetApp.Ontapi: DEBUG}

---

### Parameters
#### **LogLevel**
The log level.  Possible values: DEBUG, ERROR, WARN, OFF.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|DebugLevel|

#### **Logger**
The logger to change.  If not specified, all loggers will be changed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **LogToFile**
The file in which logging output is to be saved.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|false   |3       |true (ByPropertyName)|FilePath<br/>File|

#### **NoConsoleOutput**
Specify to suppress logging output to the PowerShell console. If specified, it is mandatory to specify a file where logging statements will be saved.

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[Switch]`|false   |named   |false        |SupressConsoleOutput|

---

### Inputs

---

### Outputs
* DataONTAP.Types.Utils.ToolkitConfiguration

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Set-NaToolkitConfiguration [-LogLevel] <String> [[-Logger] <String>] [[-LogToFile] <String>] [<CommonParameters>]
```
```PowerShell
Set-NaToolkitConfiguration [-LogLevel] <String> [[-Logger] <String>] [[-LogToFile] <String>] [-NoConsoleOutput] [<CommonParameters>]
```
