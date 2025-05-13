New-ChatRequestUserMessage
--------------------------

### Synopsis
Creates a new user message for a chat request.

---

### Description

The New-ChatRequestUserMessage function creates a new user message for a chat request. It takes a user request as input and returns a hashtable containing the role and content of the message.

---

### Examples
> EXAMPLE 1

```PowerShell
$userRequest = "Hello, I need assistance with my account."
New-ChatRequestUserMessage -userRequest $userRequest
# Returns:
# @{
#     'role'    = 'user'
#     'content' = 'Hello, I need assistance with my account.'
# }
```

---

### Parameters
#### **userRequest**
The user request to be included in the message.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

---

### Inputs
None.

---

### Outputs
* [Collections.Hashtable](https://learn.microsoft.com/en-us/dotnet/api/System.Collections.Hashtable)

---

### Syntax
```PowerShell
New-ChatRequestUserMessage [-userRequest] <Object> [<CommonParameters>]
```
