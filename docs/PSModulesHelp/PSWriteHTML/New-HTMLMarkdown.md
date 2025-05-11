New-HTMLMarkdown
----------------

### Synopsis
Creates HTML content from Markdown text with customizable options.

---

### Description

The New-HTMLMarkdown function converts Markdown text to HTML content with various customization options such as strikethrough, emojis, code block styling, table of contents, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLMarkdown -FilePath "C:\Markdown\example.md" -EnableStrikethrough -EnableEmoji -EnableTOC
Converts the Markdown content from the file "example.md" to HTML with strikethrough, emojis, and a table of contents.
```
> EXAMPLE 2

```PowerShell
$MarkdownContent = @("## Title", "This is a **bold** text.")
New-HTMLMarkdown -Content $MarkdownContent -EnableMoreStyling -EnableTaskLists
Converts the Markdown content in the array with additional styling and task list support.
```

---

### Parameters
#### **ScriptBlock**
Specifies a script block containing Markdown content to convert.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |1       |false        |

#### **FilePath**
Specifies the path to a file containing Markdown content to convert.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Content**
Specifies an array of Markdown content to convert.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|true    |named   |false        |

#### **Id**
Specifies the ID attribute for the HTML container.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **omitExtraWLInCodeBlocks**
Switch parameter to omit extra whitespace in code blocks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableStrikethrough**
Switch parameter to enable strikethrough styling.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableEmoji**
Switch parameter to enable emoji support.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableBackslashEscapesHTMLTags**
Switch parameter to enable backslash escapes for HTML tags.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableMoreStyling**
Switch parameter to enable additional styling options.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HeaderLevelStart**
Specifies the starting header level for Markdown content.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **EnableGithubCodeBlocks**
Switch parameter to enable GitHub-style code blocks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableTaskLists**
Switch parameter to enable task lists in Markdown.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableTables**
Switch parameter to disable table rendering.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableSimpleLineBreaks**
Switch parameter to enable simple line breaks.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableRequireSpaceBeforeHeadingText**
Switch parameter to require space before heading text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableEncodeEmails**
Switch parameter to enable email encoding.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableOpenLinksInNewWindow**
Switch parameter to open links in a new window.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableBackslashEscapes**
Switch parameter to enable backslash escapes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SanitezeHTML**
Switch parameter to sanitize HTML content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableTOC**
Switch parameter to enable table of contents generation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Encoding**
Specifies the encoding for reading the Markdown content file. Default is 'UTF8'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-HTMLMarkdown -FilePath <String> [-Id <String>] [-omitExtraWLInCodeBlocks] [-EnableStrikethrough] [-EnableEmoji] [-EnableBackslashEscapesHTMLTags] [-EnableMoreStyling] [-HeaderLevelStart <Int32>] [-EnableGithubCodeBlocks] [-EnableTaskLists] [-DisableTables] [-EnableSimpleLineBreaks] [-EnableRequireSpaceBeforeHeadingText] [-EnableEncodeEmails] [-EnableOpenLinksInNewWindow] [-EnableBackslashEscapes] [-SanitezeHTML] [-EnableTOC] [-Encoding <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLMarkdown [-ScriptBlock] <ScriptBlock> [-Id <String>] [-omitExtraWLInCodeBlocks] [-EnableStrikethrough] [-EnableEmoji] [-EnableBackslashEscapesHTMLTags] [-EnableMoreStyling] [-HeaderLevelStart <Int32>] [-EnableGithubCodeBlocks] [-EnableTaskLists] [-DisableTables] [-EnableSimpleLineBreaks] [-EnableRequireSpaceBeforeHeadingText] [-EnableEncodeEmails] [-EnableOpenLinksInNewWindow] [-EnableBackslashEscapes] [-SanitezeHTML] [-EnableTOC] [-Encoding <String>] [<CommonParameters>]
```
```PowerShell
New-HTMLMarkdown -Content <Array> [-Id <String>] [-omitExtraWLInCodeBlocks] [-EnableStrikethrough] [-EnableEmoji] [-EnableBackslashEscapesHTMLTags] [-EnableMoreStyling] [-HeaderLevelStart <Int32>] [-EnableGithubCodeBlocks] [-EnableTaskLists] [-DisableTables] [-EnableSimpleLineBreaks] [-EnableRequireSpaceBeforeHeadingText] [-EnableEncodeEmails] [-EnableOpenLinksInNewWindow] [-EnableBackslashEscapes] [-SanitezeHTML] [-EnableTOC] [-Encoding <String>] [<CommonParameters>]
```
