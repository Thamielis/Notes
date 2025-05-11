Out-AzureService
----------------

### Synopsis
Creates a an Azure Service Deployment pack, definition, and configuration file

---

### Description

Uses the Azure SDK tool CSPack to create a deployment package (cspkg) and associated deployment files.

---

### Related Links
* [New-AzureServiceDefinition](New-AzureServiceDefinition)

* [Publish-AzureService](Publish-AzureService)

---

### Parameters
#### **ServiceDefinition**
The Service DefinitionXML

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[XmlDocument]`|true    |1       |true (ByValue, ByPropertyName)|

#### **OutputPath**
The output directory for the azure service.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **SdkVersion**
If set, will look for a specific Azure SDK Version

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Version]`|false   |3       |false        |

#### **InstanceCount**
The number of instances to create

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |4       |false        |

#### **Os**
The operating system family
Valid Values:

* 2K8R2
* 2012

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Outputs
* [IO.FileInfo](https://learn.microsoft.com/en-us/dotnet/api/System.IO.FileInfo)

---

### Syntax
```PowerShell
Out-AzureService [-ServiceDefinition] <XmlDocument> [-OutputPath] <String> [[-SdkVersion] <Version>] [[-InstanceCount] <UInt32>] [[-Os] <String>] [<CommonParameters>]
```
