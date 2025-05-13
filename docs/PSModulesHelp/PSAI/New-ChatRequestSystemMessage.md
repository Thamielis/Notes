New-ChatRequestSystemMessage
----------------------------

### Synopsis
Creates a new system message for a chat request.

---

### Description

The New-ChatRequestSystemMessage function creates a new system message for a chat request. It takes the user request as input and returns a hashtable containing the role and content of the system message.

---

### Examples
> EXAMPLE 1

```PowerShell
$userRequest = "Please wait while we connect you to an agent."
New-ChatRequestSystemMessage -userRequest $userRequest
This example creates a new system message with the specified user request.
```

---

### Parameters
#### **userRequest**
The user request for the chat.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Outputs
* System.Collections.Hashtable
A hashtable containing the role and content of the system message.

---

### Syntax
```PowerShell
New-ChatRequestSystemMessage [-userRequest] <Object> [<CommonParameters>]
```
