Install-ModuleFromGitHub
------------------------

### Synopsis

Install-ModuleFromGitHub [[-GitHubRepo] <Object>] [[-Branch] <Object>] [[-ProjectUri] <Object>] [[-DestinationPath] <Object>] [[-SSOToken] <Object>] [[-moduleName] <Object>] [[-Scope] <string>] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Branch**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **DestinationPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **GitHubRepo**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |0       |false        |

#### **ProjectUri**

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |2       |true (ByPropertyName)|

#### **SSOToken**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **Scope**

Valid Values:

* CurrentUser
* AllUsers

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[string]`|false   |6       |false        |

#### **moduleName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

---

### Inputs
System.Object

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Install-ModuleFromGitHub; CommonParameters=True; parameter=System.Object[]}}
```
