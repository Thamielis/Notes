New-OAIVectorStore
------------------

### Synopsis
Creates a new vector store in OpenAI.

---

### Description

The New-OAIVectorStore function creates a new vector store in OpenAI using the OpenAI API. It allows you to specify the name, file IDs, expiration time, and metadata for the vector store.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores/create](https://platform.openai.com/docs/api-reference/vector-stores/create)

---

### Examples
> EXAMPLE 1

```PowerShell
New-OAIVectorStore -Name "MyVectorStore" -FileIds "file1", "file2" -ExpiresAfter (Get-Date).AddDays(7) -Metadata @{ "key1" = "value1"; "key2" = "value2" }
This example creates a new vector store named "MyVectorStore" with two file IDs, an expiration time of 7 days from the current date, and additional metadata.
```

---

### Parameters
#### **Name**
The name of the vector store.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|false   |1       |true (ByValue)|

#### **FileIds**
An array of file IDs to associate with the vector store.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExpiresAfter**
The expiration time for the vector store. After this time, the vector store will be deleted. 
"expires_after": { "anchor": "last_active_at", "days": 7 }

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Metadata**
A hashtable containing additional metadata for the vector store.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[Hashtable]`|false   |4       |false        |

---

### Syntax
```PowerShell
New-OAIVectorStore [[-Name] <Object>] [[-FileIds] <String[]>] [[-ExpiresAfter] <Object>] [[-Metadata] <Hashtable>] [<CommonParameters>]
```
