Rename-PSMDParameter
--------------------

### Synopsis
Renames a parameter of a function.

---

### Description

This command is designed to rename the parameter of a function within an entire module.
By default it will add an alias for the previous command name.

In order for this to work you need to consider to have the command / module imported.
Hint: Import the psm1 file for best results.

It will then search all files in the specified path (hint: Specify module root for best results), and update all psm1/ps1 files.
At the same time it will force all commands to call the parameter by its new standard, even if they previously used an alias for the parameter.

While this command was designed to work with a module, it is not restricted to that:
You can load a standalone function and specify a path with loose script files for the same effect.

Note:
You can also use this to update your scripts, after a foreign module introduced a breaking change by renaming a parameter.
In this case, import the foreign module to see the function, but point it at the base path of your scripts to update.
The loaded function is only used for alias/parameter alias resolution

---

### Examples
> EXAMPLE 1

```PowerShell
Rename-PSMDParameter -Path 'C:\Scripts\Modules\MyModule' -Command 'Get-Test' -Name 'Foo' -NewName 'Bar'
Renames the parameter 'Foo' of the command 'Get-Test' to 'Bar' for all scripts stored in 'C:\Scripts\Modules\MyModule'
```

---

### Parameters
#### **Path**
The path to the root folder where all the files are stored.
It will search the folder recursively and ignore hidden files & folders.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Command**
The name of the function, whose parameter should be changed.
Most be loaded into the current runtime.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |2       |false        |

#### **Name**
The name of the parameter to change.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **NewName**
The new name for the parameter.
Do not specify "-" or the "$" symbol

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

#### **NoAlias**
Avoid creating an alias for the old parameter name.
This may cause a breaking change!

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableCache**
By default, this command caches the results of its execution in the PSFramework result cache.
This information can then be retrieved for the last command to do so by running Get-PSFResultCache.
Setting this switch disables the caching of data in the cache.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Rename-PSMDParameter [-Path] <String> [-Command] <String[]> [-Name] <String> [-NewName] <String> [-NoAlias] [-WhatIf] [-EnableException] [-DisableCache] [<CommonParameters>]
```
