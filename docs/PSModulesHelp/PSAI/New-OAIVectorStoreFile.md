New-OAIVectorStoreFile
----------------------

### Synopsis
Creates a new file in the specified vector store.

---

### Description

The New-OAIVectorStoreFile function creates a new file in the specified vector store. It takes the VectorStoreId and FileIds as mandatory parameters. The function sends a POST request to the specified vector store's files endpoint to create the file.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/vector-stores-files/createFile](https://platform.openai.com/docs/api-reference/vector-stores-files/createFile)

---

### Examples
> EXAMPLE 1

```PowerShell
New-OAIVectorStoreFile -VectorStoreId "12345" -FileIds "file1", "file2"
This example creates two files with IDs "file1" and "file2" in the vector store with ID "12345".
```
> EXAMPLE 2

```PowerShell
dir *.md | Invoke-OAIUploadFile | New-OAIVectorStoreFile -VectorStoreId "12345"
This example uploads all Markdown files in the current directory to OpenAI and creates files in the vector store with ID "12345" for each uploaded file.
```

---

### Parameters
#### **VectorStoreId**
The ID of the vector store where the file will be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **FileIds**
The ID(s) of the file(s) to be created in the vector store. This parameter accepts pipeline input by property name.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|true    |2       |true (ByPropertyName)|id     |

---

### Syntax
```PowerShell
New-OAIVectorStoreFile [-VectorStoreId] <Object> [-FileIds] <Object> [<CommonParameters>]
```
