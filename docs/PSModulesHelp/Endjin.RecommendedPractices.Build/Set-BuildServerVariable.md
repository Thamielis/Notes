Set-BuildServerVariable
-----------------------

### Synopsis
Abstracts sending formatted log messages to build servers to set build variables.

---

### Description

Identifies the current build server using well-known environmnent variables and outputs correctly formatted
log messages that will set variables within the build server context. Currently supports Azure Pipelines and
GitHub Actions.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-BuildServerVariable -Name "MyVar" -Value "foo"
Sets a build variable called 'MyVar' with the value of "foo".
```

---

### Parameters
#### **Name**
The name of the variable to set on the build server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Value**
The value of the variable to set on the build server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Set-BuildServerVariable [-Name] <String> [-Value] <Object> [<CommonParameters>]
```
