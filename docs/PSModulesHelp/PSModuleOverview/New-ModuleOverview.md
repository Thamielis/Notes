New-ModuleOverview
------------------

### Synopsis
Generates a Markdown file with a short description of each public command in a module.

---

### Description

Finds all the public commands in a specified module and produces a simple Markdown file detailing the description or synopsis (user choice) for each.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ModuleOverview -ModuleName TLS -Path .\readme.md
This will generate an overview of the TLS module and output it to readme.md in the current directory.
```
> EXAMPLE 2

```PowerShell
New-ModuleOverview -ModuleName DISM -Path .\readme.md -Append
This will generate an overview of the DISM module and output it to an existing readme.md in the current directory.
```
> EXAMPLE 3

```PowerShell
New-ModuleOverview -ModuleName PSScheduledJob -Path .\readme.md -HelpContent Description
This will generate an overview of the PSScheduledJob module using the description from each help comment and output it to readme.md in the current directory.
```

---

### Parameters
#### **ModuleName**
Name of the module to generate an overview for. If the module isn't already loaded then it will be loaded.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |1       |false        |Name   |

#### **Path**
Output path for the Markdown file. Must end in .md.

|Type        |Required|Position|PipelineInput|Aliases              |
|------------|--------|--------|-------------|---------------------|
|`[FileInfo]`|false   |2       |false        |Fullname<br/>FilePath|

#### **HelpContent**
Which piece of help content should be used in the generated content, either Synopsis or Description. Defaults to Synopsis
Valid Values:

* Description
* Synopsis

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Append**
Append to the end of an existing Markdown file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-ModuleOverview [[-ModuleName] <String>] [[-Path] <FileInfo>] [[-HelpContent] <String>] [-Append] [<CommonParameters>]
```
