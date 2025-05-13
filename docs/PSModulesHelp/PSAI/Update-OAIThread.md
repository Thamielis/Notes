Update-OAIThread
----------------

### Synopsis
Updates an OAI thread with the specified thread ID, tool resources, and metadata.

---

### Description

The Update-OAIThread function is used to update an OAI (OpenAI) thread with the specified thread ID, tool resources, and metadata. It sends a POST request to the specified URL with the provided data.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/threads/modifyThread](https://platform.openai.com/docs/api-reference/threads/modifyThread)

---

### Examples
> EXAMPLE 1

```PowerShell
Update-OAIThread -threadId "12345" -toolResources "resource1, resource2" -metadata "key1=value1, key2=value2"
This example updates the OAI thread with the ID "12345" by associating it with the tool resources "resource1" and "resource2", and the metadata "key1=value1" and "key2=value2".
```

---

### Parameters
#### **threadId**
The ID of the thread to be updated. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **toolResources**
The tool resources to be associated with the thread.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |2       |false        |

#### **metadata**
The metadata to be associated with the thread.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |3       |false        |

---

### Syntax
```PowerShell
Update-OAIThread [-threadId] <Object> [[-toolResources] <Object>] [[-metadata] <Object>] [<CommonParameters>]
```
