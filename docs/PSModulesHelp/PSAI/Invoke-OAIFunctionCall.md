Invoke-OAIFunctionCall
----------------------

### Synopsis
Invokes the specified tool functions based on the response received.

---

### Description

The Invoke-OAIFunctionCall function is used to invoke the specified tool functions based on the response received. It iterates through the tool calls in the response and executes each tool function.

---

### Parameters
#### **Response**
The response object containing the tool calls.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Invoke-OAIFunctionCall [[-Response] <Object>] [<CommonParameters>]
```
