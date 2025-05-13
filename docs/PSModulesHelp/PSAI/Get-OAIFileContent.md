Get-OAIFileContent
------------------

### Synopsis
Retrieves the content of a file from the OpenAI API.

---

### Description

The Get-OAIFileContent function retrieves the content of a file from the OpenAI API using the specified FileId. The content can be returned as plain text or in a specified content type. Optionally, the content can be saved to a file.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/files/retrieve-contents](https://platform.openai.com/docs/api-reference/files/retrieve-contents)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIFileContent -FileId "abc123" -ContentType "application/json" -OutFile "C:\output.json"
Retrieves the content of the file with ID "abc123" from the OpenAI API as JSON and saves it to "C:\output.json".
```

---

### Parameters
#### **FileId**
The ID of the file to retrieve the content from.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **ContentType**
The type of content to retrieve. The default value is "text/plain".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **OutFile**
The path to save the content to. If specified, the content will be saved to the specified file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Get-OAIFileContent [-FileId] <Object> [[-ContentType] <Object>] [[-OutFile] <Object>] [<CommonParameters>]
```
