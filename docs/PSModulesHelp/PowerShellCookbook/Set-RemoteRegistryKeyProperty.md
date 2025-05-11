Set-RemoteRegistryKeyProperty
-----------------------------

### Synopsis
Set the value of a remote registry key property

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$registryPath =
    "HKLM:\software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell"
PS >Set-RemoteRegistryKeyProperty LEE-DESK $registryPath `
      "ExecutionPolicy" "RemoteSigned"
```

---

### Parameters
#### **ComputerName**
The computer to connect to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Path**
The registry path to modify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **PropertyName**
The property to modify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |3       |false        |

#### **PropertyValue**
The value to set on the property

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |4       |false        |

---

### Syntax
```PowerShell
Set-RemoteRegistryKeyProperty [-ComputerName] <Object> [-Path] <Object> [-PropertyName] <Object> [-PropertyValue] <Object> [<CommonParameters>]
```
