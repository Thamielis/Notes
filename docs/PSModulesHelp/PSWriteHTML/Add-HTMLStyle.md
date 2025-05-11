Add-HTMLStyle
-------------

### Synopsis
Adds CSS styles to HTML documents.

---

### Description

The Add-HTMLStyle function allows you to add CSS styles to HTML documents in various ways such as inline styles, external stylesheets, and content from files or strings.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-HTMLStyle -Placement 'Header' -Resource 'styles.css' -ResourceComment 'Custom styles' -Link 'https://example.com/styles.css'
Adds a linked CSS stylesheet to the header of the HTML document with a custom comment.
```
> EXAMPLE 2

```PowerShell
Add-HTMLStyle -Placement 'Inline' -Content 'body { background-color: lightblue; }' -ResourceComment 'Inline styles'
Adds inline CSS styles directly to the HTML document body with a custom comment.
```
> EXAMPLE 3

```PowerShell
Add-HTMLStyle -Placement 'Footer' -Css @{ 'body' = @{ 'background-color' = 'lightblue' } } -ResourceComment 'Custom CSS'
Converts a hashtable of CSS styles to a stylesheet and adds it to the footer of the HTML document with a custom comment.
```

---

### Parameters
#### **Placement**
Specifies where the CSS styles should be placed in the HTML document. Valid values are 'Inline', 'Header', or 'Footer'. Default is 'Header'.
Valid Values:

* Inline
* Header
* Footer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Resource**
Specifies the resource to be added as CSS styles.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |2       |false        |

#### **ResourceComment**
Specifies a comment for the resource being added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Link**
Specifies an array of URLs to external CSS stylesheets to be linked in the HTML document.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **Content**
Specifies an array of CSS content to be added directly to the HTML document.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **FilePath**
Specifies an array of file paths containing CSS content to be added to the HTML document.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **Css**
Specifies a hashtable of CSS styles to be converted and added to the HTML document.

|Type           |Required|Position|PipelineInput|Aliases  |
|---------------|--------|--------|-------------|---------|
|`[IDictionary]`|false   |7       |false        |CssInline|

#### **ReplaceData**
Specifies a hashtable of data to be replaced in the CSS content.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |8       |false        |

#### **AddComment**
Switch parameter to add comments around the added CSS styles.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RelType**
Specifies the relationship type for linked stylesheets. Valid values are 'dns-prefetch', 'preconnect', or 'preload'. Default is 'preload'.
Valid Values:

* dns-prefetch
* preconnect
* preload

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **SkipTags**
Switch parameter to skip adding HTML tags when inserting CSS content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Add-HTMLStyle [[-Placement] <String>] [[-Resource] <IDictionary>] [[-ResourceComment] <String>] [[-Link] <String[]>] [[-Content] <String[]>] [[-FilePath] <String[]>] [[-Css] <IDictionary>] [[-ReplaceData] <IDictionary>] [-AddComment] [[-RelType] <String>] [-SkipTags] [<CommonParameters>]
```
