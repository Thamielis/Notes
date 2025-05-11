Get-GitHubMarkdown
------------------

### Synopsis
Render a Markdown document

---

### Description

Converts Markdown to HTML

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubMarkdown -Text "Hello **world**"
"<p>Hello <strong>world</strong></p>"
Renders the Markdown text "Hello **world**" to HTML.
```

---

### Parameters
#### **Text**
The Markdown text to render in HTML.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Mode**
The rendering mode.
Valid Values:

* markdown
* gfm

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **RepoContext**
The repository context to use when creating references in `gfm` mode. For example, setting `context` to `octo-org/octo-Repository` will
change the text `#42` into an HTML link to issue 42 in the `octo-org/octo-Repository` repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
[Render a Markdown document](https://docs.github.com/en/rest/markdown/markdown#render-a-markdown-document)

---

### Syntax
```PowerShell
Get-GitHubMarkdown [-Text] <String> [[-Mode] <String>] [[-RepoContext] <String>] [[-Context] <Object>] [<CommonParameters>]
```
