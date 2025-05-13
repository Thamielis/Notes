Show-OAIVectorStoreWebPage
--------------------------

### Synopsis
Opens the OpenAI Platform Vector Stores page in the default web browser.

---

### Description

The Show-OAIVectorStoreWebPage function opens the OpenAI Platform Vector Stores page in the default web browser. If a vector store ID is provided, it opens the specific vector store's page; otherwise, it opens the general vector stores page.

---

### Examples
> EXAMPLE 1

```PowerShell
Show-OAIVectorStoreWebPage -vectorStoreId "12345"
Opens the web browser and navigates to the OpenAI Platform Vector Store with ID "12345".
```
> EXAMPLE 2

```PowerShell
Show-OAIVectorStoreWebPage
Opens the web browser and navigates to the general OpenAI Platform Vector Stores page.
```

---

### Parameters
#### **vectorStoreId**
Specifies the ID of the vector store to open. If not provided, the function opens the general vector stores page.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|id     |

---

### Syntax
```PowerShell
Show-OAIVectorStoreWebPage [[-vectorStoreId] <Object>] [<CommonParameters>]
```
