Remove-FileItem
---------------

### Synopsis
Removes one or more files and/or folders using one of three methods:
Remove-Item, .NET Delete(), or move to Recycle Bin.

---

### Description

- If the path is a file, removes it in one shot.
- If the path is a folder and -SkipFolder is NOT used, removes that folder
  in one shot (recursively if -Recursive is specified).
- If -SkipFolder is used (and the path is a folder), calls Remove-ChildItems
  to remove only the folder's contents, leaving the folder itself.

Supports:
 - RemoveItem, DotNetDelete, RecycleBin
 - Retries
 - WhatIf/Confirm
 - Passthru (detailed objects)
 - SimpleReturn (boolean overall result)

---

### Examples
> EXAMPLE 1

Remove-FileItem -Paths "C:\SomeFolder" -DeleteMethod RemoveItem -Recursive -WhatIf
Shows which items would be removed, but doesn't actually remove them,
because -WhatIf is in effect.
> EXAMPLE 2

```PowerShell
Remove-FileItem -Paths "C:\SomeFolder", "C:\SomeFile.txt" -Passthru -DeleteMethod DotNetDelete
Removes both the folder (and everything in it) and the file, then returns details on each removal attempt.
```

---

### Parameters
#### **Paths**
One or more paths to files/folders.

|Type        |Required|Position|PipelineInput |Aliases             |
|------------|--------|--------|--------------|--------------------|
|`[String[]]`|true    |1       |true (ByValue)|LiteralPath<br/>Path|

#### **DeleteMethod**
"RemoveItem", "DotNetDelete", or "RecycleBin". Defaults to "RemoveItem".
Valid Values:

* RemoveItem
* DotNetDelete
* RecycleBin

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Recursive**
If set, allows recursive removal for folder contents.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipTopFolder**
If set for a folder, removes the contents only, not the folder itself.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |SkipFolder|

#### **Retries**
Specifies how many times to attempt removal before giving up. Defaults to 1.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Include**
Patterns (e.g., *.log) to include if removing child items individually.
Will work only if SkipTopFolder is used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Exclude**
Patterns (e.g., *.log) to exclude if removing child items individually.
Will work only if SkipTopFolder is used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Filter**
Filter for Get-ChildItem when removing child items individually.
Will work only if SkipTopFolder is used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Passthru**
Outputs an object for each path with details on success or failure.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SimpleReturn**
Outputs a single boolean indicating overall success or failure.

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
Remove-FileItem [-Paths] <String[]> [-DeleteMethod <String>] [-Recursive] [-SkipTopFolder] [-Retries <Int32>] [-Include <String[]>] [-Filter <String>] [-Passthru] [-SimpleReturn] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
Remove-FileItem [-Paths] <String[]> [-DeleteMethod <String>] [-Recursive] [-SkipTopFolder] [-Retries <Int32>] [-Exclude <String[]>] [-Filter <String>] [-Passthru] [-SimpleReturn] [-WhatIf] [-Confirm] [<CommonParameters>]
```
