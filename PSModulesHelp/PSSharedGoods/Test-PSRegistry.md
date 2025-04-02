Test-PSRegistry
---------------

### Synopsis
Tests the existence of a specified registry key on a remote or local computer.

---

### Description

This function checks if a specified registry key exists on a remote or local computer.

---

### Examples
> EXAMPLE 1

Test-PSRegistry -RegistryPath 'HKLM:\Software\Microsoft' -Key 'Windows'
Description
-----------
Checks if the 'Windows' key exists under 'HKLM:\Software\Microsoft' on the local computer.
> EXAMPLE 2

Test-PSRegistry -RegistryPath 'HKLM:\Software\Microsoft' -ComputerName 'RemoteComputer' -Key 'Windows'
Description
-----------
Checks if the 'Windows' key exists under 'HKLM:\Software\Microsoft' on the 'RemoteComputer'.

---

### Parameters
#### **RegistryPath**
Specifies the path to the registry key(s) to be checked.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |1       |false        |Path   |

#### **ComputerName**
Specifies the name of the remote computer to check. Defaults to the local computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Key**
Specifies the specific registry key to check for existence.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
Test-PSRegistry [[-RegistryPath] <String[]>] [[-ComputerName] <String>] [[-Key] <String>] [<CommonParameters>]
```
