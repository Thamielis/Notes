Set-PSMDModulePath
------------------

### Synopsis
Sets the path of the module currently being developed.

---

### Description

Sets the path of the module currently being developed.
This is used by several utility commands in order to not require any path input.

This is a wrapper around the psframework configuration system, the same action can be taken by running this command:
Set-PSFConfig -Module PSModuleDevelopment -Name "Module.Path" -Value $Path

---

### Examples
> EXAMPLE 1

```PowerShell
Set-PSMDModulePath -Path "C:\github\dbatools"
Sets the current module path to "C:\github\dbatools"
```
> EXAMPLE 2

```PowerShell
Set-PSMDModulePath -Path "C:\github\dbatools" -Register
Sets the current module path to "C:\github\dbatools"
Then stores the setting in registry, causing it to be persisted acros multiple sessions.
```

---

### Parameters
#### **Module**
The module, the path of which to register.

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSModuleInfo]`|true    |named   |true (ByValue)|

#### **Path**
The path to set as currently developed module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Register**
Register the specified path, to have it persist across sessions

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Set-PSMDModulePath -Module <PSModuleInfo> [-Register] [-EnableException] [<CommonParameters>]
```
```PowerShell
Set-PSMDModulePath -Path <String> [-Register] [-EnableException] [<CommonParameters>]
```
