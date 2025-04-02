Dismount-PSRegistryPath
-----------------------

### Synopsis
Dismounts a registry path.

---

### Description

This function dismounts a registry path specified by the MountPoint parameter. It unloads the registry path using reg.exe command.

---

### Examples
> EXAMPLE 1

```PowerShell
Dismount-PSRegistryPath -MountPoint "HKLM:\Software\MyApp" -Suppress
Dismounts the registry path "HKLM:\Software\MyApp" without displaying any output.
```
> EXAMPLE 2

```PowerShell
Dismount-PSRegistryPath -MountPoint "HKCU:\Software\Settings"
Dismounts the registry path "HKCU:\Software\Settings" and displays output if successful.
```

---

### Parameters
#### **MountPoint**
Specifies the registry path to be dismounted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Suppress**
Suppresses the output if set to $true.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Dismount-PSRegistryPath [-MountPoint] <String> [-Suppress] [<CommonParameters>]
```
