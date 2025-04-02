Stop-GitHubWorkflowRun
----------------------

### Synopsis
Cancel a workflow run

---

### Description

Cancels a workflow run using its `run_id`. You can use this endpoint to cancel a workflow run that is in progress or waiting

---

### Examples
> EXAMPLE 1

```PowerShell
Stop-GitHubWorkflowRun -Owner 'octocat' -Repository 'Hello-World' -ID 123456789
Cancels the workflow run with the ID 123456789 from the 'Hello-World' repository owned by 'octocat'
```

---

### Parameters
#### **Owner**

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|User<br/>Organization|

#### **Repository**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ID**

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|true    |3       |true (ByPropertyName)|workflow_id<br/>WorkflowID|

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
[Cancel a workflow run](https://docs.github.com/en/rest/actions/workflow-runs#cancel-a-workflow-run)

---

### Syntax
```PowerShell
Stop-GitHubWorkflowRun [-Owner] <String> [-Repository] <String> [-ID] <String> [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
