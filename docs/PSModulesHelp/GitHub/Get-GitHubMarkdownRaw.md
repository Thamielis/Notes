Get-GitHubMarkdownRaw
---------------------

### Synopsis
Render a Markdown document in raw mode

---

### Description

You must send Markdown as plain text (using a `Content-Type` header of `text/plain` or `text/x-markdown`) to this endpoint, rather than using
JSON format. In raw mode, [GitHub Flavored Markdown](https://github.github.com/gfm/) is not supported and Markdown will be rendered in plain
format like a README.md file. Markdown content must be 400 KB or less.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubMarkdownRaw -Text 'Hello, world!'
"<p>Hello <strong>world</strong></p>"
Render the Markdown text 'Hello, world!' in raw mode.
```

---

### Parameters
#### **Text**
The Markdown text to render in HTML.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

---

### Notes
[Render a Markdown document in raw mode](https://docs.github.com/rest/markdown/markdown#render-a-markdown-document-in-raw-mode)

---

### Syntax
```PowerShell
Get-GitHubMarkdownRaw [[-Text] <String>] [[-Context] <Object>] [<CommonParameters>]
```
