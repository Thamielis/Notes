Get-OAIVectorStoreItem
----------------------

### Synopsis
Retrieves an item from the OpenAI Vector Store.

---

### Description

The Get-OAIVectorStoreItem function retrieves an item from the OpenAI Vector Store based on the specified VectorStoreId.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores/retrieve](https://platform.openai.com/docs/api-reference/vector-stores/retrieve)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIVectorStoreItem -VectorStoreId vs_SvMW6In5Y5D5Sl44Aae05eho
Retrieves the vector store item with the specified ID.
```

---

### Parameters
#### **VectorStoreId**
The ID of the vector store item to retrieve.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|Id     |

---

### Inputs
None. You cannot pipe objects to this function.

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
Get-OAIVectorStoreItem [[-VectorStoreId] <Object>] [<CommonParameters>]
```
