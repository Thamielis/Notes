Invoke-PSMDBuildProject
-----------------------

### Synopsis
Execute a build project.

---

### Description

Execute a build project.
A build project is a configured chain of actions that have been configured in json.
They will be processed in their specified order and allow manageable, configurable steps without having to reinvent the same action again and again.

+ Individual action types become available using Register-PSMDBuildAction.
+ Create new build projects using New-PSMDBuildProject
+ Set up steps taken during a build using Set-PSMDBuildStep
+ Select the default build project using Select-PSMDBuildProject

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-PSMDBuildProject -Path .\VMDeployment.build.Json
Execute the build file "VMDeployment.build.json" from the current folder
```
> EXAMPLE 2

```PowerShell
build
Execute the default build project.
```

---

### Parameters
#### **Path**
The path to the build project file to execute.
Mandatory if no build project has been selected as the default project.
Use the Select-PSMDBuildProject to define a default project (and optionally persist the choice across sessions)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **InheritArtifacts**
Accept artifacts that were generated before ever executing this pipeline.
By default, any artifacts previously provisioned are cleared on pipeline start.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RetainArtifacts**
Whether, after executing the project, its artifacts should be retained.
By default, any artifacts created during a build project will be discarded upon project completion.
Artifacts are similar to variables to the pipeline and can be used to pass data throughout the pipeline.
+ Use Publish-PSMDBuildArtifact to create a new artifact.
+ Use Get-PSMDBuildArtifact to access existing build artifacts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-PSMDBuildProject [[-Path] <String>] [-InheritArtifacts] [-RetainArtifacts] [<CommonParameters>]
```
