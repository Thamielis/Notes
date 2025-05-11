Get-GitHubOctocat
-----------------

### Synopsis
Get Octocat.

---

### Description

Get the octocat as ASCII art.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubOctocat
Get the octocat as ASCII art
```
> EXAMPLE 2

```PowerShell
Get-GitHubOctocat -S "Hello world"
Get the octocat as ASCII art with a custom saying
```

---

### Parameters
#### **Saying**
The words to show in Octocat's speech bubble

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

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
[Get Octocat](https://docs.github.com/rest/meta/meta#get-octocat)

---

### Syntax
```PowerShell
Get-GitHubOctocat [[-Saying] <String>] [[-Context] <Object>] [<CommonParameters>]
```
