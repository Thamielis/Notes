New-HTMLPage
------------

### Synopsis
Creates a new HTML page with specified content, name, title, file path, and ID.

---

### Description

This function creates a new HTML page with the provided content and metadata. It generates a unique GUID for the page and stores it in the global schema. The function returns a custom object representing the page.

---

### Examples
> EXAMPLE 1

<body><h1>Hello, World!</h1></body></html>" } -Name "index" -Title "Welcome Page" -FilePath "C:\Pages\index.html" -ID "12345"
Creates a new HTML page with a simple "Hello, World!" content, named "index", titled "Welcome Page", saved at "C:\Pages\index.html", and with ID "12345".

---

### Parameters
#### **PageContent**
The script block containing the HTML content of the page.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Name**
The name of the HTML page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Title**
The title of the HTML page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **FilePath**
The file path where the HTML page will be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **ID**
The ID of the HTML page.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-HTMLPage [[-PageContent] <ScriptBlock>] [-Name] <String> [[-Title] <String>] [[-FilePath] <String>] [[-ID] <String>] [<CommonParameters>]
```
