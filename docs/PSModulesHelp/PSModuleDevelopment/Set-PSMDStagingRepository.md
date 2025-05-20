Set-PSMDStagingRepository
-------------------------

### Synopsis
Define the repository to use for deploying modules along with scripts.

---

### Description

Define the repository to use for deploying modules along with scripts.
By default, modules are deployed using the PSGallery, which may be problematic:
- Offline computers do not have access to it
- Low performance compared to a local mirror

---

### Examples
> EXAMPLE 1

```PowerShell
Set-PSMDStagingRepository -Path 'C:\PowerShell\StagingRepo'
Registers the local path 'C:\PowerShell\StagingRepo' as a repository and will use it for deploying modules along with scripts.
```

---

### Parameters
#### **Path**
The local path to use. Will configure that path as a PSRepository.
The new repository will be named "PSMDStaging".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Repository**
The name of an existing repository to use

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

---

### Syntax
```PowerShell
Set-PSMDStagingRepository -Path <String> [<CommonParameters>]
```
```PowerShell
Set-PSMDStagingRepository -Repository <String> [<CommonParameters>]
```
