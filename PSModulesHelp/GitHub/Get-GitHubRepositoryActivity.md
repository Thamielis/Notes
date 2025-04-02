Get-GitHubRepositoryActivity
----------------------------

### Synopsis
List repository activities

---

### Description

Lists a detailed history of changes to a repository, such as pushes, merges, force pushes, and branch changes,
and associates these changes with commits and users.

For more information about viewing repository activity,
see "[Viewing activity and data for your repository](https://docs.github.com/repositories/viewing-activity-and-data-for-your-repository)."

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub'
```
> EXAMPLE 2

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub' -Direction 'asc'
```
> EXAMPLE 3

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub' -PerPage 100
```
> EXAMPLE 4

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub' -Before '2021-01-01T00:00:00Z'
```
> EXAMPLE 5

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub' -After '2021-01-01T00:00:00Z'
```
> EXAMPLE 6

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub' -Ref 'refs/heads/main'
```
> EXAMPLE 7

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub' -Actor 'octocat'
```
> EXAMPLE 8

```PowerShell
$params = @{
    Owner       = 'PSModule'
    Repo        = 'GitHub'
    TimePeriod  = 'day'
}
Get-GitHubRepositoryActivity @params |
    Select-Object -Property @{n='actor';e={$_.actor.login}},activity_type,ref,timestamp
Gets the activity for the past 24 hours and selects the actor, activity type, ref, and timestamp.
```
> EXAMPLE 9

```PowerShell
Get-GitHubRepositoryActivity -Owner 'PSModule' -Repository 'GitHub' -ActivityType 'push','force_push'
```

---

### Parameters
#### **Owner**
The account owner of the repository. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|Aliases              |
|----------|--------|--------|-------------|---------------------|
|`[String]`|true    |named   |false        |User<br/>Organization|

#### **Repository**
The name of the repository without the .git extension. The name is not case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Direction**
The direction to sort the results by.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PerPage**
The number of results per page (max 100).

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Before**
A cursor, as given in the Link header. If specified, the query only searches for results before this cursor.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **After**
A cursor, as given in the Link header. If specified, the query only searches for results after this cursor.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Ref**
The Git reference for the activities you want to list.
The ref for a branch can be formatted either as refs/heads/BRANCH_NAME or BRANCH_NAME, where BRANCH_NAME is the name of your branch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Actor**
The GitHub username to use to filter by the actor who performed the activity.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **TimePeriod**
The time period to filter by.
For example,day will filter for activity that occurred in the past 24 hours,
and week will filter for activity that occurred in the past 7 days (168 hours).
Valid Values:

* day
* week
* month
* quarter
* year

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |false        |time_period|

#### **ActivityType**
The activity type to filter by.
For example,you can choose to filter by 'force_push', to see all force pushes to the repository.
Valid Values:

* push
* force_push
* branch_creation
* branch_deletion
* pr_merge
* merge_queue_merge

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[String]`|false   |named   |false        |activity_type|

#### **Context**
The context to run the command in. Used to get the details for the API call.
Can be either a string or a GitHubContext object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

---

### Notes
[List repository activities](https://docs.github.com/rest/repos/repos#list-repository-activities)

---

### Syntax
```PowerShell
Get-GitHubRepositoryActivity -Owner <String> -Repository <String> [-Direction <String>] [-PerPage <Int32>] [-Ref <String>] [-Actor <String>] [-TimePeriod <String>] [-ActivityType <String>] [-Context <Object>] [<CommonParameters>]
```
```PowerShell
Get-GitHubRepositoryActivity -Owner <String> -Repository <String> [-Direction <String>] [-PerPage <Int32>] [-Before <String>] [-After <String>] [-Ref <String>] [-Actor <String>] [-TimePeriod <String>] [-ActivityType <String>] [-Context <Object>] [<CommonParameters>]
```
