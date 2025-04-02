Set-FileOwner
-------------

### Synopsis
Sets the owner of a file or folder.

---

### Description

This function sets the owner of a specified file or folder to the provided owner.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-FileOwner -Path "C:\Example\File.txt" -Owner "DOMAIN\User1"
Description:
Sets the owner of the file "File.txt" to "DOMAIN\User1".
```
> EXAMPLE 2

```PowerShell
Set-FileOwner -Path "C:\Example\Folder" -Owner "DOMAIN\User2" -Recursive
Description:
Sets the owner of the folder "Folder" and all its contents to "DOMAIN\User2" recursively.
```

---

### Parameters
#### **Path**
Specifies the path to the file or folder.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |1       |false        |

#### **Recursive**
Indicates whether to process the items in the specified path recursively.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Owner**
Specifies the new owner for the file or folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Exlude**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **JustPath**
Indicates whether to only change the owner of the specified path without recursing into subfolders.

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
Set-FileOwner [[-Path] <Array>] [-Recursive] [[-Owner] <String>] [[-Exlude] <String[]>] [-JustPath] [-WhatIf] [-Confirm] [<CommonParameters>]
```
