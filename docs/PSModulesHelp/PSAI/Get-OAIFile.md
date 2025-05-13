Get-OAIFile
-----------

### Synopsis
Retrieves files from a specified URL.

---

### Description

The Get-OAIFile function retrieves files from a specified URL using the specified HTTP method. It supports filtering files based on the purpose parameter.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/files/list](https://platform.openai.com/docs/api-reference/files/list)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIFile -purpose fine-tune
Retrieves files from the specified URL with the purpose set to 'fine-tune'.
```

---

### Parameters
#### **purpose**
Specifies the purpose of the files to retrieve. Valid values are 'fine-tune', 'fine-tune-results', and 'assistants'.
Valid Values:

* fine-tune
* fine-tune-results
* assistants

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Raw**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-OAIFile [[-purpose] <Object>] [-Raw] [<CommonParameters>]
```
