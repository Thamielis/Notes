Get-GitHubEmoji
---------------

### Synopsis
Get emojis

---

### Description

Lists all the emojis available to use on GitHub.
If you pass the `Path` parameter, the emojis will be downloaded to the specified destination.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubEmoji
Gets all the emojis available to use on GitHub.
```
> EXAMPLE 2

```PowerShell
Get-GitHubEmoji -Path 'C:\Users\user\Documents\GitHub\Emojis'
Downloads all the emojis available to use on GitHub to the specified destination.
```

---

### Parameters
#### **Path**
The path to the directory where the emojis will be downloaded.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[Get emojis](https://docs.github.com/rest/reference/emojis#get-emojis)

---

### Syntax
```PowerShell
Get-GitHubEmoji [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubEmoji -Path <String> [-Context <Object>] [<CommonParameters>]
```
