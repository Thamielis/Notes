ConvertFrom-GitHubMarkdown
--------------------------

### Synopsis
Converts arbitrary Markdown into HTML.

---

### Description

Converts arbitrary Markdown into HTML.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertFrom-GitHubMarkdown -Content '**Bolded Text**' -Mode Markdown
Returns back '<p><strong>Bolded Text</strong></p>'
```

---

### Parameters
#### **Content**
The Markdown text to render to HTML.  Content must be 400 KB or less.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |1       |true (ByValue)|

#### **Mode**
The rendering mode for the Markdown content.
Markdown - Renders Content in plain Markdown, just like README.md files are rendered
GitHubFlavoredMarkdown - Creates links for user mentions as well as references to
SHA-1 hashes, issues, and pull requests.
Valid Values:

* Markdown
* GitHubFlavoredMarkdown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Context**
The repository to use when creating references in 'githubFlavoredMarkdown' mode.
Specify as [ownerName]/[repositoryName].

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Inputs
[String]

---

### Outputs
* [String] The HTML version of the Markdown content.

---

### Syntax
```PowerShell
ConvertFrom-GitHubMarkdown [-Content] <String> [[-Mode] <String>] [[-Context] <String>] [[-AccessToken] <String>] [<CommonParameters>]
```
