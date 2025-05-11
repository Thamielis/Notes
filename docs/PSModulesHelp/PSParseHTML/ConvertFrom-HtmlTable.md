ConvertFrom-HtmlTable
---------------------

### Synopsis

ConvertFrom-HtmlTable -Content <string> [-ReplaceContent <IDictionary>] [-ReplaceHeaders <IDictionary>] [-Engine <Object>] [-ReverseTable] [<CommonParameters>]

ConvertFrom-HtmlTable -Url <uri> [-ReplaceContent <IDictionary>] [-ReplaceHeaders <IDictionary>] [-Engine <Object>] [-ReverseTable] [<CommonParameters>]

---

### Description

---

### Parameters
#### **Content**

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[string]`|true    |Named   |true (ByValue, ByPropertyName)|

#### **Engine**

Valid Values:

* AngleSharp
* AgilityPack

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |Named   |false        |

#### **ReplaceContent**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |Named   |false        |

#### **ReplaceHeaders**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |Named   |false        |

#### **ReverseTable**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[switch]`|false   |Named   |false        |

#### **Url**

|Type   |Required|Position|PipelineInput|Aliases|
|-------|--------|--------|-------------|-------|
|`[uri]`|true    |Named   |false        |Uri    |

---

### Inputs
System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=ConvertFrom-HtmlTable; CommonParameters=True; parameter=System.Object[]}, @{name=ConvertFrom-HtmlTable; CommonParameters=True; parameter=System.Object[]}}
```
