Publish-AzureService
--------------------

### Synopsis
Publishes one or more modules as azure services

---

### Description

Publishes one or more modules as azure services, according to the DomainSchematic found in the Pipeworks manifest

---

### Related Links
* [Out-AzureService](Out-AzureService)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Module Pipeworks | 
    Publish-AzureService
```

---

### Parameters
#### **Name**
The name of the module

|Type        |Required|Position|PipelineInput                 |Aliases|
|------------|--------|--------|------------------------------|-------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|Module |

#### **VMSize**
The VMSize of the deployment
Valid Values:

* ExtraSmall
* Small
* Medium
* Large
* Extra-Large
* XS
* XL
* S
* M
* L

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DeploymentName**
The name of the deployment

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DeploymentDirectory**
The directory the deployment will be placed in

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CleanupAfterDeployment**
If set, deletes local deployments after packaging.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **InstanceCount**
The instance count

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **AsJob**
If set, will publish items in a background job

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Wait**
If set, will wait for all jobs to complete

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Throttle**
The throttle for background jobs.  By default, 10

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Buffer**
The buffer between jobs.  By default, 5.5 seconds

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Os**
The operating system family
Valid Values:

* 2K8R2
* 2012

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

---

### Syntax
```PowerShell
Publish-AzureService [-Name] <String[]> [-VMSize <String>] [-DeploymentName <String>] [-DeploymentDirectory <String>] [-CleanupAfterDeployment] [-InstanceCount <UInt32>] [-AsJob] [-Wait] [-Throttle <UInt32>] [-Buffer <TimeSpan>] [-Os <String>] [<CommonParameters>]
```
