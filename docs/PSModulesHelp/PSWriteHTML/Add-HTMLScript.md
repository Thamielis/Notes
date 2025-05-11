Add-HTMLScript
--------------

### Synopsis
Adds JavaScript content to the HTML body.

---

### Description

This function adds JavaScript content to the HTML body by including JavaScript code from files, strings, or links. It allows customization of the placement of JavaScript content within the HTML document.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-HTMLScript -Placement 'Header' -Resource 'MyScript' -ResourceComment 'Script for functionality X' -Link 'https://example.com/script.js'
Adds an external JavaScript file 'script.js' to the header of the HTML document with a specified comment.
```
> EXAMPLE 2

```PowerShell
Add-HTMLScript -Placement 'Footer' -Resource 'CustomScript' -ResourceComment 'Custom script for feature Y' -Content 'function myFunction() { // code here }'
Adds custom JavaScript content to the footer of the HTML document with a specified comment.
```
> EXAMPLE 3

```PowerShell
Add-HTMLScript -Placement 'Inline' -Resource 'InlineScript' -ResourceComment 'Inline script for page Z' -FilePath 'C:\Scripts\inline.js' -ReplaceData @{ 'placeholder' = 'replacement' }
Adds JavaScript code from a file 'inline.js' to be included inline in the HTML document with specified replacements.
```

---

### Parameters
#### **Placement**
Specifies where the JavaScript content should be placed in the HTML document. Valid values are 'Inline', 'Header', or 'Footer'. Default is 'Header'.
Valid Values:

* Inline
* Header
* Footer

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Resource**
Specifies the resource containing the JavaScript content.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |2       |false        |

#### **ResourceComment**
Specifies a comment to be included with the JavaScript content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Link**
Specifies an array of URLs to external JavaScript files to be included.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **Content**
Specifies an array of JavaScript content as strings to be included.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |false        |

#### **FilePath**
Specifies an array of file paths containing JavaScript code to be included.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |6       |false        |

#### **ReplaceData**
Specifies a dictionary of key-value pairs to replace in the JavaScript code.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |7       |false        |

#### **AddComments**
Indicates whether to add comments around the JavaScript content. By default, comments are not added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipTags**
Indicates whether to skip adding script tags around the JavaScript content. By default, script tags are added.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Add-HTMLScript [[-Placement] <String>] [[-Resource] <IDictionary>] [[-ResourceComment] <String>] [[-Link] <String[]>] [[-Content] <String[]>] [[-FilePath] <String[]>] [[-ReplaceData] <IDictionary>] [-AddComments] [-SkipTags] [<CommonParameters>]
```
