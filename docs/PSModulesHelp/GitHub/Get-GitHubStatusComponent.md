Get-GitHubStatusComponent
-------------------------

### Synopsis
Gets the status of GitHub components

---

### Description

Get the components for the page. Each component is listed along with its status - one of operational,
degraded_performance, partial_outage, or major_outage.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubStatusComponent
Gets the status of GitHub components
```

---

### Parameters
#### **Stamp**
The stanmp to use for the API call.
Valid Values:

* public
* eu

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Outputs
* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

---

### Notes
[Components](https://www.githubstatus.com/api#components)

---

### Syntax
```PowerShell
Get-GitHubStatusComponent [[-Stamp] <String>] [<CommonParameters>]
```
