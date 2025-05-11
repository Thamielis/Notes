Convert-HtmlToMarkdown
----------------------

### Synopsis
Converts HTML to Markdown.

---

### Description

{{ Fill in the Description }}

---

### Examples
> Example 1

PS C:\> '<h1>On Board</h1><ul><li>Ford<li>Zaphod<li>Marvin</ul>' |Convert-HtmlToMarkdown

# On Board

- Ford
- Zaphod
- Marvin

---

### Parameters
#### **DefaultCodeBlockLanguage**
Option to set the default code block language for Github style markdown if class based language markers are not available.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |False        |CodeDefault|

#### **GithubFlavored**
Github style markdown for br, pre and table.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |False        |GFM    |

#### **Html**
HTML to convert.

|Type      |Required|Position|PipelineInput                 |Aliases                  |
|----------|--------|--------|------------------------------|-------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|InputObject<br/>OuterHtml|

#### **ListBulletChar**
Sets the bullet character to use for unordered lists.

|Type    |Required|Position|PipelineInput|Aliases|
|--------|--------|--------|-------------|-------|
|`[Char]`|false   |named   |False        |Bullets|

#### **PassThroughTags**
Pass a list of tags to pass through as-is without any processing.

|Type        |Required|Position|PipelineInput|Aliases                                          |
|------------|--------|--------|-------------|-------------------------------------------------|
|`[String[]]`|false   |named   |False        |PassThroughElements<br/>KeepTags<br/>KeepElements|

#### **RemoveComments**
Remove comment tags with text.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Switch]`|false   |named   |False        |StripComments|

#### **SmartHrefHandling**
Outputs link as auto-linking text (not an explicit link) when the text matches the link.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Switch]`|false   |named   |False        |AutoLink|

#### **TableWithoutHeaderRowHandling**
What to do about tables without a header row. Default: first row will be used as header row. EmptyRow: an empty header row is created.
Valid Values:

* Default
* EmptyRow

|Type                                   |Required|Position|PipelineInput|Aliases           |
|---------------------------------------|--------|--------|-------------|------------------|
|`[TableWithoutHeaderRowHandlingOption]`|false   |named   |False        |TableHeaderDefault|

#### **UnknownTags**
What to do with unknown tags: PassThrough includes it as is, Drop removes it, Bypass ignores it, and Raise throws an exception.
Valid Values:

* PassThrough
* Drop
* Bypass
* Raise

|Type                 |Required|Position|PipelineInput|Aliases        |
|---------------------|--------|--------|-------------|---------------|
|`[UnknownTagsOption]`|false   |named   |False        |UnknownElements|

#### **WhitelistUriSchemes**
Specify which schemes (without trailing colon) are to be allowed for links and images. Empty string allows unknown schemes.

|Type        |Required|Position|PipelineInput|Aliases            |
|------------|--------|--------|-------------|-------------------|
|`[String[]]`|false   |named   |False        |AllowlistUriSchemes|

---

### Inputs
System.String

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes

---

### Syntax
```PowerShell
Convert-HtmlToMarkdown [-DefaultCodeBlockLanguage <String>] [-GithubFlavored] -Html <String> [-ListBulletChar <Char>] [-PassThroughTags <String[]>] [-RemoveComments] [-SmartHrefHandling] [-TableWithoutHeaderRowHandling {Default | EmptyRow}] [-UnknownTags {PassThrough | Drop | Bypass | Raise}] [-WhitelistUriSchemes <String[]>] [<CommonParameters>]
```
