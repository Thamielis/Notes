New-ContainerBuildScript
------------------------

### Synopsis
Generates a build script.

---

### Description

Generates a build script, from a template, that uses InvokeBuild and functionality available in this module.

---

### Examples
> EXAMPLE 1

```PowerShell
New-ContainerBuildScript -DockerfilePath ./Dockerfile -ImageName myimg  -ContainerRegistryType acr -Path ./build.ps1
Generates a build script in the current directory configured for building & publishing Bicep modules.
```

---

### Parameters
#### **DockerfilePath**
The path to the Dockerfile to be built

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ImageName**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ContainerRegistryType**
The type of container registry where the image will be published (acr, ghcr, docker or <blank>)
Valid Values:

* 
* acr
* docker
* ghcr

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **OutputPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Force**
When true, any existing file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-ContainerBuildScript [-DockerfilePath] <String> [-ImageName] <String> [-ContainerRegistryType] <String> [[-OutputPath] <String>] [-Force] [<CommonParameters>]
```
