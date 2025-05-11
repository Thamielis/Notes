ConvertTo-CascadingStyleSheets
------------------------------

### Synopsis
Converts a hashtable of CSS properties into Cascading Style Sheets (CSS) format.

---

### Description

The ConvertTo-CascadingStyleSheets function takes a hashtable of CSS properties and converts them into a CSS stylesheet format. It organizes the properties into selectors and declarations, ready to be used in styling HTML elements.

---

### Examples
> EXAMPLE 1

```PowerShell
$CssProperties = @{
    'color' = 'blue'
    'font-size' = '16px'
    'font-family' = 'Arial'
}
ConvertTo-CascadingStyleSheets -Css $CssProperties -Name '.myClass' -Comment 'Custom styles for myClass'

Converts the hashtable of CSS properties into a CSS stylesheet with the selector '.myClass' and a custom comment.
```
> EXAMPLE 2

```PowerShell
$CssProperties = @{
    'background-color' = 'lightblue'
    'border' = @{
        'style' = 'solid'
        'width' = '1px'
        'color' = 'black'
    }
}
ConvertTo-CascadingStyleSheets -Css $CssProperties -Name '#myDiv' -WithTags

Converts the CSS properties into a CSS stylesheet with the selector '#myDiv' and includes CSS style tags.
```

---

### Parameters
#### **Css**
Specifies the hashtable of CSS properties to be converted.

|Type           |Required|Position|PipelineInput                 |
|---------------|--------|--------|------------------------------|
|`[IDictionary]`|false   |1       |true (ByValue, ByPropertyName)|

#### **Name**
Specifies the name of the CSS selector to be used in the stylesheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Comment**
Specifies an optional comment to be included in the CSS stylesheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **WithTags**
Indicates whether to include CSS style tags around the generated CSS content. Default is false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
ConvertTo-CascadingStyleSheets [[-Css] <IDictionary>] [[-Name] <String>] [[-Comment] <String>] [-WithTags] [<CommonParameters>]
```
