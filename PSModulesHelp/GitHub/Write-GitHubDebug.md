Write-GitHubDebug
-----------------

### Synopsis
Write a debug message in GitHub Actions

---

### Description

Write a debug message in GitHub Actions. The message will only be displayed if the action is running in debug mode.
To run in debug mode, you must create a secret or variable named ACTIONS_STEP_DEBUG with the value `true` to see the debug messages set by
this command in the log. For more information, see [Enabling debug logging](https://docs.github.com/en/actions/monitoring-and-troubleshooting-workflows/troubleshooting-workflows/enabling-debug-logging).

If both the secret and variable are set, the value of the secret takes precedence over the variable.

---

### Examples
> EXAMPLE 1

```PowerShell
Write-GitHubDebug -Message 'Hello, World!'
Writes a debug message 'Hello, World!'.
```

---

### Parameters
#### **Message**
Message to write

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

---

### Outputs
* [Void](https://learn.microsoft.com/en-us/dotnet/api/System.Void)

---

### Notes
[Enabling debug logging](https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/workflow-commands-for-github-actions#setting-a-debug-message)

---

### Syntax
```PowerShell
Write-GitHubDebug [-Message] <String> [<CommonParameters>]
```
