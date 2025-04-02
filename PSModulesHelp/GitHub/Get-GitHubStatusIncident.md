Get-GitHubStatusIncident
------------------------

### Synopsis
Gets the status of GitHub incidents

---

### Description

Incidents are the cornerstone of any status page, being composed of many incident updates.
Each incident usually goes through a progression of statuses listed below, with an impact
calculated from a blend of component statuses (or an optional override).

Status: Investigating, Identified, Monitoring, Resolved, or Postmortem
Impact: None (black), Minor (yellow), Major (orange), or Critical (red)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubStatusIncident
Gets the status of GitHub incidents
```
> EXAMPLE 2

```PowerShell
Get-GitHubStatusIncident -Unresolved
Gets the status of GitHub incidents that are unresolved
```

---

### Parameters
#### **Unresolved**
Gets the status of GitHub incidents that are unresolved

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
[Incidents](https://www.githubstatus.com/api#incidents)

---

### Syntax
```PowerShell
Get-GitHubStatusIncident [-Unresolved] [[-Stamp] <String>] [<CommonParameters>]
```
