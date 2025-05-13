Get-OAIVectorStoreFile
----------------------

### Synopsis
Retrieves files from a vector store.

---

### Description

The Get-OAIVectorStoreFile function retrieves files from a vector store based on the specified parameters. It sends a GET request to the vector store API endpoint and returns the files that match the specified criteria.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores-files/listFiles](https://platform.openai.com/docs/api-reference/vector-stores-files/listFiles)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIVectorStoreFile -VectorStoreId "12345" -Limit 50 -Order "asc" -After "2022-01-01" -Filter "name eq 'example.txt'"
Retrieves the first 50 files from the vector store with ID "12345", sorted in ascending order, that were created after January 1, 2022, and have the name "example.txt".
```

---

### Parameters
#### **VectorStoreId**
The ID of the vector store from which to retrieve the files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **limit**
The maximum number of files to retrieve. The default value is 20.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **order**
The order in which the files should be sorted. Valid values are 'asc' (ascending) and 'desc' (descending). The default value is 'desc'.
Valid Values:

* asc
* desc

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

#### **after**
Retrieve files that were created after the specified date and time.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |false        |

#### **before**
Retrieve files that were created before the specified date and time.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |5       |false        |

#### **filter**
A filter to apply to the files. This can be used to narrow down the results based on specific criteria. One of in_progress, completed, failed, cancelled.
Valid Values:

* in_progress
* completed
* failed
* cancelled

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |false        |

---

### Syntax
```PowerShell
Get-OAIVectorStoreFile [-VectorStoreId] <Object> [[-limit] <Object>] [[-order] <Object>] [[-after] <Object>] [[-before] <Object>] [[-filter] <Object>] [<CommonParameters>]
```
