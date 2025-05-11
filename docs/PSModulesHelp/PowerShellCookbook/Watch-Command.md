Watch-Command
-------------

### Synopsis
Watches the result of a command invocation, alerting you when the output
either matches a specified string, lacks a specified string, or has simply
changed.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Watch-Command { Get-Process -Name Notepad | Measure } -UntilChanged
Monitors Notepad processes until you start or stop one.
```
> EXAMPLE 2

```PowerShell
Watch-Command { Get-Process -Name Notepad | Measure } -Until "Count    : 1"
Monitors Notepad processes until there is exactly one open.
```
> EXAMPLE 3

Watch-Command {
     Get-Process -Name Notepad | Measure } -While 'Count    : \d\s*\n'
Monitors Notepad processes while there are between 0 and 9 open
(once number after the colon).

---

### Parameters
#### **ScriptBlock**
The script block to invoke while monitoring

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |1       |false        |

#### **DelaySeconds**
The delay, in seconds, between monitoring attempts

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Double]`|false   |named   |false        |

#### **Quiet**
Specifies that the alert sound should not be played

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UntilChanged**
Monitoring continues only while the output of the
command remains the same.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Until**
The regular expression to search for. Monitoring continues
until this expression is found.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **While**
The regular expression to search for. Monitoring continues
until this expression is not found.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
Watch-Command [-ScriptBlock] <ScriptBlock> [-DelaySeconds <Double>] [-Quiet] [<CommonParameters>]
```
```PowerShell
Watch-Command [-ScriptBlock] <ScriptBlock> [-DelaySeconds <Double>] [-Quiet] [-UntilChanged] [<CommonParameters>]
```
```PowerShell
Watch-Command [-ScriptBlock] <ScriptBlock> [-DelaySeconds <Double>] [-Quiet] [-Until <String>] [<CommonParameters>]
```
```PowerShell
Watch-Command [-ScriptBlock] <ScriptBlock> [-DelaySeconds <Double>] [-Quiet] [-While <String>] [<CommonParameters>]
```
