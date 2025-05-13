New-ChatRequestAssistantMessage
-------------------------------

### Synopsis
Creates a new chat request assistant message.

---

### Description

The New-ChatRequestAssistantMessage function creates a new chat request assistant message with the specified user request.

---

### Examples
> EXAMPLE 1

```PowerShell
$message = New-ChatRequestAssistantMessage -userRequest "Hello, I need assistance with my account."
$message
# Output: @{role='assistant'; content='Hello, I need assistance with my account.'}
```

---

### Parameters
#### **userRequest**
The user request to be included in the assistant message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Outputs
* Hashtable
    Returns a hashtable representing the assistant message with the role set to 'assistant' and the content set to the user request.

---

### Syntax
```PowerShell
New-ChatRequestAssistantMessage [-userRequest] <Object> [<CommonParameters>]
```
