New-HTMLCodeBlock
-----------------

### Synopsis
Creates a new HTML code block with customizable settings for syntax highlighting.

---

### Description

This function creates a new HTML code block with customizable settings for syntax highlighting. It allows you to specify the code language, theme, group, title, line numbers visibility, highlighted lines, and line numbering offset.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLCodeBlock -Code "function greet() { return 'Hello, World!'; }" -Style 'javascript' -Theme 'monokai' -Group 'Functions' -Title 'Greeting Function' -Highlight 2,4-6 -ShowLineNumbers $true -LineOffset 1
Creates a new HTML code block displaying a JavaScript function with a custom theme, belonging to the 'Functions' group, titled 'Greeting Function', highlighting lines 2, 4 to 6, showing line numbers, and starting line numbering from 1.
```
> EXAMPLE 2

```PowerShell
New-HTMLCodeBlock -Code "for ($i = 0; $i -lt 5; $i++) { Write-Host $i }" -Style 'powershell' -Group 'Loops' -Title 'For Loop Example' -ShowLineNumbers $false
Creates a new HTML code block displaying a PowerShell for loop without line numbers, belonging to the 'Loops' group, titled 'For Loop Example'.
```

---

### Parameters
#### **Code**
Specifies the code content to be displayed in the code block.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Style**
Specifies the language style for syntax highlighting. Default is 'powershell'.
Valid Values:

* assembly
* asm
* avrassembly
* avrasm
* c
* cpp
* c++
* csharp
* css
* cython
* cordpro
* diff
* docker
* dockerfile
* generic
* standard
* groovy
* go
* golang
* html
* ini
* conf
* java
* js
* javascript
* jquery
* mootools
* ext.js
* json
* kotlin
* less
* lua
* gfm
* md
* markdown
* octave
* matlab
* nsis
* php
* powershell
* prolog
* py
* python
* raw
* ruby
* rust
* scss
* sass
* shell
* bash
* sql
* squirrel
* swift
* typescript
* vhdl
* visualbasic
* vb
* xml
* yaml

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Theme**
Specifies the theme for the code block. Available themes include 'enlighter', 'beyond', 'classic', and more.
Valid Values:

* enlighter
* beyond
* classic
* godzilla
* atomic
* droide
* minimal
* eclipse
* mowtwo
* rowhammer
* bootstrap4
* dracula
* monokai

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Group**
Specifies the group to which the code block belongs.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Title**
Specifies the title of the code block.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Highlight**
Specifies specific lines to highlight in the code block.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **ShowLineNumbers**
Indicates whether line numbers should be displayed in the code block.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |7       |false        |

#### **LineOffset**
Specifies the starting line number offset for line numbering.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

---

### Syntax
```PowerShell
New-HTMLCodeBlock [-Code] <String> [[-Style] <String>] [[-Theme] <String>] [[-Group] <String>] [[-Title] <String>] [[-Highlight] <String[]>] [[-ShowLineNumbers] <Nullable`1>] [[-LineOffset] <String>] [<CommonParameters>]
```
