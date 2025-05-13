Get-OAIVectorStoreFileBatch
---------------------------

### Synopsis
Retrieves information about a specific file batch in an OpenAI Vector Store.

---

### Description

The Get-OAIVectorStoreFileBatch function retrieves information about a specific file batch in an OpenAI Vector Store. It requires the VectorStoreId and BatchId parameters to identify the file batch.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores-file-batches/listFiles](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/listFiles)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIVectorStoreFileBatch -VectorStoreId "store1" -BatchId "batch1"
Retrieves information about the file batch with ID "batch1" in the Vector Store with ID "store1".
```

---

### Parameters
#### **VectorStoreId**
Specifies the ID of the Vector Store that contains the file batch.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **BatchId**
Specifies the ID of the file batch to retrieve information for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Get-OAIVectorStoreFileBatch [-VectorStoreId] <Object> [-BatchId] <Object> [<CommonParameters>]
```
