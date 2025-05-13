Add-OAIVectorStore
------------------

### Synopsis
Uploads one or more files and creates a vector store.

---

### Description

The Add-OAIVectorStore function is a simple workflow using Invoke-OAIUploadFile and New-OAIVectorStore to upload files to OpenAI and create a vector store.

---

### Examples
> EXAMPLE 1

```PowerShell
Add-OAIVectorStore -Path "C:\Files"
This example uploads all the files located in the "C:\Files" directory to OAI and creates a vector store.
```

---

### Parameters
#### **Path**
Specifies the path where the files to be uploaded are located.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Add-OAIVectorStore [-Path] <Object> [<CommonParameters>]
```
