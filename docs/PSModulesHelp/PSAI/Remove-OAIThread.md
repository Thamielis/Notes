Remove-OAIThread
----------------

### Synopsis
Removes a thread from the OpenAI API.

---

### Description

The Remove-OAIThread function removes a thread from the OpenAI API by sending a DELETE request to the specified thread ID.

---

### Related Links
* [https://platform.openai.com/docs/api-reference/threads/deleteThread](https://platform.openai.com/docs/api-reference/threads/deleteThread)

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-OAIThread -threadId "123456789"
This example removes the thread with the ID "123456789" from the OpenAI API.
```

---

### Parameters
#### **threadId**
The ID of the thread to be removed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Object]`|false   |1       |true (ByPropertyName)|

---

### Syntax
```PowerShell
Remove-OAIThread [[-threadId] <Object>] [<CommonParameters>]
```
