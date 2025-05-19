Set-PSMDBuildStep
-----------------

### Synopsis
Create or update a step from a build project.

---

### Description

Create or update a step from a build project.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-PSMDBuildStep -Name 'Create Session' -Action new-pssession -Parameters @{ VMName = 'labdc1'; CredentialPath = "%ProjectRoot%\creds\labdc1.cred";  }
Defines a new step named 'Create Session' using the 'new-pssession'-action.
```

---

### Parameters
#### **Name**
The name of the step.
All step names must be unique within a single build project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Weight**
The weight of the step.
Weight determines processing order, the lower the number the earlier it is executed.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **Action**
The name of the action to execute.
Use Get-PSMDBuildAction to get a list of available actions.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Parameters**
The parameters this action should take.
See the action object to see a description of parameters, including which must be provided and which can be skipped.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |4       |false        |

#### **Condition**
A PSFramework filter condition that must apply for this action to be executed successfully.
Example Conditions:
  Elevated
  PS7Plus -and OSWindows
More Details: https://psframework.org/documentation/documents/psframework/filters.html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ConditionSet**
The name of the condition set to use.
This is part of the PSFramework filter system:
https://psframework.org/documentation/documents/psframework/filters.html
Specify as "<module> <conditionsetname>" format.
Default Value: PSFramework Environment

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **Dependency**
Any other steps that must successfully finished in order for this step to execute.
ALL of the listed steps must have succeeded, skipped steps do not count.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |7       |false        |

#### **BuildProject**
The build project file to work against.
Specify the full path to the build project file.
This parameter can be skipped if a default project file has been defined.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

---

### Syntax
```PowerShell
Set-PSMDBuildStep [-Name] <String> [[-Weight] <Int32>] [[-Action] <String>] [[-Parameters] <Hashtable>] [[-Condition] <String>] [[-ConditionSet] <String>] [[-Dependency] <String[]>] [[-BuildProject] <String>] [<CommonParameters>]
```
