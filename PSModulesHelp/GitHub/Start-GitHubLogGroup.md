Start-GitHubLogGroup
--------------------

### Synopsis
Starts a log group in GitHub Actions

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
New-LogGroup 'MyGroup'
Starts a new log group named 'MyGroup'
```

---

### Parameters
#### **Name**
The name of the log group

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Notes
[GitHub - Grouping log lines](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#grouping-log-lines)

---

### Syntax
```PowerShell
Start-GitHubLogGroup [-Name] <String> [<CommonParameters>]
```
