New-GitHubRepository
--------------------

### Synopsis
Create a repository for a user or an organization.

---

### Description

Creates a new repository for a user or in a specified organization.

**OAuth scope requirements**

When using [OAuth](https://docs.github.com/apps/building-oauth-apps/understanding-scopes-for-oauth-apps/), authorizations must include:

* `public_repo` scope or `repo` scope to create a public repository. Note: For GitHub AE, use `repo` scope to create an internal repository.
* `repo` scope to create a private repository

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Name                     = 'Hello-World'
    Description              = 'This is your first repository'
    Homepage                 = 'https://github.com'
    HasIssues                = $true
    HasProjects              = $true
    HasWiki                  = $true
    HasDiscussions           = $true
    HasDownloads             = $true
    IsTemplate               = $true
    AutoInit                 = $true
    AllowSquashMerge         = $true
    AllowAutoMerge           = $true
    DeleteBranchOnMerge      = $true
    SquashMergeCommitTitle   = 'PR_TITLE'
    SquashMergeCommitMessage = 'PR_BODY'
}
New-GitHubRepository @params
Creates a new public repository named "Hello-World" owned by the authenticated user.
```
> EXAMPLE 2

```PowerShell
$params = @{
    Owner                    = 'PSModule'
    Name                     = 'Hello-World'
    Description              = 'This is your first repository'
    Homepage                 = 'https://github.com'
    HasIssues                = $true
    HasProjects              = $true
    HasWiki                  = $true
    HasDownloads             = $true
    IsTemplate               = $true
    AutoInit                 = $true
    AllowSquashMerge         = $true
    AllowAutoMerge           = $true
    DeleteBranchOnMerge      = $true
    SquashMergeCommitTitle   = 'PR_TITLE'
    SquashMergeCommitMessage = 'PR_BODY'
}
New-GitHubRepository @params
Creates a new public repository named "Hello-World" owned by the organization "PSModule".
```
> EXAMPLE 3

```PowerShell
$params = @{
    TemplateOwner      = 'GitHub'
    TemplateRepo       = 'octocat'
    Owner              = 'PSModule'
    Name               = 'MyNewRepo'
    IncludeAllBranches = $true
    Description        = 'My new repo'
    Private            = $true
}
New-GitHubRepository @params
Creates a new private repository named `MyNewRepo` from the `octocat` template repository owned by `GitHub`.
```
> EXAMPLE 4

```PowerShell
$params = @{
    ForkOwner         = 'octocat'
    ForkRepo          = 'Hello-World'
    Owner             = 'PSModule'
    Name              = 'MyNewRepo'
    DefaultBranchOnly = $true
}
New-GitHubRepository @params
Creates a new repository named `MyNewRepo` as a fork of `Hello-World` owned by `octocat`.
Only the default branch will be forked.
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|false   |named   |false        |User<br/>Organization|

#### **Name**
The name of the repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **TemplateOwner**
The account owner of the template repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|true    |named   |false        |template_owner|

#### **TemplateRepo**
The name of the template repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|true    |named   |false        |template_repo|

#### **ForkOwner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ForkRepo**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **DefaultBranchOnly**
When forking from an existing repository, fork with only the default branch.

|Type      |Required|Position|PipelineInput|Aliases            |
|----------|--------|--------|-------------|-------------------|
|`[Switch]`|false   |named   |false        |default_branch_only|

#### **Description**
A short description of the new repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IncludeAllBranches**
Set to true to include the directory structure and files from all branches in the template repository,
and not just the default branch.

|Type      |Required|Position|PipelineInput|Aliases             |
|----------|--------|--------|-------------|--------------------|
|`[Switch]`|false   |named   |false        |include_all_branches|

#### **Homepage**
A URL with more information about the repository.

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **Visibility**
The visibility of the repository.
Valid Values:

* public
* private

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **HasDiscussions**
Whether discussions are enabled.

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[Switch]`|false   |named   |false        |has_discussions|

#### **HasDownloads**
Whether downloads are enabled.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Switch]`|false   |named   |false        |has_downloads|

#### **IsTemplate**
Whether this repository acts as a template that can be used to generate new repositories.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |is_template|

#### **TeamId**
The ID of the team that will be granted access to this repository. This is only valid when creating a repository in an organization.

|Type          |Required|Position|PipelineInput|Aliases|
|--------------|--------|--------|-------------|-------|
|`[Nullable`1]`|false   |named   |false        |team_id|

#### **AutoInit**
Pass true to create an initial commit with empty README.

|Type      |Required|Position|PipelineInput|Aliases  |
|----------|--------|--------|-------------|---------|
|`[Switch]`|false   |named   |false        |auto_init|

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

#### **SquashMergeCommitTitle**
The default value for a squash merge commit title:
* PR_TITLE - default to the pull request's title.
* COMMIT_OR_PR_TITLE - default to the commit's title (if only one commit) or the pull request's title (when more than one commit).
Valid Values:

* PR_TITLE
* COMMIT_OR_PR_TITLE

|Type      |Required|Position|PipelineInput|Aliases                  |
|----------|--------|--------|-------------|-------------------------|
|`[String]`|false   |named   |false        |squash_merge_commit_title|

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
|`[String]`|false   |named   |false        |squash_merge_commit_message|

#### **MergeCommitTitle**
The default value for a merge commit title.
* PR_TITLE - default to the pull request's title.
* MERGE_MESSAGE - default to the classic title for a merge message (e.g.,Merge pull request #123 from branch-name).
Valid Values:

* PR_TITLE
* MERGE_MESSAGE

|Type      |Required|Position|PipelineInput|Aliases           |
|----------|--------|--------|-------------|------------------|
|`[String]`|false   |named   |false        |merge_commit_title|

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
|`[String]`|false   |named   |false        |merge_commit_message|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Create a repository for the authenticated user](https://docs.github.com/rest/repos/repos#create-a-repository-for-the-authenticated-user)
[Create an organization repository](https://docs.github.com/rest/repos/repos#create-an-organization-repository)

---

### Syntax
```PowerShell
New-GitHubRepository -Name <String> [-Description <String>] [-Homepage <Uri>] [-Visibility <String>] [-HasIssues] [-HasProjects] [-HasWiki] [-HasDiscussions] [-HasDownloads] [-IsTemplate] [-TeamId <Nullable`1>] [-AutoInit] [-AllowSquashMerge] [-AllowMergeCommit] [-AllowRebaseMerge] [-AllowAutoMerge] [-DeleteBranchOnMerge] [-SquashMergeCommitTitle <String>] [-SquashMergeCommitMessage <String>] [-MergeCommitTitle <String>] [-MergeCommitMessage <String>] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubRepository [-Owner <String>] [-Name <String>] -ForkOwner <String> -ForkRepo <String> [-DefaultBranchOnly] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubRepository [-Owner <String>] -Name <String> [-Description <String>] [-Homepage <Uri>] [-Visibility <String>] [-HasIssues] [-HasProjects] [-HasWiki] [-HasDownloads] [-IsTemplate] [-TeamId <Nullable`1>] [-AutoInit] [-AllowSquashMerge] [-AllowMergeCommit] [-AllowRebaseMerge] [-AllowAutoMerge] [-DeleteBranchOnMerge] [-SquashMergeCommitTitle <String>] [-SquashMergeCommitMessage <String>] [-MergeCommitTitle <String>] [-MergeCommitMessage <String>] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
```PowerShell
New-GitHubRepository -Name <String> -TemplateOwner <String> -TemplateRepo <String> [-Description <String>] [-IncludeAllBranches] [-Visibility <String>] [-Context <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
