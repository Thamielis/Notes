Write-Ajax
----------

### Synopsis
Writes AJAX

---

### Description

Writes AJAX.  This will execute the URL and replace the contents of
the HTML element with the ID $updateId with the contents of the returned document

---

### Related Links
* [New-WebPage](New-WebPage)

---

### Parameters
#### **Url**
The URL that will return updated contents

|Type   |Required|Position|PipelineInput        |
|-------|--------|--------|---------------------|
|`[Uri]`|true    |1       |true (ByPropertyName)|

#### **Method**
The method to use for the request
Valid Values:

* GET
* POST

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **UpdateId**
The ID to automatically update

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **InputQuery**
One or more input query values.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **InputId**
The InputIDs the provide the query values.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |5       |true (ByPropertyName)|

#### **Name**
The name of the generated function.  If this is not provided, it will be set automatically from the URL

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **PostData**
Any post data

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **UpdateProperty**
The Property to update on the update element

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **IncludeScriptTag**
If set, will output the ajax chunk in a <script> tag </script>

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Escape**
If set, will escape the output content.  
If generating web pages with Write-Ajax to display to the user, instead of run in the browser, use -Escape

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhenResultReceived**
Runs one or more javascript functions when an ajax call completes, but before the property is set

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |9       |false        |

#### **WhenRequestMade**
Runs one or more javascript functions when an ajax call is made

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |10      |false        |

#### **BeforeRequestMade**
Runs one or more javascript functions when before an ajax call is made

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |11      |false        |

#### **ThenRun**
Runs one or more javascript functions when an ajax call completes and has set a property

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |12      |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Write-Ajax [-Url] <Uri> [[-Method] <String>] [-UpdateId] <String> [[-InputQuery] <String[]>] [[-InputId] <String[]>] [[-Name] <String>] [[-PostData] <String>] [[-UpdateProperty] <String>] [-IncludeScriptTag] [-Escape] [[-WhenResultReceived] <String[]>] [[-WhenRequestMade] <String[]>] [[-BeforeRequestMade] <String[]>] [[-ThenRun] <String[]>] [<CommonParameters>]
```
