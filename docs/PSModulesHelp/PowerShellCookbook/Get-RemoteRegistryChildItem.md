Get-RemoteRegistryChildItem
---------------------------

### Synopsis
Get the list of subkeys below a given key on a remote computer.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
Get-RemoteRegistryChildItem LEE-DESK HKLM:\Software
```

---

### Parameters
#### **ComputerName**
The computer that you wish to connect to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Path**
The path to the registry items to retrieve

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Get-RemoteRegistryChildItem [-ComputerName] <Object> [-Path] <Object> [<CommonParameters>]
```
