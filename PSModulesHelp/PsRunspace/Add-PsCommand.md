Add-PsCommand
-------------

### Synopsis
Add a command to a [System.Management.Automation.PowerShell] instance

---

### Description

Used by Invoke-Thread
Uses AddScript() or AddStatement() and AddCommand() depending on the command

---

### Examples
> EXAMPLE 1

```PowerShell
[powershell]::Create() | Add-PsCommand -Command 'Write-Output'
Add a command by sending a Cmdlet name to the -Command parameter
```

---

### Parameters
#### **PowershellInterface**
Powershell interface to add the Command to

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PowerShell[]]`|false   |named   |true (ByValue)|

#### **Command**
Command to add to the Powershell interface
This can be a scriptblock object, or a string that specifies a:
    Alias
    Function (the name of the function)
    ExternalScript (the path to the .ps1 file)
    All, Application, Cmdlet, Configuration, Filter, or Script

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **CommandInfo**
Output from Get-PsCommandInfo
Optional, to improve performance if it will be re-used for multiple calls of Add-PsCommand

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[PSObject]`|false   |named   |false        |

#### **Force**
Add Commands rather than their definitions

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DebugOutputStream**
Will be sent to the Type parameter of Write-LogMsg in the PsLogMessage module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TodaysHostname**
Hostname to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **WhoAmI**
Username to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LogBuffer**
Log messages which have not yet been written to disk

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

---

### Syntax
```PowerShell
Add-PsCommand [-PowershellInterface <PowerShell[]>] [[-Command] <Object>] [-CommandInfo <PSObject>] [-Force] [-DebugOutputStream <String>] [-TodaysHostname <String>] [-WhoAmI <String>] [-LogBuffer <Hashtable>] [<CommonParameters>]
```
