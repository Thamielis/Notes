Remove-OAIVectorStoreFile
-------------------------

### Synopsis
Removes a file from a vector store.

---

### Description

The Remove-OAIVectorStoreFile function removes a file from a vector store specified by the VectorStoreId and FileId parameters.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores-files/deleteFile](https://platform.openai.com/docs/api-reference/vector-stores-files/deleteFile)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-OAIVectorStoreFile -VectorStoreId "12345" -FileId "67890"
Removes the file with ID "67890" from the vector store with ID "12345".
```

---

### Parameters
#### **VectorStoreId**
The ID of the vector store from which the file will be removed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **FileId**
The ID of the file to be removed from the vector store.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Remove-OAIVectorStoreFile [-VectorStoreId] <Object> [-FileId] <Object> [<CommonParameters>]
```
