New-LevelSwitch
---------------

### Synopsis
Creates instance of LoggingLevelSwitch at the initial minimum level

---

### Description

Creates instance of LoggingLevelSwitch that dynamically controls logging level

---

### Examples
> EXAMPLE 1

```PowerShell
$levelSwitch = New-LevelSwitch
```
> EXAMPLE 2

```PowerShell
$levelSwitch = New-LevelSwitch -MinimumLevel Verbose
```

---

### Parameters
#### **MinimumLevel**
Sets current minimum level, below which no events should be generated
Valid Values:

* Verbose
* Debug
* Information
* Warning
* Error
* Fatal

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LogEventLevel]`|false   |1       |false        |

#### **ToPreference**
Set to propagate desired minimum level to preference variables.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
None. You cannot pipe objects to New-LevelSwitch

---

### Outputs
* Instance of LoggingLevelSwitch with altered minumum logging level

---

### Syntax
```PowerShell
New-LevelSwitch [[-MinimumLevel] {Verbose | Debug | Information | Warning | Error | Fatal}] [-ToPreference] [<CommonParameters>]
```
