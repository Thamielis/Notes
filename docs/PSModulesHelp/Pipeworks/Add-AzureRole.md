Add-AzureRole
-------------

### Synopsis
Adds and azure role to a service definition

---

### Description

Adds an azure role to a service definition

---

### Related Links
* [New-AzureServiceDefinition](New-AzureServiceDefinition)

---

### Examples
> EXAMPLE 1

```PowerShell
New-AzureServiceDefinition -ServiceName AService |
    Add-AzureRole -RoleName MyWebRole -VMSize Large -RoleType Web -AsString
```

---

### Parameters
#### **ServiceDefinition**
The Service Definition

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[XmlDocument]`|true    |1       |true (ByValue, ByPropertyName)|

#### **RoleName**
The name of the role

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **VMSize**
The VMSize
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
|`[String]`|false   |3       |false        |

#### **DisableNativeCodeExecution**
If set, will disable native code execution on the role.  This will prevent PHP or other CGI from working

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsString**
If set, will output as a string

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RoleType**
The type of the role.
Valid Values:

* Web
* Worker
* VirtualMachine
* VM

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

---

### Outputs
* [Xml.XmlDocument](https://learn.microsoft.com/en-us/dotnet/api/System.Xml.XmlDocument)

* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Add-AzureRole [-ServiceDefinition] <XmlDocument> [-RoleName] <String> [[-VMSize] <String>] [-DisableNativeCodeExecution] [-AsString] [[-RoleType] <String>] [<CommonParameters>]
```
