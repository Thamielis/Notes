Update-OAIVectorStore
---------------------

### Synopsis
Updates an OAI Vector Store.

---

### Description

The Update-OAIVectorStore function is used to update an OAI Vector Store with the specified parameters.

---

### Examples
> EXAMPLE 1

```PowerShell
Update-OAIVectorStore -VectorStoreId "12345" -Name "New Vector Store" -ExpiresAfter @{ 'anchor' = '2022-12-31T00:00:00Z'; 'day' = 30 } -Metadata @{ 'key' = 'value' }
This example updates the Vector Store with ID "12345" by changing its name to "New Vector Store", setting an expiration time of 30 days after December 31, 2022, and adding a metadata key-value pair.
```

---

### Parameters
#### **VectorStoreId**
The ID of the Vector Store to update.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **Name**
The new name for the Vector Store.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **ExpiresAfter**
A hashtable specifying the expiration time for the Vector Store. The hashtable should contain the following keys:
* 'anchor': The anchor date and time.
* 'day': The number of days after the anchor date.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **Metadata**
A hashtable containing additional metadata for the Vector Store.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

---

### Syntax
```PowerShell
Update-OAIVectorStore [-VectorStoreId] <Object> [[-Name] <Object>] [[-ExpiresAfter] <Object>] [[-Metadata] <Object>] [<CommonParameters>]
```
