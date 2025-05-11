Write-ScriptHTML
----------------

### Synopsis
Writes Windows PowerShell as colorized HTML

---

### Description

Outputs a Windows PowerShell script as colorized HTML.
The script is wrapped in HTML PRE  tags with SPAN tags defining color regions.

---

### Related Links
* [ConvertFrom-Markdown](ConvertFrom-Markdown)

---

### Examples
> EXAMPLE 1

```PowerShell
Write-ScriptHTML {Get-Process}
```

---

### Parameters
#### **Text**
The Text to colorize

|Type           |Required|Position|PipelineInput |Aliases       |
|---------------|--------|--------|--------------|--------------|
|`[ScriptBlock]`|true    |1       |true (ByValue)|ScriptContents|

#### **Script**
The script as a string.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Start**
The start within the string to colorize

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **End**
the end within the string to colorize

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Palette**
The palette of colors to use.  
By default, the colors will be the current palette for the
Windows PowerShell Integrated Scripting Environment

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **NoNewline**
If set, will include the script within a span instead of a pre tag

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HelpAsMarkdown**
If set, will treat help within the script as markdown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoBackground**
If set, will not put a white background and padding around the script

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Write-ScriptHTML [-Text] <ScriptBlock> [-Start <Int32>] [-End <Int32>] [-Palette <Object>] [-NoNewline] [-HelpAsMarkdown] [-NoBackground] [<CommonParameters>]
```
```PowerShell
Write-ScriptHTML [-Script] <String> [-Start <Int32>] [-End <Int32>] [-Palette <Object>] [-NoNewline] [-HelpAsMarkdown] [-NoBackground] [<CommonParameters>]
```
