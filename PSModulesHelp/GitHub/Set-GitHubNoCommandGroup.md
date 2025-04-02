Set-GitHubNoCommandGroup
------------------------

### Synopsis
Disables workflow commands for a block of code.

---

### Description

DSL approach for GitHub Action commands.
Allows for colapsing of code in IDE for code that belong together.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-GitHubNoCommandGroup {
    Write-Host 'Hello, World!'
    Write-GithubError 'This is an error'
}
Groups commands where no workflow commands are run.
```
> EXAMPLE 2

```PowerShell
NoLogGroup 'MyGroup' {
    Write-Host 'Hello, World!'
    Write-GithubError 'This is an error'
}
Groups commands where no workflow commands are run, using an alias and DSL approach.
```

---

### Parameters
#### **ScriptBlock**
The script block to execute

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |1       |false        |

---

### Notes
[Stopping and starting workflow commands](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#stopping-and-starting-workflow-commands)

---

### Syntax
```PowerShell
Set-GitHubNoCommandGroup [-ScriptBlock] <ScriptBlock> [<CommonParameters>]
```
