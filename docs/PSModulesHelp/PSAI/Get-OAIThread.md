Get-OAIThread
-------------

### Synopsis
Retrieves information about a specific thread.

---

### Description

The Get-OAIThread function retrieves information about a specific thread identified by its thread ID.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/threads/getThread](https://platform.openai.com/docs/api-reference/threads/getThread)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIThread -threadId 12345
Retrieves information about the thread with ID 12345.
```

---

### Parameters
#### **threadId**
The ID of the thread to retrieve information for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Syntax
```PowerShell
Get-OAIThread [-threadId] <Object> [<CommonParameters>]
```
