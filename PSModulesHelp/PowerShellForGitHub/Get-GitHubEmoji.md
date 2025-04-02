Get-GitHubEmoji
---------------

### Synopsis
Gets all the emojis available to use on GitHub.

---

### Description

Gets all the emojis available to use on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubEmoji
```

---

### Parameters
#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* GitHub.Emoji

---

### Syntax
```PowerShell
Get-GitHubEmoji [[-AccessToken] <String>] [<CommonParameters>]
```
