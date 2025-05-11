Publish-Deployment
------------------

### Synopsis
Publishes a deployment

---

### Description

Generates an Azure deployment package from a set of modules that will be deployed.

OR

Uploads a set of modules in a deployment to Blob Storage

---

### Related Links
* [Get-Deployment](Get-Deployment)

* [Add-Deployment](Add-Deployment)

* [Remove-Deployment](Remove-Deployment)

* [Import-Deployment](Import-Deployment)

---

### Examples
> EXAMPLE 1

```PowerShell
Publish-Deployment
```

---

### Parameters
#### **DeploymentDirectory**
The directory the deployment will be placed in.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DeploymentName**
The directory the deployment will be placed in.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Name**
The name of the modules to publish

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **Group**
The group of modules to publish

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExcludeGroup**
A list of groups to exclude.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

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

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **InstanceCount**
The instance count

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[UInt32]`|false   |named   |true (ByPropertyName)|

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
The buffer between jobs.  By default, 3 seconds

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[TimeSpan]`|false   |named   |false        |

#### **Os**
The operating system family
Valid Values:

* 2K8R2
* 2012

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **StorageAccount**
The Azure storage account

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **StorageKey**
The Azure storage key

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **ComputerName**
If set, will push a deployment to a list of computers via a LAN.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ToAzureVM**
If set, will publish a deployment to AzureVMs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Credential**
The name of the computers that will receive the deployment

|Type            |Required|Position|PipelineInput        |
|----------------|--------|--------|---------------------|
|`[PSCredential]`|true    |named   |true (ByPropertyName)|

#### **BatchSize**
The number of concurrent batches of remote jobs to run.   This should approximately be the number of remote shells allowed on the destination machines.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **SecureSetting**
The secure settings to copy to the remote machine.  Wildcards are permitted.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

* [Nullable](https://learn.microsoft.com/en-us/dotnet/api/System.Nullable)

---

### Syntax
```PowerShell
Publish-Deployment [-DeploymentDirectory <String>] [-DeploymentName <String>] [[-Name] <String[]>] [[-Group] <String[]>] [[-ExcludeGroup] <String[]>] [-VMSize <String>] [-InstanceCount <UInt32>] [-AsJob] [-Wait] [-Throttle <UInt32>] [-Buffer <TimeSpan>] [-Os <String>] [<CommonParameters>]
```
```PowerShell
Publish-Deployment [[-Name] <String[]>] [[-Group] <String[]>] [[-ExcludeGroup] <String[]>] [-AsJob] [-Wait] [-Throttle <UInt32>] [-Buffer <TimeSpan>] -StorageAccount <String> -StorageKey <String> [<CommonParameters>]
```
```PowerShell
Publish-Deployment [[-Name] <String[]>] [[-Group] <String[]>] [[-ExcludeGroup] <String[]>] [-AsJob] [-Wait] [-Throttle <UInt32>] [-Buffer <TimeSpan>] [-ComputerName <String[]>] -ToAzureVM -Credential <PSCredential> [-BatchSize <UInt32>] [-SecureSetting <String[]>] [<CommonParameters>]
```
```PowerShell
Publish-Deployment [[-Name] <String[]>] [[-Group] <String[]>] [[-ExcludeGroup] <String[]>] [-AsJob] [-Wait] [-Throttle <UInt32>] [-Buffer <TimeSpan>] -ComputerName <String[]> -Credential <PSCredential> [-SecureSetting <String[]>] [<CommonParameters>]
```
