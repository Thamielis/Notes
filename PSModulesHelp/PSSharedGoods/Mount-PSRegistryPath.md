Mount-PSRegistryPath
--------------------

### Synopsis
Mounts a registry path to a specified location.

---

### Description

This function mounts a registry path to a specified location using the reg.exe utility.

---

### Examples
> EXAMPLE 1

```PowerShell
Mount-PSRegistryPath -MountPoint 'HKEY_USERS\.DEFAULT_USER111' -FilePath 'C:\Users\Default\NTUSER.DAT'
Mounts the registry hive located at 'C:\Users\Default\NTUSER.DAT' to the registry key 'HKEY_USERS\.DEFAULT_USER111'.
```

---

### Parameters
#### **MountPoint**
Specifies the registry mount point where the registry path will be mounted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **FilePath**
Specifies the file path of the registry hive to be mounted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

---

### Notes
This function requires administrative privileges to mount registry paths.

---

### Syntax
```PowerShell
Mount-PSRegistryPath [-MountPoint] <String> [-FilePath] <String> [<CommonParameters>]
```
