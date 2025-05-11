Set-FileInheritance
-------------------

### Synopsis
Sets or removes inheritance for a specified directory.

---

### Description

This function allows you to set or remove inheritance for a specified directory. You can choose to disable inheritance and optionally keep the inherited ACL.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-FileInheritance -StartingDir "C:\Example" -DisableInheritance
Disables inheritance for the directory "C:\Example".
```
> EXAMPLE 2

```PowerShell
Set-FileInheritance -StartingDir "D:\Data" -DisableInheritance -KeepInheritedAcl
Disables inheritance for the directory "D:\Data" and keeps the inherited ACL.
```

---

### Parameters
#### **StartingDir**
Specifies the directory for which to set or remove inheritance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **DisableInheritance**
Switch parameter to disable inheritance for the specified directory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **KeepInheritedAcl**
Switch parameter to keep the inherited ACL when disabling inheritance.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Set-FileInheritance [[-StartingDir] <String>] [-DisableInheritance] [-KeepInheritedAcl] [<CommonParameters>]
```
