Add-AzureSetting
----------------

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
New-AzureServiceDefinition -ServiceName MyService | 
    Add-AzureSetting -Name MySetting -Value MyValue -AsString
```

---

### Parameters
#### **ServiceDefinition**
The ServiceDefinition XML.  This should be created with New-AzureServiceDefinition or retreived with Import-AzureServiceDefinition

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[XmlDocument]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Name**
The name of the setting to configure

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Value**
The value to us for the setting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **Setting**
A table of names and values for Azure settings

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|true    |named   |false        |

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
Add-AzureSetting -ServiceDefinition <XmlDocument> -Name <String> -Value <String> [-AsString] [<CommonParameters>]
```
```PowerShell
Add-AzureSetting -ServiceDefinition <XmlDocument> -Setting <Hashtable> [-AsString] [<CommonParameters>]
```
