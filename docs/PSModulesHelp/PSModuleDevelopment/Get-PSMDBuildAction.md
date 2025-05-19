Get-PSMDBuildAction
-------------------

### Synopsis
Get a list of registered build actions.

---

### Description

Get a list of registered build actions.
Actions are the scriptblocks that are used to execute the build logic when running Invoke-PSMDBuildProject.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDBuildAction
Get a list of all registered build actions.
```

---

### Parameters
#### **Name**
The name by which to filter the actions returned.
Defaults to '*'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-PSMDBuildAction [[-Name] <String>] [<CommonParameters>]
```
