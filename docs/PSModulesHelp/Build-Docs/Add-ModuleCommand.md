Add-ModuleCommand
-----------------

### Synopsis
Generate a Markdown list of the commands in the module and their summary.

---

### Description

Generate a Markdown list of the commands in the module and optionally format as links.

---

### Related Links
* [New-HelpDock](New-HelpDock)

---

### Examples
> EXAMPLE 1

Get-HelpModuleData build-docs | New-HelpDoc | Add-ModuleCommand -AsLinks | select -exp Text
- [Add-HelpDocText](Add-HelpDocText.md) _Return a markdown formatted text._
- [Add-ModuleCommand](Add-ModuleCommand.md) _Generate a Markdown list of the commands in the module._
- [Add-ModuleProperty](Add-ModuleProperty.md) _Return a markdown formatted value for the given property._
…
Generate a list of commands with links to the commands' help documents.

---

### Parameters
#### **HelpDoc**
A HelpDoc object.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |1       |true (ByValue)|

#### **AsLinks**
Format each list item as a link to a `{commandname}.md`.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Add-ModuleCommand [-HelpDoc] <PSObject> [-AsLinks] [<CommonParameters>]
```
