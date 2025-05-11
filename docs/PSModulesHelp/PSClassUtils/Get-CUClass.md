Get-CUClass
-----------

### Synopsis
This function returns all classes, loaded in memory or present in a ps1 or psm1 file.

---

### Description

By default, the function will return all loaded classes in the current PSSession.
You can specify a file path to explore the classes present in a ps1 or psm1 file.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-CUClass
Return all classes alreay loaded in current PSSession.
```
> EXAMPLE 2

```PowerShell
Get-CUClass -ClassName CUClass
Return the particuluar CUCLass.
```
> EXAMPLE 3

```PowerShell
Get-CUClass -Path .\test.psm1,.\test2.psm1
Return all classes present in the test.psm1 and test2.psm1 file.
```
> EXAMPLE 4

```PowerShell
Get-CUClass -Path .\test.psm1 -ClassName test
Return test class present in the test.psm1 file.
```
> EXAMPLE 5

```PowerShell
Get-ChildItem -recurse | Get-CUClass
Return all classes, recursively, present in the C:\PSClassUtils Folder.
```

---

### Parameters
#### **ClassName**
Specify the name of the class.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Path**
The path of a file containing PowerShell Classes. Accept values from the pipeline.

|Type          |Required|Position|PipelineInput                 |Aliases |
|--------------|--------|--------|------------------------------|--------|
|`[FileInfo[]]`|false   |2       |true (ByValue, ByPropertyName)|FullName|

#### **Raw**
The raw switch will display the raw content of the Class.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
Accepts type [System.IO.FileInfo]

---

### Outputs
* Return type [CuClass]

---

### Notes
Author: StÃ©phane van Gulick
Participate & contribute --> https://github.com/Stephanevg/PSClassUtils

---

### Syntax
```PowerShell
Get-CUClass [-ClassName <Object>] [[-Path] <FileInfo[]>] [-Raw] [<CommonParameters>]
```
