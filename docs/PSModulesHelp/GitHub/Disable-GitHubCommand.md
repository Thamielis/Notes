Disable-GitHubCommand
---------------------

### Synopsis
Stops workflow commands

---

### Description

Stops processing any workflow commands. This special command allows you to log anything without accidentally running a workflow command.
For example, you could stop logging to output an entire script that has comments.

To stop the processing of workflow commands, pass a unique string to the function. To resume processing workflow commands, pass the same string
that you used to stop workflow commands to the Enable-GitHubCommand.

---

### Examples
> EXAMPLE 1

```PowerShell
Disable-GitHubCommand "123"
Stops processing any workflow commands.
```

---

### Parameters
#### **String**
The unique string to stop the processing of workflow commands

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Stopping and starting workflow commands](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#stopping-and-starting-workflow-commands)

---

### Syntax
```PowerShell
Disable-GitHubCommand [-String] <String> [<CommonParameters>]
```
