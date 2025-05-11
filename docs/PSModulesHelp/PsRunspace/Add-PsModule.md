Add-PsModule
------------

### Synopsis
Import a Module in a [System.Management.Automation.Runspaces.InitialSessionState] instance

---

### Description

Used by Add-PsCommand
Uses ImportPSModule() or ImportPSModulesFromPath() depending on the module

---

### Examples
> EXAMPLE 1

```PowerShell
$InitialSessionState = [system.management.automation.runspaces.initialsessionstate]::CreateDefault()
Add-PsModule -InitialSessionState $InitialSessionState -ModuleInfo $ModuleInfo
```

---

### Parameters
#### **InitialSessionState**
Powershell interface to add the Command to

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[InitialSessionState]`|true    |named   |false        |

#### **ModuleInfo**
ModuleInfo object for the module to add to the Powershell interface

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[PSModuleInfo[]]`|false   |1       |false        |

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
Add-PsModule -InitialSessionState <InitialSessionState> [[-ModuleInfo] <PSModuleInfo[]>] [-DebugOutputStream <String>] [-TodaysHostname <String>] [-WhoAmI <String>] [-LogBuffer <Hashtable>] [<CommonParameters>]
```
