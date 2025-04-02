Restart-GitHubWorkflowRun
-------------------------

### Synopsis
Re-run a workflow

---

### Description

Re-runs your workflow run using its `run_id`. You can also specify a branch or tag name to re-run a workflow run from a branch

---

### Examples
> EXAMPLE 1

```PowerShell
Start-GitHubWorkflowReRun -Owner 'octocat' -Repository 'Hello-World' -ID 123456789
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

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |3       |true (ByPropertyName)|workflow_id|

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
[Re-run a workflow](https://docs.github.com/en/rest/actions/workflow-runs#re-run-a-workflow)

---

### Syntax
```PowerShell
Restart-GitHubWorkflowRun [-Owner] <String> [-Repository] <String> [-ID] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
