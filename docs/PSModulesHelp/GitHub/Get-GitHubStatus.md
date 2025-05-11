Get-GitHubStatus
----------------

### Synopsis
Gets the status of GitHub services

---

### Description

Get a summary of the status page, including a status indicator, component statuses, unresolved incidents,
and any upcoming or in-progress scheduled maintenances. Get the status rollup for the whole page. This endpoint
includes an indicator - one of none, minor, major, or critical, as well as a human description of the blended
component status. Examples of the blended status include "All Systems Operational", "Partial System Outage",
and "Major Service Outage".

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubStatus
Gets the status of GitHub services
```
> EXAMPLE 2

```PowerShell
Get-GitHubStatus -Summary
Gets a summary of the status page, including a status indicator, component statuses, unresolved incidents,
and any upcoming or in-progress scheduled maintenances.
```

---

### Parameters
#### **Summary**
Gets a summary of the status page, including a status indicator, component statuses, unresolved incidents,
and any upcoming or in-progress scheduled maintenances.

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
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Summary](https://www.githubstatus.com/api#summary)
[Status](https://www.githubstatus.com/api#status)

---

### Syntax
```PowerShell
Get-GitHubStatus [-Summary] [[-Stamp] <String>] [<CommonParameters>]
```
