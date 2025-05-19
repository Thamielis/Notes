Publish-PSMDBuildArtifact
-------------------------

### Synopsis
Create a new artifact for the current build pipeline.

---

### Description

Create a new artifact for the current build pipeline.
Use this create artifacts that are accessible in later steps in the pipeline.

Usually, artifacts are deleted at the end of a build process.
They are always cleared at the beginning of a new one.

Artifacts are NOT persisted across PowerShell sessions.

---

### Examples
> EXAMPLE 1

```PowerShell
Publish-PSMDBuildArtifact -Name 'session' -Value $session -Tag 'pssession'
Publishes an artifact named "session" containing the content of $session that is tagged as a PowerShell remoting session.
```

---

### Parameters
#### **Name**
Name of the Artifact to create.
Technically there are no limits to which character to chose, but we strongly encourage restricting yourself to letters, numbers, dash, underscore and dot.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Value**
The value to assign to the artifact.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

#### **Tag**
Any tags to add to an artifact.
Tags can be searched for in order to bulk-operate against all artifacts of that tag.
For example, the "remove-pssession" action can remove all remoting sessions for all artifacts tagged as "pssession".

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

---

### Syntax
```PowerShell
Publish-PSMDBuildArtifact [-Name] <String> [-Value] <Object> [[-Tag] <String[]>] [<CommonParameters>]
```
