Invoke-GPOZaurrContent
----------------------

### Synopsis
Invokes GPOZaurrContent function to retrieve Group Policy Objects information.

---

### Description

This function retrieves Group Policy Objects information based on the specified parameters. It can search for GPOs in a forest, exclude specific domains, include specific domains, and provide extended forest information.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GPOZaurrContent -Forest "Contoso" -IncludeDomains "Domain1", "Domain2" -Type "Security" -OutputType "HTML" -OutputPath "C:\Reports\GPOReport.html"
Retrieves security-related Group Policy Objects information for the specified domains and saves the output as an HTML file.
```
> EXAMPLE 2

```PowerShell
Invoke-GPOZaurrContent -GPOPath "CN={31B2F340-016D-11D2-945F-00C04FB984F9},CN=Policies,CN=System,DC=Contoso,DC=com" -Type "All" -OutputType "Object"
Retrieves all information for a specific Group Policy Object and outputs the result as an object.
```

---

### Parameters
#### **Forest**
Specifies the forest name to search for Group Policy Objects.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **ExtendedForestInformation**
Specifies additional information about the forest.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **GPOPath**
Specifies the path to a specific Group Policy Object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**
Specifies the type of information to retrieve.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Splitter**
Specifies the delimiter to use for splitting information.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **FullObjects**
Indicates whether to retrieve full objects.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **OutputType**
Specifies the type of output (HTML or Object).
Valid Values:

* HTML
* Object

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **OutputPath**
Specifies the path to save the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Open**
Indicates whether to open the output after retrieval.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Online**
Indicates whether to retrieve information online.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CategoriesOnly**
Indicates whether to retrieve only categories.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SingleObject**
Indicates whether to retrieve a single object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipNormalize**
Indicates whether to skip normalization.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipCleanup**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Extended**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GPOName**

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |named   |false        |Name   |

#### **GPOGUID**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

---

### Syntax
```PowerShell
Invoke-GPOZaurrContent [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-ExtendedForestInformation <IDictionary>] [-Type <String[]>] [-Splitter <String>] [-FullObjects] [-OutputType <String[]>] [-OutputPath <String>] [-Open] [-Online] [-CategoriesOnly] [-SingleObject] [-SkipNormalize] [-SkipCleanup] [-Extended] [-GPOName <String[]>] [-GPOGUID <String[]>] [<CommonParameters>]
```
```PowerShell
Invoke-GPOZaurrContent [-GPOPath <String>] [-Type <String[]>] [-Splitter <String>] [-FullObjects] [-OutputType <String[]>] [-OutputPath <String>] [-Open] [-Online] [-CategoriesOnly] [-SingleObject] [-SkipNormalize] [-SkipCleanup] [-Extended] [<CommonParameters>]
```
