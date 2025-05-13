Invoke-QuickChat
----------------

### Synopsis
Invokes a quick chat session with an AI assistant.

---

### Description

This function allows you to interact with an AI assistant by asking questions and receiving responses in a chat-like manner.

---

### Examples
> EXAMPLE 1

```PowerShell
$assistant = New-OAIAssistant -Name 'Math Tutor'
Invoke-QuickChat $assistant.id
```

---

### Parameters
#### **AssistantId**
Specifies the ID of the assistant to interact with.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[Object]`|false   |1       |true (ByPropertyName)|id     |

---

### Syntax
```PowerShell
Invoke-QuickChat [[-AssistantId] <Object>] [<CommonParameters>]
```
