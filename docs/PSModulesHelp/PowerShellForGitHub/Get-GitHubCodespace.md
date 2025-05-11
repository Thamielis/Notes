Get-GitHubCodespace
-------------------

### Synopsis
Retrieves information about a Codespace or list of codespaces on GitHub.

---

### Description

Retrieves information about a Codespace or list of codespaces on GitHub.

The Git repo for this module can be found here: http://aka.ms/PowerShellForGitHub

---

### Related Links
* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#get-a-codespace-for-the-authenticated-user](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#get-a-codespace-for-the-authenticated-user)

* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#list-codespaces-in-a-repository-for-the-authenticated-user](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#list-codespaces-in-a-repository-for-the-authenticated-user)

* [https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#list-codespaces-for-the-authenticated-user](https://docs.github.com/en/rest/codespaces/codespaces?apiVersion=2022-11-28#list-codespaces-for-the-authenticated-user)

* [https://docs.github.com/en/rest/codespaces/organizations?apiVersion=2022-11-28#list-codespaces-for-the-organization](https://docs.github.com/en/rest/codespaces/organizations?apiVersion=2022-11-28#list-codespaces-for-the-organization)

* [https://docs.github.com/en/rest/codespaces/organizations?apiVersion=2022-11-28#list-codespaces-for-a-user-in-organization](https://docs.github.com/en/rest/codespaces/organizations?apiVersion=2022-11-28#list-codespaces-for-a-user-in-organization)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubCodespace
Gets all codespaces for the current authenticated user.
```
> EXAMPLE 2

```PowerShell
Get-GitHubCodespace -OwnerName octocat
Gets all of the codespaces for the user octocat
```
> EXAMPLE 3

```PowerShell
Get-GitHubUser -UserName octocat | Get-GitHubCodespace
Gets all of the codespaces for the user octocat
```
> EXAMPLE 4

```PowerShell
Get-GitHubCodespace -Uri https://github.com/microsoft/PowerShellForGitHub
Gets information about the microsoft/PowerShellForGitHub Codespace.
```
> EXAMPLE 5

```PowerShell
$repo | Get-GitHubCodespace
You can pipe in a previous Codespace to get its refreshed information.
```
> EXAMPLE 6

```PowerShell
Get-GitHubCodespace -OrganizationName PowerShell
Gets all of the codespaces in the PowerShell organization.
```

---

### Parameters
#### **OwnerName**
Owner of the Codespace.
If not supplied here, the DefaultOwnerName configuration property value will be used.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **RepositoryName**
Name of the repository.
If not supplied here, the DefaultRepositoryName configuration property value will be used.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Uri**
Uri for the Codespace.
The OwnerName and CodespaceName will be extracted from here instead of needing to provide
them individually.

|Type      |Required|Position|PipelineInput        |Aliases      |
|----------|--------|--------|---------------------|-------------|
|`[String]`|true    |named   |true (ByPropertyName)|RepositoryUrl|

#### **OrganizationName**
Name of the Organization.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **UserName**
The handle for the GitHub user account.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CodespaceName**
Name of the Codespace.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **AccessToken**
If provided, this will be used as the AccessToken for authentication with the
REST Api.  Otherwise, will attempt to use the configured value or will run unauthenticated.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Inputs
GitHub.Codespace
GitHub.Project
GitHub.Repository
GitHub.User

---

### Outputs
* GitHub.Codespace

---

### Syntax
```PowerShell
Get-GitHubCodespace [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubCodespace -OwnerName <String> -RepositoryName <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubCodespace -Uri <String> [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubCodespace -OrganizationName <String> [-UserName <String>] [-AccessToken <String>] [<CommonParameters>]
```
```PowerShell
Get-GitHubCodespace -CodespaceName <String> [-AccessToken <String>] [<CommonParameters>]
```
