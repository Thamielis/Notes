Remove-OAIFile
--------------

### Synopsis
Removes a file from the OpenAPI server.

---

### Description

The Remove-OAIFile function removes a file from the OpenAPI server using the specified file ID.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/files/delete](https://platform.openai.com/docs/api-reference/files/delete)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-OAIFile -id "12345"
This example removes the file with the ID "12345" from the OpenAPI server.
```

---

### Parameters
#### **id**
The ID of the file to be removed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|

---

### Syntax
```PowerShell
Remove-OAIFile [[-id] <Object>] [<CommonParameters>]
```
