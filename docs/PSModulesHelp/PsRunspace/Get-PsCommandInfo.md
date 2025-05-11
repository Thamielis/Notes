Get-PsCommandInfo
-----------------

### Synopsis
Get info about a PowerShell command

---

### Description

Used by Split-Thread, Invoke-Thread, and Add-PsCommand

Determine whether the Command is a [System.Management.Automation.ScriptBlock] object
If not, passes it to the Name parameter of Get-Command

---

### Examples
> EXAMPLE 1

```PowerShell
The following demonstrates sending a Cmdlet name to the -Command parameter
    Get-PsCommandInfo -Command 'Write-Output'
```

---

### Parameters
#### **Command**
Command to retrieve info on
This can be a scriptblock object, or a string that specifies an:
    Alias
    Function (the name of the function)
    ExternalScript (the path to the .ps1 file)
    All, Application, Cmdlet, Configuration, Filter, or Script

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **DebugOutputStream**
Will be sent to the Type parameter of Write-LogMsg in the PsLogMessage module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **TodaysHostname**
Hostname to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **WhoAmI**
Username to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **LogBuffer**
Log messages which have not yet been written to disk

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |5       |false        |

---

### Syntax
```PowerShell
Get-PsCommandInfo [[-Command] <Object>] [[-DebugOutputStream] <String>] [[-TodaysHostname] <String>] [[-WhoAmI] <String>] [[-LogBuffer] <Hashtable>] [<CommonParameters>]
```
