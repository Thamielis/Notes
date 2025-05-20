Publish-PSMDStagedModule
------------------------

### Synopsis
Publish a module to your staging repository.

---

### Description

Publish a module to your staging repository.
Always publishes the latest version available when specifying a name.

---

### Examples
> EXAMPLE 1

```PowerShell
Publish-PSMDStagedModule -Name 'PSFramework'
Publishes the latest version of PSFramework found on the local machine.
```
> EXAMPLE 2

```PowerShell
Publish-PSMDStagedModule -Name 'Microsoft.Graph' -Repository PSGallery
Publishes the entire kit of 'Microsoft.Graph' modules from the PSGallery to the staging repository.
```

---

### Parameters
#### **Name**
The name of the module to publish.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Path**
The path to the module to publish.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Repository**
The repository from which to withdraw the module to then publish to the staging repository.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **EnableException**
This parameters disables user-friendly warnings and enables the throwing of exceptions.
This is less user friendly, but allows catching exceptions in calling scripts.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Publish-PSMDStagedModule -Name <String> [-Repository <String>] [-EnableException] [<CommonParameters>]
```
```PowerShell
Publish-PSMDStagedModule -Path <String> [-EnableException] [<CommonParameters>]
```
