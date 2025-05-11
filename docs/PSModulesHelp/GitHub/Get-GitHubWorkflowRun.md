Get-GitHubWorkflowRun
---------------------

### Synopsis
List workflow runs for a repository or a workflow

---

### Description

Lists all workflow runs for a repository or a workflow. You can use parameters to narrow the list of results. For more information about using
parameters, see [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).
Anyone with read access to the repository can use this endpoint.
OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository.
This endpoint will return up to 1,000 results for each search when using the following parameters: `actor`, `branch`, `check_suite_id`, `created`,
`event`, `head_sha`, `status`.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubWorkflowRun -Owner 'owner' -Repository 'repo'
Lists all workflow runs for a repository.
```
> EXAMPLE 2

```PowerShell
Get-GitHubWorkflowRun -Owner 'owner' -Repository 'repo' -Actor 'octocat' -Branch 'main' -Event 'push' -Status 'success'
Lists all workflow runs for a repository with the specified actor, branch, event, and status.
```
> EXAMPLE 3

```PowerShell
Get-GitHubWorkflowRun -Owner 'octocat' -Repository 'Hello-World' -ID '42'
Gets all workflow runs for the workflow with the ID `42` in the repository `Hello-World` owned by `octocat`.
```
> EXAMPLE 4

```PowerShell
Get-GitHubWorkflowRun -Owner 'octocat' -Repository 'Hello-World' -Name 'nightly.yml' -Actor 'octocat' -Branch 'main' -Event 'push' -Status 'success'
Gets all workflow runs for the workflow with the name `nightly.yml` in the repository `Hello-World` owned by `octocat` that were triggered by
the user `octocat` on the branch `main` and have the status `success`.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|User<br/>Organization|

#### **Repository**
The name of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ID**
The ID of the workflow. You can also pass the workflow filename as a string.

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|true    |named   |false        |workflow_id<br/>WorkflowID|

#### **Name**
The name of the workflow.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Actor**
Returns someone's workflow runs. Use the login for the user who created the push associated with the check suite or workflow run.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Branch**
Returns workflow runs associated with a branch. Use the name of the branch of the `push`.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Event**
Returns workflow run triggered by the event you specify. For example, `push`, `pull_request` or `issue`. For more information, see
"[Events that trigger workflows](https://docs.github.com/actions/automating-your-workflow-with-github-actions/events-that-trigger-workflows)."

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Status**
Returns workflow runs with the check run status or conclusion that you specify. For example, a conclusion can be success or a status can be
`in_progress`. Only GitHub Actions can set a status of `waiting`, `pending`, or `requested`.
Can be one of: `completed`, `action_required`, `cancelled`, `failure`, `neutral`, `skipped`, `stale`, `success`, `timed_out`, `in_progress`,
`queued`, `requested`, `waiting`, `pending`.
Valid Values:

* completed
* action_required
* cancelled
* failure
* neutral
* skipped
* stale
* success
* timed_out
* in_progress
* queued
* requested
* waiting
* pending

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Created**
Returns workflow runs created within the given date-time range. For more information on the syntax, see
"[Understanding the search syntax](https://docs.github.com/search-github/getting-started-with-searching-on-github/understanding-the-search-syntax#query-for-dates)."

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **ExcludePullRequests**
If `true` pull requests are omitted from the response (empty array).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CheckSuiteID**
Returns workflow runs with the check_suite_id that you specify.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **HeadSHA**
Only returns workflow runs that are associated with the specified head_sha.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[List workflow runs for a workflow](https://docs.github.com/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-workflow)
[List workflow runs for a repository](https://docs.github.com/rest/actions/workflow-runs?apiVersion=2022-11-28#list-workflow-runs-for-a-repository)

---

### Syntax
```PowerShell
Get-GitHubWorkflowRun -Owner <String> -Repository <String> [-Actor <String>] [-Branch <String>] [-Event <String>] [-Status <String>] [-Created <DateTime>] [-ExcludePullRequests] [-CheckSuiteID <Int32>] [-HeadSHA <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubWorkflowRun -Owner <String> -Repository <String> -ID <String> [-Actor <String>] [-Branch <String>] [-Event <String>] [-Status <String>] [-Created <DateTime>] [-ExcludePullRequests] [-CheckSuiteID <Int32>] [-HeadSHA <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubWorkflowRun -Owner <String> -Repository <String> -Name <String> [-Actor <String>] [-Branch <String>] [-Event <String>] [-Status <String>] [-Created <DateTime>] [-ExcludePullRequests] [-CheckSuiteID <Int32>] [-HeadSHA <String>] [-PerPage <Int32>] [-Context <Object>] [<CommonParameters>]
```
