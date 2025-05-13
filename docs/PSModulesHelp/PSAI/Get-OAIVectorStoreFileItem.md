Get-OAIVectorStoreFileItem
--------------------------

### Synopsis
Retrieves a specific file item from an OpenAI Vector Store.

---

### Description

The Get-OAIVectorStoreFileItem function retrieves a specific file item from an OpenAI Vector Store based on the provided VectorStoreId and FileId.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores-files/getFile](https://platform.openai.com/docs/api-reference/vector-stores-files/getFile)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIVectorStoreFileItem -VectorStoreId "12345" -FileId "67890"
Retrieves the file item with the ID "67890" from the Vector Store with the ID "12345".
```

---

### Parameters
#### **VectorStoreId**
The ID of the Vector Store from which to retrieve the file item. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **FileId**
The ID of the file item to retrieve. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Get-OAIVectorStoreFileItem [-VectorStoreId] <Object> [-FileId] <Object> [<CommonParameters>]
```
