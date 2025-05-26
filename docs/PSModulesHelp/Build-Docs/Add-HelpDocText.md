Add-HelpDocText
---------------

### Synopsis
Return a markdown formatted text.

---

### Description

Return the given string optionally formatted as a Header.

---

### Related Links
* [New-HelpDoc](New-HelpDoc)

* [Get-HelpModuleData](Get-HelpModuleData)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-HelpModuleData build-docs | New-HelpDoc | Add-HelpDocText -Text "My Module Help" -H1 | Out-HelpDoc
# My Module Help
Add a level 1 header with the text "My Module Help".
```

---

### Parameters
#### **HelpDoc**
A HelpDoc object.

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[PSObject]`|true    |2       |true (ByValue)|

#### **Text**
A string to add to the HelpDoc.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **H1**
Format the text as an H1 header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **H2**
Format the text as an H2 header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **H3**
Format the text as an H3 header.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
If no Header switch is provided, the default is no formatting.

---

### Syntax
```PowerShell
Add-HelpDocText [-HelpDoc] <PSObject> [-Text] <String> [<CommonParameters>]
```
```PowerShell
Add-HelpDocText [-HelpDoc] <PSObject> [-Text] <String> [-H3] [<CommonParameters>]
```
```PowerShell
Add-HelpDocText [-HelpDoc] <PSObject> [-Text] <String> [-H2] [<CommonParameters>]
```
```PowerShell
Add-HelpDocText [-HelpDoc] <PSObject> [-Text] <String> [-H1] [<CommonParameters>]
```
