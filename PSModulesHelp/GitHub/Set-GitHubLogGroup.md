Set-GitHubLogGroup
------------------

### Synopsis
Encapsulates commands with a log group in GitHub Actions

---

### Description

DSL approach for GitHub Action commands.
Allows for colapsing of code in IDE for code that belong together.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubLogGroup -Name 'MyGroup' -ScriptBlock {
    Write-Host 'Hello, World!'
}
Creates a new log group named 'MyGroup' and writes 'Hello, World!' to the output.
```
> EXAMPLE 2

```PowerShell
LogGroup 'MyGroup' {
    Write-Host 'Hello, World!'
}
Uses the alias 'LogGroup' to create a new log group named 'MyGroup' and writes 'Hello, World!' to the output.
```

---

### Parameters
#### **Name**
The name of the log group

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ScriptBlock**
The script block to execute

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |2       |false        |

---

### Notes
[GitHub - Grouping log lines](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#grouping-log-lines)

---

### Syntax
```PowerShell
Set-GitHubLogGroup [-Name] <String> [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```
