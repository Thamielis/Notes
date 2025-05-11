New-AzureServiceDefinition
--------------------------

### Synopsis
Creates a new Azure Service Definition XML

---

### Description

Creates a new Azure Service Definition XML.  
Additional commands are used to modify the XML's settings

---

### Related Links
* [Add-AzureRole](Add-AzureRole)

* [Add-AzureStartupTask](Add-AzureStartupTask)

* [Add-AzureWebSite](Add-AzureWebSite)

* [Add-AzureLocalResource](Add-AzureLocalResource)

---

### Examples
> EXAMPLE 1

```PowerShell
New-AzureServiceDefinition -ServiceName TestService |
    Add-AzureWebSite -HostHeader www.testsite.com -PhysicalDirectory 'C:\inetpub\wwwroot\testsite'
```

---

### Parameters
#### **ServiceName**
Required. The name of the service. The name must be unique within the service account.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **UpgradeDomainCount**
Optional. Specifies the number of upgrade domains across which roles in this service are allocated.
Role instances are allocated to an upgrade domain when the service is deployed. For more information, 
see "How to Perform In-Place Upgrades" on MSDN.
You can specify up to 5 upgrade domains. If not specified, the default number of upgrade domains is 5.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |false        |

#### **AsString**
If set, will output the XML as text.  If this is not set, an XmlElement is returned.

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
New-AzureServiceDefinition [-ServiceName] <String> [[-UpgradeDomainCount] <Int32>] [-AsString] [<CommonParameters>]
```
