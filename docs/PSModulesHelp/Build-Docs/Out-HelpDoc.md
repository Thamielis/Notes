Out-HelpDoc
-----------

### Synopsis
Output the Markdown formatted HelpDoc.

---

### Description

Output the Markdown formatted HelpDoc and optionally write to the provide file path.

---

### Related Links
* [New-HelpDoc](New-HelpDoc)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-HelpModuleData build-docs | New-HelpDoc | Add-ModuleProperty -Property Name -H1 | Out-HelpDoc
# build-docs
Get the help data for the build-docs module, add an H1 header of the module name, then output the Markdown.
```

---

### Parameters
#### **HelpDoc**
A HelpDoc object with a populated Text property.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |2       |true (ByValue)|

#### **Path**
Write the output to a `.md` file.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |1       |false        |PSPath |

---

### Syntax
```PowerShell
Out-HelpDoc [-HelpDoc] <PSObject> [[-Path] <String>] [<CommonParameters>]
```
