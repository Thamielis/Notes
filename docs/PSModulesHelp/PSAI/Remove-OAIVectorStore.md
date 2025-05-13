Remove-OAIVectorStore
---------------------

### Synopsis
Removes an OAI Vector Store.

---

### Description

The Remove-OAIVectorStore function removes an OAI (OpenAI) Vector Store by sending a DELETE request to the specified URI.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores/delete](https://platform.openai.com/docs/api-reference/vector-stores/delete)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-OAIVectorStore -VectorStoreId "12345"
Removes the OAI Vector Store with the ID "12345".
```

---

### Parameters
#### **VectorStoreId**
The ID of the Vector Store to be removed.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|true    |1       |true (ByPropertyName)|Id     |

---

### Syntax
```PowerShell
Remove-OAIVectorStore [-VectorStoreId] <Object> [<CommonParameters>]
```
