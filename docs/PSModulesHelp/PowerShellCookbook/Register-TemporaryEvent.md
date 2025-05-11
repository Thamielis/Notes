Register-TemporaryEvent
-----------------------

### Synopsis
Registers an event action for an object, and automatically unregisters
itself afterward. In PowerShell version three, use the -MaxTriggerCount
parameter of the Register-*Event cmdlets.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$timer = New-Object Timers.Timer
PS > Register-TemporaryEvent $timer Disposed { [Console]::Beep(100,100) }
PS > $timer.Dispose()
PS > Get-EventSubscriber
PS > Get-Job
```

---

### Parameters
#### **Object**
The object that generates the event

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Event**
The event to subscribe to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **Action**
The action to invoke when the event arrives

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |3       |false        |

---

### Syntax
```PowerShell
Register-TemporaryEvent [[-Object] <Object>] [[-Event] <Object>] [[-Action] <ScriptBlock>] [<CommonParameters>]
```
