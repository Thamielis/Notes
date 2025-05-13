Get-OAIThreadItem
-----------------

### Synopsis
Retrieves an item from an OpenAPI thread.

---

### Description

The Get-OAIThreadItem function retrieves an item from an OpenAPI thread based on the specified thread ID.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/threads/getThread](https://platform.openai.com/docs/api-reference/threads/getThread)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-OAIThreadItem -ThreadId 12345
Retrieves the item from the OpenAPI thread with the ID 12345.
```

---

### Parameters
#### **ThreadId**
The ID of the thread from which to retrieve the item.

|Type      |Required|Position|PipelineInput        |Aliases  |
|----------|--------|--------|---------------------|---------|
|`[Object]`|false   |1       |true (ByPropertyName)|thread_id|

---

### Syntax
```PowerShell
Get-OAIThreadItem [[-ThreadId] <Object>] [<CommonParameters>]
```
