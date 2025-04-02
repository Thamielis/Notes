New-HTMLCodeBlock
-----------------

### Synopsis

New-HTMLCodeBlock [-Code] <string> [[-Style] <string>] [[-Theme] <string>] [[-Group] <string>] [[-Title] <string>] [[-Highlight] <string[]>] [[-ShowLineNumbers] <bool>] [[-LineOffset] <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Code**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|true    |0       |false        |

#### **Group**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |3       |false        |

#### **Highlight**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[string[]]`|false   |5       |false        |

#### **LineOffset**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |7       |false        |

#### **ShowLineNumbers**

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[bool]`|false   |6       |false        |

#### **Style**

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
|`[string]`|false   |1       |false        |

#### **Theme**

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
|`[string]`|false   |2       |false        |

#### **Title**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |4       |false        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=New-HTMLCodeBlock; CommonParameters=True; parameter=System.Object[]}}
```
