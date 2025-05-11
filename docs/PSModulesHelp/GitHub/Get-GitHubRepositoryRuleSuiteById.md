Get-GitHubRepositoryRuleSuiteById
---------------------------------

### Synopsis
Get a repository rule suite

---

### Description

Gets information about a suite of rule evaluations from within a repository.
For more information, see "[Managing rulesets for a repository](https://docs.github.com/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/managing-rulesets-for-a-repository#viewing-insights-for-rulesets)."

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryRuleSuiteById -Owner 'octocat' -Repository 'hello-world' -RuleSuiteId 123456789
Gets information about a suite of rule evaluations with ID 123456789 from within the octocat/hello-world repository.
```

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

#### **ID**
The unique identifier of the rule suite result. To get this ID, you can use GET /repos/ { owner }/ { repo }/rulesets/rule-suites for repositories and GET /orgs/ { org }/rulesets/rule-suites for organizations.

|Type     |Required|Position|PipelineInput|Aliases    |
|---------|--------|--------|-------------|-----------|
|`[Int32]`|true    |3       |false        |RuleSuiteId|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[Get a repository rule suite](https://docs.github.com/rest/repos/rule-suites#get-a-repository-rule-suite)

---

### Syntax
```PowerShell
Get-GitHubRepositoryRuleSuiteById [-Owner] <String> [-Repository] <String> [-ID] <Int32> [[-Context] <Object>] [<CommonParameters>]
```
