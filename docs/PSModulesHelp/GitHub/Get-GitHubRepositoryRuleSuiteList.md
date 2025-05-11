Get-GitHubRepositoryRuleSuiteList
---------------------------------

### Synopsis
List repository rule suites

---

### Description

Lists suites of rule evaluations at the repository level.
For more information, see"[Managing rulesets for a repository](https://docs.github.com/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/managing-rulesets-for-a-repository#viewing-insights-for-rulesets)."

---

### Examples
> EXAMPLE 1

```PowerShell
$params = @{
    Owner           = 'octocat'
    Repo            = 'hello-world'
    Ref             = 'main'
    TimePeriod      = 'day'
    ActorName       = 'octocat'
    RuleSuiteResult = 'all'
}
Get-GitHubRepositoryRuleSuiteList @params
Gets a list of rule suites for the main branch of the hello-world repository owned by octocat.
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

#### **Ref**
The name of the ref. Cannot contain wildcard characters.
When specified, only rule evaluations triggered for this ref will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TimePeriod**
The time period to filter by.
For example,day will filter for rule suites that occurred in the past 24 hours,
and week will filter for insights that occurred in the past 7 days (168 hours).
Valid Values:

* hour
* day
* week
* month

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **ActorName**
The handle for the GitHub user account to filter on. When specified, only rule evaluations triggered by this actor will be returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **RuleSuiteResult**
The rule results to filter on. When specified, only suites with this result will be returned.
Valid Values:

* pass
* fail
* bypass
* all

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |7       |false        |

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Notes
[List repository rule suites](https://docs.github.com/rest/repos/rule-suites#list-repository-rule-suites)

---

### Syntax
```PowerShell
Get-GitHubRepositoryRuleSuiteList [-Owner] <String> [-Repository] <String> [[-Ref] <String>] [[-TimePeriod] <String>] [[-ActorName] <String>] [[-RuleSuiteResult] <String>] [[-PerPage] <Int32>] [[-Context] <Object>] [<CommonParameters>]
```
