Get-RemoteRegistryKeyProperty
-----------------------------

### Synopsis
Get the value of a remote registry key property

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$registryPath =
     "HKLM:\software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell"
PS > Get-RemoteRegistryKeyProperty LEE-DESK $registryPath ExecutionPolicy
```

---

### Parameters
#### **ComputerName**
The computer that you wish to connect to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Path**
The path to the registry item to retrieve

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **Property**
The specific property to retrieve

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Get-RemoteRegistryKeyProperty [-ComputerName] <Object> [-Path] <Object> [[-Property] <Object>] [<CommonParameters>]
```
