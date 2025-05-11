Grant-RegistryAccessFullControl
-------------------------------

### Synopsis
Grants full control access to a user for the specified registry key.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$registryPath = "HKLM:\Software\MyProgram"
PS > Grant-RegistryAccessFullControl "LEE-DESK\LEE" $registryPath
```

---

### Parameters
#### **User**
The user to grant full control

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **RegistryPath**
The registry path that should have its permissions modified

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Grant-RegistryAccessFullControl [-User] <Object> [-RegistryPath] <Object> [<CommonParameters>]
```
