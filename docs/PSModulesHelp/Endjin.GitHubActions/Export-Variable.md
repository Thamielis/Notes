Export-Variable
---------------

### Synopsis
Creates or updates an environment variable for any actions running next in a job. 
The action that creates or updates the environment variable does not have access to the new value, but all subsequent actions in a job will have access. 
Environment variables are case-sensitive and you can include punctuation.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Export-Variable -Name foo Value bar
```

---

### Parameters
#### **Name**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Value**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Syntax
```PowerShell
Export-Variable [-Name] <String> [-Value] <String> [<CommonParameters>]
```
