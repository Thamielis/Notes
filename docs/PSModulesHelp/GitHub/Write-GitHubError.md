Write-GitHubError
-----------------

### Synopsis
Write a error message in GitHub Actions

---

### Description

Write a error message in GitHub Actions. The message will be displayed in the GitHub Actions log.

---

### Examples
> EXAMPLE 1

```PowerShell
Write-GitHubError -Message 'Hello, World!'
Writes a error message 'Hello, World!'.
```

---

### Parameters
#### **Message**
Message to write

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Name**
The name of the file that this error is related to

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Line**
The line number that this error is related to

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

#### **Column**
The column number that this error is related to

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |4       |false        |

#### **EndColumn**
The end column number that this error is related to

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **EndLine**
The end line number that this error is related to

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |6       |false        |

#### **Title**
The title of the error

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Enabling debug logging](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#setting-an-error-message)

---

### Syntax
```PowerShell
Write-GitHubError [-Message] <String> [[-Name] <String>] [[-Line] <Int32>] [[-Column] <Int32>] [[-EndColumn] <Int32>] [[-EndLine] <Int32>] [[-Title] <String>] [<CommonParameters>]
```
