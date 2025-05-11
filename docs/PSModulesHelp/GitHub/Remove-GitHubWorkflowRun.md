Remove-GitHubWorkflowRun
------------------------

### Synopsis
Delete a workflow run

---

### Description

Delete a specific workflow run. Anyone with write access to the repository can use this endpoint. If the repository is
private you must use an access token with the `repo` scope. GitHub Apps must have the `actions:write` permission to use
this endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-GitHubWorkflowRun -Owner 'octocat' -Repository 'Hello-World' -ID 123456789
Deletes the workflow run with the ID 123456789 from the 'Hello-World' repository owned by 'octocat'
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ID**
The unique identifier of the workflow run.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |3       |true (ByPropertyName)|run_id<br/>RunID|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Notes
[Delete a workflow run](https://docs.github.com/rest/actions/workflow-runs#delete-a-workflow-run)

---

### Syntax
```PowerShell
Remove-GitHubWorkflowRun [-Owner] <String> [-Repository] <String> [-ID] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
