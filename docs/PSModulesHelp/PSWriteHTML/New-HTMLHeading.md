New-HTMLHeading
---------------

### Synopsis
Creates a new HTML heading with customizable options.

---

### Description

This function generates an HTML heading based on the provided parameters such as heading level, text content, underline option, and color.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLHeading -Heading 'h1' -HeadingText 'Main Title' -Underline -Color 'blue'
Generates an HTML heading of level h1 with the text 'Main Title', underlined, and in blue color.
```
> EXAMPLE 2

```PowerShell
New-HTMLHeading -Heading 'h3' -HeadingText 'Sub Title' -Color 'green'
Generates an HTML heading of level h3 with the text 'Sub Title' in green color.
```

---

### Parameters
#### **Heading**
Specifies the level of the heading. Valid values are 'h1', 'h2', 'h3', 'h4', 'h5', 'h6'.
Valid Values:

* h1
* h2
* h3
* h4
* h5
* h6

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **HeadingText**
The text content to display within the heading.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Underline**
Indicates whether the heading should be underlined.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Color**
The color of the heading text.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

---

### Syntax
```PowerShell
New-HTMLHeading [[-Heading] <String>] [[-HeadingText] <String>] [-Underline] [[-Color] <String>] [<CommonParameters>]
```
