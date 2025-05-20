Resolve-PSMDBuildStepParameter
------------------------------

### Synopsis
Resolves and consolidates the overall parameters of a given step.

---

### Description

Resolves and consolidates the overall parameters of a given step.
This ensures that individual actions do not have to implement manual resolution and complex conditionals.
Sources of parameters:
- Explicitly defined parameter in the step
- Value from Artifacts
- Value from Configuration (only if not otherwise sourced)
- Value from implicit artifact resolution: Any value that is formatted like this:
  "%!NameOfArtifact!%" will be replaced with the value of the artifact of the same name.
  This supports wildcard resolution, so "%!Session.*!%" will resolve to all artifacts with a name starting with "Session."

Configuration-driven parameters follow this name scheme:
"PSModuleDevelopment.BuildParam.<project>.<step>.<parameterName>"

For example:
"PSModuleDevelopment.BuildParam.Admf.connect.credential"

---

### Examples
> EXAMPLE 1

```PowerShell
Resolve-PSMDBuildStepParameter -Parameters $actualParameters -ProjectName VMDeployment -StepName 'Create Session'
Adds parameters provided through configuration.
```

---

### Parameters
#### **Parameters**
The hashtable containing the currently specified parameters from the step configuration within the build project file.
Only settings not already defined there are taken from configuration.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|true    |1       |false        |

#### **FromArtifacts**
The hashtable mapping parameters from artifacts.
This allows dynamically assigning artifacts to parameters.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|true    |2       |false        |

#### **ProjectName**
The name of the project being executed.
Supplementary parameters taken from configuration will pick up settings based on this name:
"PSModuleDevelopment.BuildParam.<ProjectName>.<StepName>.*"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **StepName**
The name of the step being executed.
Supplementary parameters taken from configuration will pick up settings based on this name:
"PSModuleDevelopment.BuildParam.<ProjectName>.<StepName>.*"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |4       |false        |

---

### Outputs
* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
Resolve-PSMDBuildStepParameter [-Parameters] <Hashtable> [-FromArtifacts] <Hashtable> [-ProjectName] <String> [-StepName] <String> [<CommonParameters>]
```
