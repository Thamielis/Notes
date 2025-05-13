Get-OAIFileItem
---------------

### Synopsis
Retrieves information about a file from the OpenAI API.

---

### Description

The Get-OAIFileItem function retrieves information about a file from the OpenAI API by providing the file ID.

---

### Related Links
* [https://beta.openai.com/docs/api-reference/files/retrieve](https://beta.openai.com/docs/api-reference/files/retrieve)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIFileItem -FileId "abc123"
Retrieves information about the file with the ID "abc123" from the OpenAI API.
```

---

### Parameters
#### **FileId**
The ID of the file to retrieve information for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-OAIFileItem [-FileId] <Object> [<CommonParameters>]
```
