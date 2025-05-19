New-PSMDBuildProject
--------------------

### Synopsis
Create a new build project file.

---

### Description

Create a new build project file.
Build projects are used to configure a repeatable, managed set of steps that make up a workflow.
It is designed with software build processes in mind, but can be used for pretty much anything that works in separate steps.

See the help on Invoke-PSMDBuildProject for more details.

NOTE: This is not the tool or component to create new PowerShell _code_ projects / repositories!
To create a new PowerShell module project, instead run:

	Invoke-PSMDTemplate PSFProject

---

### Examples
> EXAMPLE 1

```PowerShell
New-PSMDBuildProject -Name 'VMDeployment' -Path 'C:\Code\VMDeployment'
Create a new build project named 'VMDeployment' in the folder 'C:\Code\VMDeployment'
```

---

### Parameters
#### **Name**
The name of the build project.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Path**
The path to the folder in which the build project file is created.
Final path will be: "<Path>\<Name>.build.json"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Condition**
A condition - a filter expression - that must be met in order for the build to proceed.
For more details on filter conditions, see the PSFramework documentation on its feature:
https://psframework.org/documentation/documents/psframework/filters.html

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConditionSet**
The name of the condition set to use.
This is part of the PSFramework filter system:
https://psframework.org/documentation/documents/psframework/filters.html
Specify as "<module> <conditionsetname>" format.
Default Value: PSFramework Environment

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NoSelect**
Do not select the newly created build project as the default project for the current session.
By default, the newly created build project will be set as default project, in order to facilitate adding steps to it.
Use Select-PSMDBuildProject to explicitly set a default project file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Register**
Persist the newly created build project as default build project beyond the current session.
By default, the newly created build project will already be set as default project, in order to facilitate adding steps to it.
But ONLY for the current session. This parameter makes it remember in new PowerShell sessions as well.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-PSMDBuildProject -Name <String> -Path <String> [-Condition <String>] [-ConditionSet <String>] [<CommonParameters>]
```
```PowerShell
New-PSMDBuildProject -Name <String> -Path <String> [-Condition <String>] [-ConditionSet <String>] [-NoSelect] [<CommonParameters>]
```
```PowerShell
New-PSMDBuildProject -Name <String> -Path <String> [-Condition <String>] [-ConditionSet <String>] [-Register] [<CommonParameters>]
```
