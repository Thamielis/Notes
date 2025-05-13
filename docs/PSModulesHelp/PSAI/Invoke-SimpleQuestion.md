Invoke-SimpleQuestion
---------------------

### Synopsis
Invokes a simple question to an AI assistant.

---

### Description

The Invoke-SimpleQuestion function is used to ask a simple question to an AI assistant. It requires the AssistantId parameter to specify the ID of the assistant to interact with. The function sends the question to the assistant, waits for the response, and returns the assistant's answer.

---

### Examples
> EXAMPLE 1

```PowerShell
$assistant = New-OAIAssistant
Invoke-SimpleQuestion -Question "What is the meaning of life?" -AssistantId $assistant.Id
Remove-OAIAssistant -Id $assistant.Id
```

---

### Parameters
#### **Question**
The question to ask the AI assistant.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |false        |

#### **AssistantId**
The ID of the AI assistant to interact with.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |2       |true (ByPropertyName)|id     |

---

### Syntax
```PowerShell
Invoke-SimpleQuestion [-Question] <Object> [[-AssistantId] <Object>] [<CommonParameters>]
```
