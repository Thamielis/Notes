Get-GitHubScheduledMaintenance
------------------------------

### Synopsis
Gets the status of GitHub scheduled maintenance

---

### Description

Scheduled maintenances are planned outages, upgrades, or general notices that you're working
on infrastructure and disruptions may occurr. A close sibling of Incidents, each usually goes
through a progression of statuses listed below, with an impact calculated from a blend of
component statuses (or an optional override).

Status: Scheduled, In Progress, Verifying, or Completed
Impact: None (black), Minor (yellow), Major (orange), or Critical (red)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubScheduledMaintenance
Get a list of the 50 most recent scheduled maintenances.
This includes scheduled maintenances as described in the above two endpoints, as well as those in the Completed state.
```
> EXAMPLE 2

```PowerShell
Get-GitHubScheduledMaintenance -Active
Get a list of any active maintenances.
```
> EXAMPLE 3

```PowerShell
Get-GitHubScheduledMaintenance -Upcoming
Get a list of any upcoming maintenances.
```

---

### Parameters
#### **Active**
Get a list of any active maintenances.
This endpoint will only return scheduled maintenances in the In Progress or Verifying state.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Upcoming**
Get a list of any upcoming maintenances.
This endpoint will only return scheduled maintenances still in the Scheduled state.

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

### Notes
[Scheduled maintenances](https://www.githubstatus.com/api#scheduled-maintenances)

---

### Syntax
```PowerShell
Get-GitHubScheduledMaintenance [-Active] [-Upcoming] [[-Stamp] <String>] [<CommonParameters>]
```
