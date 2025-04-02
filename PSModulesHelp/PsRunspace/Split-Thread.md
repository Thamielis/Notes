Split-Thread
------------

### Synopsis
Split a command for a collection of input objects into multiple threads for asynchronous processing

---

### Description

The specified command will be run for each input object in a separate powershell instance with its own runspace
These runspaces are part of the same runspace pool inside the same powershell.exe process

---

### Examples
> EXAMPLE 1

```PowerShell
The following demonstrates sending a Cmdlet name to the -Command parameter
    $InputObject | Split-Thread -Command 'Write-Output'
```
> EXAMPLE 2

```PowerShell
The following demonstrates sending a scriptblock to the -Command parameter
    $InputObject | Split-Thread -Command [scriptblock]::create("Write-Output `$args[0]")
```
> EXAMPLE 3

```PowerShell
The following demonstrates sending a script file path to the -Command parameter
    $InputObject | Split-Thread -Command "C:\Test-Command.ps1"
```
> EXAMPLE 4

```PowerShell
The following demonstrates sending a function to the -Command parameter
    $InputObject | Split-Thread -Command 'Test-Function'
```
> EXAMPLE 5

```PowerShell
The following demonstrates the -AddParam parameter
$InputObject | Split-Thread -Command "Get-Service" -InputParameter ComputerName -AddParam @{"Name" = "BITS"}
```
> EXAMPLE 6

```PowerShell
The following demonstrates the -AddSwitch parameter
$InputObject | Split-Thread -Command "Get-Service" -AddSwitch @('RequiredServices','DependentServices')
```
> EXAMPLE 7

```PowerShell
The following demonstrates the use of a threadsafe hashtable to store results
The hastable can be accessed and updated from inside each runspace
$ThreadsafeHashtable = [hashtable]::Synchronized(@{})
$InputObject | Split-Thread -Command "Fake-Function" -InputParameter ComputerName -AddParam @{"ResultHashTableParameter" = $ThreadsafeHashtable}
```

---

### Parameters
#### **Command**
PowerShell Command or Script to run against each InputObject

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **InputObject**
Objects to pass to the Command as an argument or parameter

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|false   |2       |true (ByValue, ByPropertyName)|

#### **InputParameter**
Named parameter of the Command to pass InputObject to
If this is not specified, InputObject will be passed to the Command as an argument

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Threads**
Maximum number of concurrent threads to allow

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **SleepTimer**
Milliseconds to wait between cycles of the loop that checks threads for completion

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **Timeout**
Seconds to wait without receiving any new results before giving up and stopping all remaining threads

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |

#### **AddParam**
Parameters to add to the Command
Each parameter is a name-value pair in the hashtable:
    @{"ParameterName" = "Value"}
    @{"ParameterName" = "Value" ; "ParameterTwo" = "Value2"}

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |7       |false        |

#### **AddSwitch**
Switches to add to the Command

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |false        |

#### **AddModule**
Names of modules to import in each runspace

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |9       |false        |

#### **ObjectStringProperty**
Name of a property (whose value is a string) that exists on each $InputObject and can be used to represent the object in text form
If left null, the object's ToString() method will be used instead.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **DebugOutputStream**
Will be sent to the Type parameter of Write-LogMsg in the PsLogMessage module

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **TodaysHostname**
Hostname to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **WhoAmI**
Username to record in log messages (can be passed to Write-LogMsg as a parameter to avoid calling an external process)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **LogBuffer**
Log messages which have not yet been written to disk

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSReference]`|true    |14      |false        |

#### **ProgressParentId**
ID of the parent progress bar under which to show progres

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |15      |false        |

---

### Syntax
```PowerShell
Split-Thread [-Command] <Object> [[-InputObject] <Object>] [[-InputParameter] <Object>] [[-Threads] <Int32>] [[-SleepTimer] <Int32>] [[-Timeout] <Int32>] [[-AddParam] <Hashtable>] [[-AddSwitch] <String[]>] [[-AddModule] <String[]>] [[-ObjectStringProperty] <String>] [[-DebugOutputStream] <String>] [[-TodaysHostname] <String>] [[-WhoAmI] <String>] [-LogBuffer] <PSReference> [[-ProgressParentId] <Int32>] [<CommonParameters>]
```
