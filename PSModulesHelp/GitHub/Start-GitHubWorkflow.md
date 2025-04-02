Start-GitHubWorkflow
--------------------

### Synopsis
Start a workflow run using the workflow's ID.

---

### Description

Start a workflow run using the workflow's ID.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubWorkflow | Where-Object name -NotLike '.*' | Start-GitHubWorkflow -Inputs @{
    staticValidation = $true
    deploymentValidation = $false
    removeDeployment = $true
    prerelease = $false
}
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
The ID of the workflow.

|Type      |Required|Position|PipelineInput        |Aliases                   |
|----------|--------|--------|---------------------|--------------------------|
|`[String]`|true    |3       |true (ByPropertyName)|workflow_id<br/>WorkflowID|

#### **Ref**
The reference of the workflow run. The reference can be a branch, tag, or a commit SHA.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |4       |true (ByPropertyName)|branch<br/>tag|

#### **Inputs**
Input parameters for the workflow run. You can use the inputs and payload keys to pass custom data to your workflow.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |5       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

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
[Create a workflow dispatch event](https://docs.github.com/en/rest/actions/workflows#create-a-workflow-dispatch-event)

---

### Syntax
```PowerShell
Start-GitHubWorkflow [-Owner] <String> [-Repository] <String> [-ID] <String> [[-Ref] <String>] [[-Inputs] <Hashtable>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
