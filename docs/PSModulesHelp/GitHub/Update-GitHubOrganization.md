Update-GitHubOrganization
-------------------------

### Synopsis
Update an organization

---

### Description

Enables an authenticated organization owner with the `admin:org` scope or the `repo` scope to update the organization's
profile and member privileges.

---

### Examples
> EXAMPLE 1

```PowerShell
Update-GitHubOrganization -Organization 'GitHub' -Blog 'https://github.blog'
Sets the blog URL for the organization 'GitHub' to '<https://github.blog>'.
```
> EXAMPLE 2

```PowerShell
$param = @{
    Organization                         = 'GitHub'
    MembersCanCreatePublicRepositories   = $true
    MembersCanCreatePrivateRepositories  = $true
    MembersCanCreateInternalRepositories = $true
}
Update-GitHubOrganization @param
Sets the repository creation permissions for the organization 'GitHub' to allow all members to create public, private,
and internal repositories.
```

---

### Parameters
#### **Organization**
The organization name. The name is not case sensitive.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **BillingEmail**
Billing email address. This address is not publicized.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|false   |2       |true (ByPropertyName)|billing_email|

#### **Company**
The company name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Email**
The publicly visible email address.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **TwitterUsername**
The Twitter username of the company.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|false   |5       |true (ByPropertyName)|twitter_username|

#### **Location**
The location.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |6       |true (ByPropertyName)|

#### **Name**
The shorthand name of the company.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |7       |true (ByPropertyName)|

#### **Description**
The description of the company.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |8       |true (ByPropertyName)|

#### **HasOrganizationProjects**
Whether an organization can use organization projects.

|Type       |Required|Position|PipelineInput        |Aliases                  |
|-----------|--------|--------|---------------------|-------------------------|
|`[Boolean]`|false   |9       |true (ByPropertyName)|has_organization_projects|

#### **HasRepositoryProjects**
Whether repositories that belong to the organization can use repository projects.

|Type       |Required|Position|PipelineInput        |Aliases                |
|-----------|--------|--------|---------------------|-----------------------|
|`[Boolean]`|false   |10      |true (ByPropertyName)|has_repository_projects|

#### **DefaultRepositoryPermission**
Default permission level members have for organization repositories.
Valid Values:

* read
* write
* admin
* none

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|false   |11      |true (ByPropertyName)|default_repository_permission|

#### **MembersCanCreateRepositories**
Whether of non-admin organization members can create repositories.
Note: A parameter can override this parameter. See members_allowed_repository_creation_type in this table for details.

|Type       |Required|Position|PipelineInput        |Aliases                        |
|-----------|--------|--------|---------------------|-------------------------------|
|`[Boolean]`|false   |12      |true (ByPropertyName)|members_can_create_repositories|

#### **MembersCanCreateInternalRepositories**
Whether organization members can create internal repositories, which are visible to all enterprise members.
You can only allow members to create internal repositories if your organization is associated with an enterprise
account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+. For more information, see
"Restricting repository creation in your organization" in the GitHub Help documentation.

|Type       |Required|Position|PipelineInput        |Aliases                                 |
|-----------|--------|--------|---------------------|----------------------------------------|
|`[Boolean]`|false   |13      |true (ByPropertyName)|members_can_create_internal_repositories|

#### **MembersCanCreatePrivateRepositories**
Whether organization members can create private repositories, which are visible to organization members with permission.
For more information, see "Restricting repository creation in your organization" in the GitHub Help documentation.

|Type       |Required|Position|PipelineInput        |Aliases                                |
|-----------|--------|--------|---------------------|---------------------------------------|
|`[Boolean]`|false   |14      |true (ByPropertyName)|members_can_create_private_repositories|

#### **MembersCanCreatePublicRepositories**
Whether organization members can create public repositories, which are visible to anyone. For more information,
see 'Restricting repository creation in your organization' in the GitHub Help documentation.

|Type       |Required|Position|PipelineInput        |Aliases                               |
|-----------|--------|--------|---------------------|--------------------------------------|
|`[Boolean]`|false   |15      |true (ByPropertyName)|members_can_create_public_repositories|

#### **MembersCanCreatePages**
Whether organization members can create GitHub Pages sites. Existing published sites will not be impacted.

|Type       |Required|Position|PipelineInput        |Aliases                 |
|-----------|--------|--------|---------------------|------------------------|
|`[Boolean]`|false   |16      |true (ByPropertyName)|members_can_create_pages|

