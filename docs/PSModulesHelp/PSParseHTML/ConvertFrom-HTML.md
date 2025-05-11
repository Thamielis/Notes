ConvertFrom-HTML
----------------

### Synopsis
Converts HTML to PowerShell object that can be further digested in PowerShell

---

### Description

Converts HTML to PowerShell object that can be further digested in PowerShell.
To be used if ConvertTo-HTMLAttributes or ConvertTo-HTMLTable are not enough.

---

### Examples
Option 1 - uses Agility Pack

```PowerShell
$PageHTML = ConvertFrom-HTML -URL "https://www.evotec.xyz"
$PageHTML
```
Option 2 - uses AngleSharp

```PowerShell
$PageHTML = ConvertFrom-HTML -URL "https://www.evotec.xyz" -Engine AngleSharp
$PageHTML
```

---

### Parameters
#### **Content**
Provide HTML content to be converted to PowerShell object.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Url**
Provide URL to be converted to PowerShell object.

|Type   |Required|Position|PipelineInput|Aliases|
|-------|--------|--------|-------------|-------|
|`[Uri]`|true    |named   |false        |Uri    |

#### **Engine**
Define engin to be used for conversion. Options are AgilityPack and AngleSharp.
Both do similar stuff, but slightly in different way giving different PowerShell objects.
Default is AgilityPack.
Valid Values:

* AngleSharp
* AgilityPack

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **Raw**
Tells the function to return DocumentNode/DocumentElement instead of root object, which holds more information, that may not be nessecary for day to day use.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertFrom-HTML -Url <Uri> [-Engine <Object>] [-Raw] [<CommonParameters>]
```
```PowerShell
ConvertFrom-HTML -Content <String> [-Engine <Object>] [-Raw] [<CommonParameters>]
```
