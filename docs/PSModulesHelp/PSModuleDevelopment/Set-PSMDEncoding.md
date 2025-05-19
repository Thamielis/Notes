Set-PSMDEncoding
----------------

### Synopsis
Sets the encoding for the input file.

---

### Description

This command reads the input file using the default encoding interpreter.
It then writes the contents as the specified enconded string back to itself.

There is no inherent encoding conversion enacted, so special characters may break.
This is a tool designed to reformat code files, where special characters shouldn't be used anyway.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem -Recurse | Set-PSMDEncoding
Converts all files in the current folder and subfolders to UTF8
```

---

### Parameters
#### **Path**
Path to the files to be set.
Silently ignores folders.

|Type        |Required|Position|PipelineInput                 |Aliases |
|------------|--------|--------|------------------------------|--------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|FullName|

#### **Encoding**
The encoding to set to (Defaults to "UTF8 with BOM")

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[EncodingParameter]`|false   |2       |false        |

#### **EnableException**
Replaces user friendly yellow warnings with bloody red exceptions of doom!
Use this if you want the function to throw terminating errors you want to catch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Set-PSMDEncoding [-Path] <String[]> [[-Encoding] <EncodingParameter>] [-EnableException] [-WhatIf] [-Confirm] [<CommonParameters>]
```
