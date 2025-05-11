Write-CUClassDiagram
--------------------

### Synopsis
This script allows to document automatically existing script(s)/module(s) containing classes by generating the corresponding UML Diagram.

---

### Description

Automatically generate a UML diagram of scripts/Modules that contain powershell classes.

---

### Related Links
* [https://github.com/Stephanevg/PsClassUtils](https://github.com/Stephanevg/PsClassUtils)

---

### Examples
Generate a UML diagram of the classes located in MyClass.Ps1
The diagram will be automatically created in the same folder as the file that contains the classes (C:\Classes).

```PowerShell
Write-CUClassDiagram.ps1 -File C:\Classes\MyClass.ps1
```
Various output formats are available using the parameter "OutPutFormat"

Write-CUClassDiagram.ps1 -File C:\Classes\Logging.psm1 -ExportFolder C:\admin\ -OutputFormat gif
Directory: C:\admin
Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----       12.06.2018     07:47          58293 Logging.gif
> EXAMPLE 3

```PowerShell
Write-CUClassDiagram -Path "C:\Modules\PSClassUtils\Classes\Private\" -Show
Will generate a diagram of all the private classes available in the Path specified, and immediatley show the diagram.
```

---

### Parameters
#### **Path**
The path that contains the classes that need to be documented. 
The path parameter should point to either a .ps1, .psm1 file, or a directory containing either/both of those file types.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[String]`|true    |1       |false        |FullName|

#### **OutPutType**
OutPutType is a Set of 2 variables: Combined, Unique
Combined, all files present in a directory are drawn in the same graph.
Unique, all files present in a directory are drawn in their own graph.
Valid Values:

* Unique
* Combined

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **OutputFormat**
Using the parameter OutputFormat, it is possible change the default output format (.png) to one of the following ones:
'jpg', 'png', 'gif', 'imap', 'cmapx', 'jp2', 'json', 'pdf', 'plain', 'dot'
Valid Values:

* jpg
* png
* gif
* imap
* cmapx
* jp2
* json
* pdf
* plain
* dot

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **ExportFolder**
This optional parameter, allows to specifiy an alternative export folder. By default, the diagram is created in the same folder as the source file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **IgnoreCase**
By default, Class names MUST be case identical to have the Write-CUClassDiagram cmdlet generate the correct inheritence tree.
When the switch -IgnoreCase is specified, All class names will be converted to 'Titlecase' to force the case, and ensure the inheritence is correctly drawed in the Class Diagram.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowComposition**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Show**
Open's the generated diagram immediatly

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PassThru**
When specified, the raw Graph in GraphViz format will be returned back in String format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Exclude**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

---

### Notes
Author: Stephanevg / LxLeChat
www: https://github.com/Stephanevg  https://github.com/LxLeChat
Report bugs or ask for feature requests here:
https://github.com/Stephanevg/PsClassUtils

---

### Syntax
```PowerShell
Write-CUClassDiagram [-Path] <String> [[-OutPutType] <Object>] [[-OutputFormat] <String>] [[-ExportFolder] <String>] [-IgnoreCase] [-ShowComposition] [-Show] [-PassThru] [[-Exclude] <String[]>] [<CommonParameters>]
```