#### **MembersCanCreatePublicPages**
Whether organization members can create public GitHub Pages sites. Existing published sites will not be impacted.

|Type       |Required|Position|PipelineInput        |Aliases                        |
|-----------|--------|--------|---------------------|-------------------------------|
|`[Boolean]`|false   |17      |true (ByPropertyName)|members_can_create_public_pages|

#### **MembersCanCreatePrivatePages**
Whether organization members can create private GitHub Pages sites. Existing published sites will not be impacted.

|Type       |Required|Position|PipelineInput        |Aliases                         |
|-----------|--------|--------|---------------------|--------------------------------|
|`[Boolean]`|false   |18      |true (ByPropertyName)|members_can_create_private_pages|

#### **MembersCanForkPrivateRepositories**
Whether organization members can fork private organization repositories.

|Type       |Required|Position|PipelineInput        |Aliases                              |
|-----------|--------|--------|---------------------|-------------------------------------|
|`[Boolean]`|false   |19      |true (ByPropertyName)|members_can_fork_private_repositories|

#### **WebCommitSignoffRequired**
Whether contributors to organization repositories are required to sign off on commits they make through GitHub's web interface.

|Type       |Required|Position|PipelineInput        |Aliases                    |
|-----------|--------|--------|---------------------|---------------------------|
|`[Boolean]`|false   |20      |true (ByPropertyName)|web_commit_signoff_required|

#### **Blog**
Path to the organization's blog.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |21      |true (ByPropertyName)|

#### **SecretScanningPushProtectionEnabledForNewRepositories**
Whether secret scanning push protection is automatically enabled for new repositories.
To use this parameter, you must have admin permissions for the repository or be an owner or security manager for
the organization that owns the repository. For more information, see "Managing security managers in your organization."
You can check which security and analysis features are currently enabled by using a GET /orgs/{org} request.

|Type       |Required|Position|PipelineInput        |Aliases                                                     |
|-----------|--------|--------|---------------------|------------------------------------------------------------|
|`[Boolean]`|false   |22      |true (ByPropertyName)|secret_scanning_push_protection_enabled_for_new_repositories|

#### **SecretScanningPushProtectionCustomLinkEnabled**
Whether a custom link is shown to contributors who are blocked from pushing a secret by push protection.

|Type       |Required|Position|PipelineInput        |Aliases                                            |
|-----------|--------|--------|---------------------|---------------------------------------------------|
|`[Boolean]`|false   |23      |true (ByPropertyName)|secret_scanning_push_protection_custom_link_enabled|

#### **SecretScanningPushProtectionCustomLink**
If secret_scanning_push_protection_custom_link_enabled is true, the URL that will be displayed to contributors who
are blocked from pushing a secret.

|Type      |Required|Position|PipelineInput        |Aliases                                    |
|----------|--------|--------|---------------------|-------------------------------------------|
|`[String]`|false   |24      |true (ByPropertyName)|secret_scanning_push_protection_custom_link|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |25      |false        |

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
[Update an organization](https://docs.github.com/rest/orgs/orgs#update-an-organization)

---

### Syntax
```PowerShell
Update-GitHubOrganization [-Organization] <String> [[-BillingEmail] <String>] [[-Company] <String>] [[-Email] <String>] [[-TwitterUsername] <String>] [[-Location] <String>] [[-Name] <String>] [[-Description] <String>] [[-HasOrganizationProjects] <Boolean>] [[-HasRepositoryProjects] <Boolean>] [[-DefaultRepositoryPermission] <String>] [[-MembersCanCreateRepositories] <Boolean>] [[-MembersCanCreateInternalRepositories] <Boolean>] [[-MembersCanCreatePrivateRepositories] <Boolean>] [[-MembersCanCreatePublicRepositories] <Boolean>] [[-MembersCanCreatePages] <Boolean>] [[-MembersCanCreatePublicPages] <Boolean>] [[-MembersCanCreatePrivatePages] <Boolean>] [[-MembersCanForkPrivateRepositories] <Boolean>] [[-WebCommitSignoffRequired] <Boolean>] [[-Blog] <String>] [[-SecretScanningPushProtectionEnabledForNewRepositories] <Boolean>] [[-SecretScanningPushProtectionCustomLinkEnabled] <Boolean>] [[-SecretScanningPushProtectionCustomLink] <String>] [[-Context] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```
