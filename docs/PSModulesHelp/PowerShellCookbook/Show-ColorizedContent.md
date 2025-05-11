Show-ColorizedContent
---------------------

### Synopsis
Displays syntax highlighting, line numbering, and range highlighting for
PowerShell scripts.

---

### Description

---

### Examples
> EXAMPLE 1

Show-ColorizedContent Invoke-MyScript.ps1
001 | function Write-Greeting
002 | {
003 |     param($greeting)
004 |     Write-Host "$greeting World"
005 | }
006 |
007 | Write-Greeting "Hello"
> EXAMPLE 2

Show-ColorizedContent Invoke-MyScript.ps1 -highlightRange (1..3+7)
001 > function Write-Greeting
002 > {
003 >     param($greeting)
004 |     Write-Host "$greeting World"
005 | }
006 |
007 > Write-Greeting "Hello"

---

### Parameters
#### **Path**
The path to colorize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **HighlightRange**
The range of lines to highlight

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **ExcludeLineNumbers**
Switch to exclude line numbers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Show-ColorizedContent [-Path] <Object> [[-HighlightRange] <Object>] [-ExcludeLineNumbers] [<CommonParameters>]
```
