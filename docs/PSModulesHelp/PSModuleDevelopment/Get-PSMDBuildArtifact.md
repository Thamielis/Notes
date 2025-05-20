Get-PSMDBuildArtifact
---------------------

### Synopsis
Retrieve an artifact during a build project's execution.

---

### Description

Retrieve an artifact during a build project's execution.
These artifacts are usually created during such an execution and discarded once completed.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSMDBuildArtifact
List all available artifacts.
```
> EXAMPLE 2

```PowerShell
Get-PSMDBuildArtifact -Name ReleasePath
Returns the artifact named "ReleasePath"
```
> EXAMPLE 3

```PowerShell
Get-PSMDBuildArtifact -Tag pssession
Returns all artifacts with the tag "pssession"
```

---

### Parameters
#### **Name**
The name by which to search for artifacts.
Defaults to '*'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Tag**
Search for artifacts by tag.
Artifacts can receive tag for better categorization.
When specifying multiple tags, any artifact containing at least one of them will be returned.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

---

### Syntax
```PowerShell
Get-PSMDBuildArtifact [[-Name] <String>] [[-Tag] <String[]>] [<CommonParameters>]
```
