Update-GitHubRepository
-----------------------

### Synopsis
Update a repository

---

### Description

**Note**: To edit a repository's topics, use the
[Replace all repository topics](https://docs.github.com/rest/repos/repos#replace-all-repository-topics) endpoint.

---

### Examples
> EXAMPLE 1

```PowerShell
Update-GitHubRepository -Name 'octocat' -Description 'Hello-World' -Homepage 'https://github.com'
```
> EXAMPLE 2

$params = @{
    Owner       = 'octocat'
    Repo        = 'Hello-World'
    name        = 'Hello-World-Repository
    description = 'This is your first repository'
    homepage    = 'https://github.com'
}
Update-GitHubRepository @params

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

#### **Name**
The name of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Description**
A short description of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Homepage**
A URL with more information about the repository.

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |5       |false        |

#### **Visibility**
The visibility of the repository.
Valid Values:

* public
* private

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **EnableAdvancedSecurity**
Use the status property to enable or disable GitHub Advanced Security for this repository.
For more information, see "About GitHub Advanced Security."

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableSecretScanning**
Use the status property to enable or disable secret scanning for this repository.
For more information, see "About secret scanning."

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EnableSecretScanningPushProtection**
Use the status property to enable or disable secret scanning push protection for this repository.
For more information, see "Protecting pushes with secret scanning."

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HasIssues**
Whether issues are enabled.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |has_issues|

#### **HasProjects**
Whether projects are enabled.

|Type      |Required|Position|PipelineInput|Aliases     |
|----------|--------|--------|-------------|------------|
|`[Switch]`|false   |named   |false        |has_projects|

#### **HasWiki**
Whether the wiki is enabled.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Switch]`|false   |named   |false        |has_wiki|

#### **IsTemplate**
Whether this repository acts as a template that can be used to generate new repositories.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |is_template|

#### **DefaultBranch**
Updates the default branch for this repository.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |7       |false        |default_branch|

#### **AllowSquashMerge**
Whether to allow squash merges for pull requests.

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |allow_squash_merge|

#### **AllowMergeCommit**
Whether to allow merge commits for pull requests.

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |allow_merge_commit|

#### **AllowRebaseMerge**
Whether to allow rebase merges for pull requests.

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[Switch]`|false   |named   |false        |allow_rebase_merge|

#### **AllowAutoMerge**
Whether to allow Auto-merge to be used on pull requests.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |allow_auto_merge|

#### **DeleteBranchOnMerge**
Whether to delete head branches when pull requests are merged

|Type      |Required|Position|PipelineInput|Aliases               |
|----------|--------|--------|-------------|----------------------|
|`[Switch]`|false   |named   |false        |delete_branch_on_merge|

#### **AllowUpdateMerge**
Either true to always allow a pull request head branch that is behind its base branch
to be updated even if it is not required to be up to date before merging, or false otherwise.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[Switch]`|false   |named   |false        |allow_update_branch|

#### **SquashMergeCommitTitle**
The default value for a squash merge commit title:
* PR_TITLE - default to the pull request's title.
* COMMIT_OR_PR_TITLE - default to the commit's title (if only one commit) or the pull request's title (when more than one commit).
Valid Values:

* PR_TITLE
* COMMIT_OR_PR_TITLE

|Type      |Required|Position|PipelineInput|Aliases                  |
|----------|--------|--------|-------------|-------------------------|
|`[String]`|false   |8       |false        |squash_merge_commit_title|

#### **SquashMergeCommitMessage**
The default value for a squash merge commit message:
* PR_BODY - default to the pull request's body.
* COMMIT_MESSAGES - default to the branch's commit messages.
* BLANK - default to a blank commit message.
Valid Values:

* PR_BODY
* COMMIT_MESSAGES
* BLANK

|Type      |Required|Position|PipelineInput|Aliases                    |
|----------|--------|--------|-------------|---------------------------|
|`[String]`|false   |9       |false        |squash_merge_commit_message|

#### **MergeCommitTitle**
The default value for a merge commit title.
* PR_TITLE - default to the pull request's title.
* MERGE_MESSAGE - default to the classic title for a merge message (e.g.,Merge pull request #123 from branch-name).
Valid Values:

* PR_TITLE
* MERGE_MESSAGE

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[String]`|false   |10      |false        |merge_commit_title|

#### **MergeCommitMessage**
The default value for a merge commit message.
* PR_BODY - default to the pull request's body.
* PR_TITLE - default to the pull request's title.
* BLANK - default to a blank commit message.
Valid Values:

* PR_BODY
* PR_TITLE
* BLANK

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[String]`|false   |11      |false        |merge_commit_message|

#### **Archived**
Whether to archive this repository. false will unarchive a previously archived repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AllowForking**
Either true to allow private forks, or false to prevent private forks.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Switch]`|false   |named   |false        |allow_forking|

#### **WebCommitSignoffRequired**
Either true to require contributors to sign off on web-based commits,
or false to not require contributors to sign off on web-based commits.

|Type      |Required|Position|PipelineInput|Aliases                    |
|----------|--------|--------|-------------|---------------------------|
|`[Switch]`|false   |named   |false        |web_commit_signoff_required|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |12      |false        |

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
[Update a repository](https://docs.github.com/rest/repos/repos#update-a-repository)

---

### Syntax
```PowerShell
Update-GitHubRepository [-Owner] <String> [-Repository] <String> [[-Name] <String>] [[-Description] <String>] [[-Homepage] <Uri>] [[-Visibility] <String>] [-EnableAdvancedSecurity] [-EnableSecretScanning] [-EnableSecretScanningPushProtection] [-HasIssues] [-HasProjects] [-HasWiki] [-IsTemplate] [[-DefaultBranch] <String>] [-AllowSquashMerge] [-AllowMergeCommit] [-AllowRebaseMerge] [-AllowAutoMerge] [-DeleteBranchOnMerge] [-AllowUpdateMerge] [[-SquashMergeCommitTitle] <String>] [[-SquashMergeCommitMessage] <String>] [[-MergeCommitTitle] <String>] [[-MergeCommitMessage] <String>] [-Archived] [-AllowForking] [-WebCommitSignoffRequired] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
