Format-PSTable
--------------

### Synopsis
Formats a collection of objects into a table for display.

---

### Description

The Format-PSTable function takes a collection of objects and formats them into a table for easy display. It provides options to customize the output by selecting specific properties, excluding certain properties, and more.

---

### Examples
> EXAMPLE 1

```PowerShell
$data | Format-PSTable
Description:
Formats the $data collection into a table with default settings.
```
> EXAMPLE 2

```PowerShell
$data | Format-PSTable -Property Name, Age
Description:
Formats the $data collection into a table displaying only the 'Name' and 'Age' properties.
```
> EXAMPLE 3

```PowerShell
$data | Format-PSTable -ExcludeProperty ID
Description:
Formats the $data collection into a table excluding the 'ID' property.
```

---

### Parameters
#### **Object**
Specifies the collection of objects to format.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[ICollection]`|false   |1       |true (ByValue, ByPropertyName)|

#### **SkipTitle**
Indicates whether to skip displaying the title row in the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Property**
Specifies an array of property names to include in the table.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExcludeProperty**
Specifies an array of property names to exclude from the table.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **OverwriteHeaders**
Specifies an object to use as headers for the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **PreScanHeaders**
Indicates whether to pre-scan the object properties to determine headers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Splitter**
Specifies the delimiter to use when joining array values.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Syntax
```PowerShell
Format-PSTable [[-Object] <ICollection>] [-SkipTitle] [[-Property] <String[]>] [[-ExcludeProperty] <String[]>] [[-OverwriteHeaders] <Object>] [-PreScanHeaders] [[-Splitter] <String>] [<CommonParameters>]
```
