Stop-OAIVectorStoreFileBatch
----------------------------

### Synopsis
Stops a batch of files in an OpenAI Vector Store.

---

### Description

The Stop-OAIVectorStoreFileBatch function is used to stop a batch of files in an OpenAI Vector Store. It cancels the processing of the specified batch of files.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores-file-batches/cancelBatch](https://platform.openai.com/docs/api-reference/vector-stores-file-batches/cancelBatch)

---

### Examples
> EXAMPLE 1

```PowerShell
Stop-OAIVectorStoreFileBatch -VectorStoreId "12345" -BatchId "67890"
Stops the batch of files with ID "67890" in the Vector Store with ID "12345".
```

---

### Parameters
#### **VectorStoreId**
The ID of the Vector Store where the batch of files is located.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **BatchId**
The ID of the batch of files to be stopped.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |false        |

---

### Syntax
```PowerShell
Stop-OAIVectorStoreFileBatch [-VectorStoreId] <Object> [-BatchId] <Object> [<CommonParameters>]
```
