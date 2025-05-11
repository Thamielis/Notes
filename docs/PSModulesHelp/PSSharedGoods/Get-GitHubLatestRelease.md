Get-GitHubLatestRelease
-----------------------

### Synopsis
Gets one or more releases from GitHub repository

---

### Description

Gets one or more releases from GitHub repository

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubLatestRelease -Url "https://api.github.com/repos/evotecit/Testimo/releases" | Format-Table
```

---

### Parameters
#### **Url**
Url to github repository

|Type   |Required|Position|PipelineInput|Aliases    |
|-------|--------|--------|-------------|-----------|
|`[Uri]`|true    |1       |false        |ReleasesUrl|

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GitHubLatestRelease [-Url] <Uri> [<CommonParameters>]
```
