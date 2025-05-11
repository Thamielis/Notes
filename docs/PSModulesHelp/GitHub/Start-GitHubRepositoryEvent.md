Start-GitHubRepositoryEvent
---------------------------

### Synopsis
Create a repository dispatch event

---

### Description

You can use this endpoint to trigger a webhook event called `repository_dispatch` when you want activity
that happens outside of GitHub to trigger a GitHub Actions workflow or GitHub App webhook. You must configure
your GitHub Actions workflow or GitHub App to run when the `repository_dispatch`
event occurs. For an example `repository_dispatch` webhook payload, see
"[RepositoryDispatchEvent](https://docs.github.com/webhooks/event-payloads/#repository_dispatch)."

The `client_payload` parameter is available for any extra information that your workflow might need.
This parameter is a JSON payload that will be passed on when the webhook event is dispatched. For example,
the `client_payload` can include a message that a user would like to send using a GitHub Actions workflow.
Or the `client_payload` can be used as a test to debug your workflow.

This endpoint requires write access to the repository by providing either:

- Personal access tokens with `repo` scope. For more information, see
"[Creating a personal access token for the command line](https://docs.github.com/articles/creating-a-personal-access-token-for-the-command-line)"
in the GitHub Help documentation.
- GitHub Apps with both `metadata:read` and `contents:read&write` permissions.

This input example shows how you can use the `client_payload` as a test to debug your workflow.

---

### Examples
> EXAMPLE 1

$params = @{
    EventType = 'on-demand-test'
    ClientPayload = @{
        unit = false
        integration = true
    }
}
Start-GitHubRepositoryEvent @params
Starts a repository event with the name `on-demand-test` and a `client_payload` that includes `unit` and `integration`.

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |1       |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **EventType**
A custom webhook event name. Must be 100 characters or fewer.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|true    |3       |false        |event_type|

#### **ClientPayload**
JSON payload with extra information about the webhook event that your action or workflow may use.
The maximum number of top-level properties is 10.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[Object]`|false   |4       |false        |client_payload|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

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
[Create a repository dispatch event](https://docs.github.com/rest/repos/repos#create-a-repository-dispatch-event)

---

### Syntax
```PowerShell
Start-GitHubRepositoryEvent [-Owner] <String> [-Repository] <String> [-EventType] <String> [[-ClientPayload] <Object>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
