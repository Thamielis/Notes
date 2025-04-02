Get-GitHubContext
-----------------

### Synopsis
Get the current GitHub context.

---

### Description

Get the current GitHub context.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubContext
Gets the current GitHub context.
```

---

### Parameters
#### **Context**
The name of the context.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |named   |false        |Name   |

#### **ListAvailable**
List all available contexts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Outputs
* GitHubContext

---

### Syntax
```PowerShell
Get-GitHubContext [<CommonParameters>]
```
```PowerShell
Get-GitHubContext -Context <String> [<CommonParameters>]
```
```PowerShell
Get-GitHubContext -ListAvailable [<CommonParameters>]
```
