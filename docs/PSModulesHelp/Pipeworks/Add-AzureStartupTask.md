Add-AzureStartupTask
--------------------

### Synopsis
Adds a startup task to Azure

---

### Description

Adds a startup task to an azure service configuration, and packs some extra information into the XML to allow 
using ScriptBlock as startup tasks

---

### Related Links
* [Out-AzureService](Out-AzureService)

---

### Examples
> EXAMPLE 1

```PowerShell
New-AzureServiceDefinition -ServiceName "MyService" |
    Add-AzureStartupTask -ScriptBlock { "Hello World" } -Elevated -asString
```

---

### Parameters
#### **ServiceDefinition**
The Service Definition XML

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[XmlDocument]`|true    |named   |true (ByValue, ByPropertyName)|

#### **ToRole**
The role

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **CommandLine**
The command line to run

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **BatchScript**
The batch script to run

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ScriptBlock**
The ScriptBlock to run.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |named   |false        |

#### **Parameter**
The parameter to be passed to the script block

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |named   |false        |

#### **TaskType**
The task type.
Valid Values:

* Simple
* Background
* Foreground

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Elevated**
If set, the task will be run elevated

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsString**
If set, returns the service definition XML up to this point as a string

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
Add-AzureStartupTask -ServiceDefinition <XmlDocument> [-ToRole <String>] -CommandLine <String> [-TaskType <String>] [-Elevated] [-AsString] [<CommonParameters>]
```
```PowerShell
Add-AzureStartupTask -ServiceDefinition <XmlDocument> [-ToRole <String>] -BatchScript <String> [-TaskType <String>] [-Elevated] [-AsString] [<CommonParameters>]
```
```PowerShell
Add-AzureStartupTask -ServiceDefinition <XmlDocument> [-ToRole <String>] -ScriptBlock <ScriptBlock> [-Parameter <Hashtable>] [-TaskType <String>] [-Elevated] [-AsString] [<CommonParameters>]
```
