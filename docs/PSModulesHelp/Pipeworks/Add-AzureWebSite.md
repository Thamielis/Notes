Add-AzureWebSite
----------------

### Synopsis
Adds an Azure web site to a service definition.

---

### Description

Adds an Azure web site to a service definition.  

The site can bind to multiple host

Creates a web role if one does not exist.

---

### Related Links
* [New-AzureServiceDefinition](New-AzureServiceDefinition)

---

### Examples
> EXAMPLE 1

```PowerShell
New-AzureServiceDefinition -ServiceName "AService" |
    Add-AzureWebSite -SiteName "ASite" -PhysicalDirectory "C:\inetpub\wwwroot\asite" -HostHeader a.subdomain.com, nakeddomain.com, www.fulldomain.com -asString
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

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **SiteName**
The name of the site to create. If Sitename is not set, sites will be named Web1, Web2, Web3, etc

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **PhysicalDirectory**
The physical directory of the website.  This is where the web site files are located.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |4       |true (ByPropertyName)|

#### **HostHeader**
One or more host headers to use for the site

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Binding**
Additional bindings.  Each hashtable can contain an EndpointName, Name, and HostHeader

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[Hashtable[]]`|false   |6       |true (ByPropertyName)|

#### **VirtualDirectory**
Additional virtual directories.  
The keys will be the name of the virtual directories, and the values will be the physical directory on
the local machine.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |7       |true (ByPropertyName)|

#### **VirtualApplication**
Additional virtual applications.  
The keys will be the name of the virtual applications, and the values will be the physical directory on
the local machine.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |8       |true (ByPropertyName)|

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
|`[Object]`|false   |9       |false        |

#### **AsString**
If set, will return values as a string

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
Add-AzureWebSite [-ServiceDefinition] <XmlDocument> [[-ToRole] <String>] [[-SiteName] <String>] [[-PhysicalDirectory] <String>] [[-HostHeader] <String[]>] [[-Binding] <Hashtable[]>] [[-VirtualDirectory] <Hashtable>] [[-VirtualApplication] <Hashtable>] [[-VMSize] <Object>] [-AsString] [<CommonParameters>]
```
