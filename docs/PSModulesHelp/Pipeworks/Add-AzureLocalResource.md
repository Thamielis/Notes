Add-AzureLocalResource
----------------------

### Synopsis
Adds an Azure local storage resource to a service definition

---

### Description

Adds an Azure local storage resource to a service definition.  

Azure local storage can create well-known directories on the host machine

---

### Related Links
* [New-AzureServiceDefinition](New-AzureServiceDefinition)

---

### Examples
> EXAMPLE 1

```PowerShell
New-AzureServiceDefinition -ServiceName "foo" |
    Add-AzureLocalResource -ServiceDefinition
```

---

### Parameters
#### **ServiceDefinition**
The ServiceDefinition XML.  This should be created with New-AzureServiceDefinition or retreived with Import-AzureServiceDefinition

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[XmlDocument]`|true    |1       |true (ByValue, ByPropertyName)|

#### **ToRole**
If set, the local resource will only apply to the role named ToRole.  If ToRole is not found, or doesn't
exist, the last role will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Name**
The name of the local storage.  This will be the path of the name storage element, relative to the root drive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Size**
The size of the storage.  Sizes will be rounded up to the nearest megabyte.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |4       |false        |

#### **DoNotcleanOnRoleRecycle**
If set, a role will not be cleaned on recycle

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsString**
If set, will output results as string rather than XML

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Add-AzureLocalResource [-ServiceDefinition] <XmlDocument> [[-ToRole] <String>] [-Name] <String> [[-Size] <Int64>] [-DoNotcleanOnRoleRecycle] [-AsString] [<CommonParameters>]
```
