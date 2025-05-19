Find-PSMDFileContent
--------------------

### Synopsis
Used to quickly search in module files.

---

### Description

This function can be used to quickly search files in your module's path.
By using Set-PSMDModulePath (or Set-PSFConfig 'PSModuleDevelopment.Module.Path' '<path>') you can set the default path to search in.
Using
  Register-PSFConfig -FullName 'PSModuleDevelopment.Module.Path'
allows you to persist this setting across sessions.

---

### Examples
> EXAMPLE 1

```PowerShell
Find-PSMDFileContent -Pattern 'Get-Test'
Searches all module files for the string 'Get-Test'.
```

---

### Parameters
#### **Pattern**
The text to search for, can be any regex pattern

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Extension**
The extension of files to consider.
Only files with this extension will be searched.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Path**
The path to use as search base.
Defaults to the path found in the setting 'PSModuleDevelopment.Module.Path'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Find-PSMDFileContent [-Pattern] <String> [-Extension <String>] [-Path <String>] [-EnableException] [<CommonParameters>]
```
