Invoke-FilesToPrompt
--------------------

### Synopsis
Concatenate a directory full of files into a single prompt for use with LLMs

---

### Description

Takes one or more paths to files or directories and outputs every file, recursively, each one preceded with its filename like this:

path/to/file.ps1
----
Contents of file.ps1 goes here

---
path/to/file2.ps1
---
...

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-FilesToPrompt -Path "C:\MyFiles"
This example invokes the Invoke-FilesToPrompt function to process files in the "C:\MyFiles" directory.
```
> EXAMPLE 2

```PowerShell
Invoke-FilesToPrompt -Path "C:\MyFiles\*.md"
This example invokes the Invoke-FilesToPrompt function to process all Markdown files in the "C:\MyFiles" directory.
```
> EXAMPLE 3

```PowerShell
Invoke-FilesToPrompt -Path "C:\MyFiles\*.md", "C:\MyOtherFiles\*.md"
This example invokes the Invoke-FilesToPrompt function to process all Markdown files in the "C:\MyFiles" directory.
```
> EXAMPLE 4

```PowerShell
(Invoke-FilesToPrompt (dir . -r *.md))
This example recursively processes all Markdown files in the current directory.
```

---

### Parameters
#### **Path**
Specifies the path of the files to be processed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Invoke-FilesToPrompt [[-Path] <Object>] [<CommonParameters>]
```
