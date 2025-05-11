Get-GPOZaurrLinkSummary
-----------------------

### Synopsis
Retrieves a summary of GPO links based on specified criteria.

---

### Description

This function retrieves a summary of GPO links based on the provided parameters. It categorizes the links into different types and provides detailed information about each link.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrLinkSummary -Forest "Contoso" -IncludeDomains "Domain1", "Domain2" -Report "MultipleLinks"
Retrieves a summary of GPO links for the specified forest and included domains, focusing on multiple links.
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrLinkSummary -Forest "Fabrikam" -ExcludeDomains "Domain3" -Report "OneLink"
Retrieves a summary of GPO links for the specified forest excluding Domain3, focusing on a single link.
```

---

### Parameters
#### **Report**
Specifies the type of report to generate. Valid values are 'All', 'MultipleLinks', 'OneLink', and 'LinksSummary'. Default is 'All'.
Valid Values:

* All
* MultipleLinks
* OneLink
* LinksSummary

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **UnlimitedProperties**
Indicates whether to include unlimited properties in the report.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Forest**
Specifies the forest name to retrieve GPO links from.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |2       |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the report.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the report.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |4       |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |5       |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrLinkSummary [[-Report] <String[]>] [-UnlimitedProperties] [[-Forest] <String>] [[-ExcludeDomains] <String[]>] [[-IncludeDomains] <String[]>] [[-ExtendedForestInformation] <IDictionary>] [<CommonParameters>]
```
