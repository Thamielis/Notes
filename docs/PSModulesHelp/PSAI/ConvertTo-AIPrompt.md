ConvertTo-AIPrompt
------------------

### Synopsis
Converts a GitHub repository into a single XML file optimized for AI tools.

---

### Description

This function downloads files from a GitHub repository and packages them into a single XML file
that can be easily used with AI tools like ChatGPT, Claude, Gemini, etc.

The repository content is organized into a structured format with each file's content 
encapsulated in separate document sections with paths and other metadata.

---

### Examples
> EXAMPLE 1

```PowerShell
ConvertTo-AIPrompt -RepoSlug "dfinke/ImportExcel" -OutputPath "D:\ImportExcel.xml" -Exclude "*.xlsx","*.jpg"
Exports the entire dfinke/ImportExcel repository, excluding xlsx and jpg files and all default binary formats.
```
> EXAMPLE 2

```PowerShell
ConvertTo-AIPrompt -RepoSlug "dfinke/ImportExcel/Examples" -Include "*.ps1","*.md" | Set-Content -Path "ExcelExamples.xml"
Exports only PowerShell and Markdown files from the Examples folder of the ImportExcel repository.
```
> EXAMPLE 3

```PowerShell
ConvertTo-AIPrompt -RepoSlug "owner/repo" -IncludeBinary
Exports all files from the repository, including binary files that would normally be excluded.
```

---

### Parameters
#### **RepoSlug**
The GitHub repository slug in format 'owner/repo'. Optional subfolder can be specified using 'owner/repo/subfolder'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **OutputPath**
Path to save the generated XML file. If not provided, the output is returned as a string.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Exclude**
Array of file patterns to exclude (wildcards supported, e.g., *.jpg, *.xlsx).
By default, common binary and non-text formats are excluded (see Notes for the list).

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Include**
Array of file patterns to include (wildcards supported, e.g., *.ps1, *.md). If not specified, all files are included.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Token**
GitHub API token for private repositories. Optional for public repos but recommended to avoid rate limiting.
If not provided, the function will attempt to use $env:GITHUB_TOKEN.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IncludeBinary**
Switch to override the default binary file exclusions. When specified, only the files explicitly
mentioned in the Exclude parameter will be excluded.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Requires connectivity to api.github.com.
Consider using a token to avoid GitHub API rate limits.
You can set $env:GITHUB_TOKEN environment variable for authentication instead of passing the token parameter.

Default excluded binary and non-text formats:
- Images: *.jpg, *.jpeg, *.png, *.gif, *.bmp, *.ico, *.svg, *.webp
- Documents: *.pdf, *.docx, *.xlsx, *.pptx, *.odt, *.ods, *.odp
- Archives: *.zip, *.tar, *.gz, *.7z, *.rar
- Executables: *.exe, *.dll, *.so, *.dylib, *.bin
- Media: *.mp3, *.mp4, *.wav, *.avi, *.mov, *.flac, *.mkv
- Others: *.dat, *.db, *.sqlite, *.pyc, *.class, *.jar, *.iso, *.pdb

---

### Syntax
```PowerShell
ConvertTo-AIPrompt [-RepoSlug] <String> [-OutputPath <String>] [-Exclude <String[]>] [-Include <String[]>] [-Token <String>] [-IncludeBinary] [<CommonParameters>]
```
